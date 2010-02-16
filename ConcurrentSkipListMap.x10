/*Things to know:
putting a ! after a variable declaration solves some compiler issues
var declared a changeable variable, val declares an unchangeable one
() is used to index into an array
[] is used to specify a type of a multi-type class
git add files
git commit -m "COMMENTS"
git push git@github.com:dougkang/x10.util.concurrent.git to push
need to change all the strings to objects, or better yet, to
arbitrary key value variables like the HashMap underneath
*/
 
import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.atomic.AtomicInteger;
 
 
/**
 * ConcurrentSkipListMap that should perform map functions atomically.
 * @author Vincent Ying
 * @author Jessica Wang
 */
 
public class ConcurrentSkipListMap {

	private static val BASE_HEADER: Object = new Object();


	/* --------------------- Node ----------------------*/

	static class Node[K, V] {
		val key: Box[K];
		var value: Object;
		var next: Node[K, V];
		
		/**
		 * Constructor 
		 */
		public def this (key: K, value: Object, next: Node[K,V]) {
			this.key = key;
			this.value = value;
			this.next = next;
		}	
 		
		/**
		 * Create a new marker node
		 */
		public def this (next: Node[K,V]) {
		 	this.key = null;	
			this.value = this;
			this.next = next;
		}	

		/**
		 * compareAndSet value field
		 */
		public def casValue (cmp: Object, value: Object) : Boolean {
			atomic {
				if(this.value.equals(cmp)) {
					this.value = value;
					return true;
				}
				else
					return false; 
			}
		}

		/**
		 * compareAndSet next field
		 */
		public def casNext (cmp: Node[K, V], value: Node[K, V]) : Boolean {
			atomic {
				if(this.next.equals(cmp)) {
					this.next = value;
					return true;
				}
				else
					return false;
			}
		}

		/**
		 * Returns true if node is a marker
		 */
		public def isMarker() : Boolean {
			return value == this;
		}

		/**
		 * Returns true if this noe is the header of base-level list
		 */
		public def isBaseHeader() : Boolean {
			return value == BASE_HEADER;
		}

		/**
		 * Tries to append a deletion marker to this node
		 */
		public def appendMarker(f: Node[K, V]) : Boolean {
			return casNext(f, new Node[K, V](f));
		}

		/**
		 * Helps out a deletion by appending marker or unlinking from
		 * predecessor. This is called during traversals when value field is null
		 * @param b is predecessor
		 * @param f is successor
		 */
		public def helpDelete(b: Node[K, V]!, f: Node[K, V]!) : void {
			if(f == next && this == b.next)
			{
				if(f == null || f.value != f)
					appendMarker(f);
				else
					b.casNext(this, f.next);
			}
		}

		/**
		 * Returns value if this node contains a valid key-value pair, else null
		 * the value to be returned is the node's value if it isn't a marker or header
                 * or is deleted.
		 */
		public def getValidValue() : V {
			var v: Object = value;
			if(v == this || v == BASE_HEADER)
				return null as V;
			return v as V;
		}

		/**
		 * Creates and returns a new SimpleImmutableEntry
		 * NEEDS TO BE IMPLEMENTED, WE ARE NOT SURE
		 * AbstractMap.SimpleImmutableEntry<K,V> createSnapShot()
		 */
	}

	/* --------------------- Indexing ----------------------*/
		
	static class Index[K, V] {
		val node: Node[K, V]!;
		val down: Index[K, V];
		var right: Index[K, V];

		/** 
		 * Constructor for Index
		 */
		public def this(node: Node[K, V], down: Index[K, V], right: Index[K, V]) {
			this.node = node;
			this.down = down;
			this.right = right;
		}

		/**
		 * compareAndSet right field
		 */
		public final def casRight(cmp: Index[K, V], value: Index[K, V]) : Boolean {
			atomic {
				if(this.right.equals(cmp)) {
					this.right = value;
					return true;
				}
				else
					return false;
			}
		}

		/**
		 * returns true if node this indexes has been deleted 
		 */
		public final def indexesDeletedNode() : Boolean {
			return node.value == null;
		}

		/**
		 * Tries to CAS newSucc as successor.
		 * If the node being indexed is known to be deleted
		 * it doesn't try to link in.
		 * @param succ: the expected current successor
		 * @param newSucc: new successor
		 */
		public final def link(succ: Index[K,V], newSucc: Index[K,V]!) : Boolean {
			var n:Node[K, V]! = node;
			newSucc.right = succ;
			return (n.value != null && casRight(succ, newSucc));
		}

		/**
		 * Tries to CAS right field to skip over apparent successor succ
		 * Fails if node is known to be deleted
		 * @param succ: the expected current successor
		 */
		public final def unlink(succ: Index[K,V]!) : Boolean {
			return (!indexesDeletedNode() && casRight(succ, succ.right));
		}

	}		
		
	/* --------------------- Head nodes ----------------------*/
	
	static final class HeadIndex[K, V] extends Index[K, V] {
		val level: Int;
		public def this (node: Node[K, V], down: Index[K, V], right: Index[K, V], level: Int) {
			super(node, down, right);
			this.level = level;
		}
	}

	public static def main(args: Rail[String]!) {
		var test: Node[Int, Int]! = null ;
		var test2: Node[Int, Int]! = new Node[Int, Int](test);

		if(test2.equals(test2))
			Console.OUT.println("Equals operation works");
		else Console.OUT.println("Equals operation does not work");
	}



}
