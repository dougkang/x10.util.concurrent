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
import x10.lang.*;
 
/**
 * ConcurrentSkipListMap that should perform map functions atomically.
 * @author Vincent Ying
 * @author Jessica Wang
 */
 
public class ConcurrentSkipListMap[K,V] {

	private static val BASE_HEADER: Object = new Object();

	/**
	 * The topmost head index of the skiplist.
     	 */
    	private var head: HeadIndex[K, V];

    	/**
     	 * Seed for simple random number generator.  Not volatile since it
     	 * doesn't matter too much if different threads don't see updates.
     	 */
//	private transient var randomSeed: int;

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

	/* --------------------- Comparison Utilities ----------------------*/

	/**
	 * Represents a key with a comparator as a Comparable.
	 * SKIPPPPPPPPPPPPPPPPPPPPPPP
     	 */
	
	/*static final class ComparableUsingComparator[K] implements Comparable[K] {
        	val actualKey: Box[K];
        	val cmp: Comparator[? super K];
        
		public def this (key: K, cmp: Comparator[? super K]) {
	        	this.actualKey = key;
		        this.cmp = cmp;
        	}
        	public def compareTo(K k2): Int {
            		return cmp.compare(actualKey, k2);
        	}
    	}*/

	/**
     	 * If using comparator, return a ComparableUsingComparator, else
     	 * cast key as Comparable, which may cause ClassCastException,
     	 * which is propagated back to caller.
     	 */
    	private def comparable(key: Object) : Comparable[K] throws ClassCastException  {
        	if (key == null)
       			throw new NullPointerException();
        	//if (comparator != null)
            	//	return new ComparableUsingComparator<K>((K)key, comparator);
        	//else
            		return key as Comparable[K];
    	}

	/**
    	 * Compares using comparator or natural ordering. Used when the
	 * ComparableUsingComparator approach doesn't apply.
     	 */
    	public def compare(k1: Box[K], k2: Box[K]): Int throws ClassCastException {
    	        	return 0;
    	}

	/**
     	 * Returns true if given key greater than or equal to least and
     	 * strictly less than fence, bypassing either test if least or
     	 * fence are null. Needed mainly in submap operations.
     	 */
    	public def inHalfOpenRange(key: Box[K], least: Box[K], fence: Box[K]): Boolean {
	        if (key == null)
        		throw new NullPointerException();
        	return ((least == null || compare(key, least) >= 0) &&
                	(fence == null || compare(key, fence) <  0));
    	}

	/**
         * Returns true if given key greater than or equal to least and less
         * or equal to fence. Needed mainly in submap operations.
         */
    	public def inOpenRange(key: Box[K], least: Box[K], fence: Box[K]): Boolean {
        	if (key == null)
            		throw new NullPointerException();
	        return ((least == null || compare(key, least) >= 0) &&
        	        (fence == null || compare(key, fence) <= 0));
    	}

	/* --------------------- Traversal ----------------------*/

	/**
         * Returns a base-level node with key strictly less than given key,
     	 * or the base-level header if there is no such node.  Also
         * unlinks indexes to deleted nodes found along the way.  Callers
         * rely on this side-effect of clearing indices to deleted nodes.
         * @param key the key
         * @return a predecessor of key
         */
    	private def findPredecessor(key: Comparable[K]!): Node[K, V] { // FIX THIS HERE
        	if (key == null)
            		throw new NullPointerException(); // don't postpone errors
        	for (;;) {
            		var q: Index[K,V]! = head;
		        var r: Index[K,V]! = q.right;
            		
			for (;;) {
		                if (r != null) {
                    			var n: Node[K,V]! = r.node;
		  	                var k: K = n.key.value;
                    
					if (n.value == null) {
                        			if (!q.unlink(r))
                            				break;       // restart
				                r = q.right;         // reread r
                        			continue;
                    			}
  		                        if (key.compareTo(k) > 0) {
                        			q = r;
			                        r = r.right;
                        			continue;
                    			}
                		}
                		var d: Index[K,V]! = q.down;
		                if (d != null) {
                		    q = d;
                		    r = d.right;
                		} else
            			        return q.node;
           	 	}
        	}	
    	}


       /*
        * @param key the key
        * @return node holding key, or null if no such
        */
	private def findNode(key: Comparable[K]!): Node[K,V] {
        	for (;;) {
            		var b: Node[K,V]! = findPredecessor(key);
		        var n: Node[K,V]! = b.next;
	        	for (;;) {
        		        if (n == null)
        		        	return null;

		                var f: Node[K,V] = n.next;
                		if (n != b.next)                // inconsistent read
                    			break;
                		var v: Object = n.value;
                		if (v == null) {                // n is deleted
                    			n.helpDelete(b, f);
                    			break;
                		}
                		if (v == n || b.value == null)  // b is deleted
                    			break;
                		var c: Int = key.compareTo(n.key.value);
                		if (c == 0)
                    			return n;
                		else if (c < 0)
                    			return null;
                		b = n;
                		n = f;
            		}
        	}
    	}

	private def doGet(okey: Object): V {
        	var key: Comparable[K]! = comparable(okey);
        	var bound: Node[K,V] = null;
        	var q: Index[K,V]! = head;
        	var r: Index[K,V]! = q.right;
	        var n: Node[K,V]!;
        	var k: K;
        	var c: Int;
        
		for (;;) {
	        	var d: Index[K,V]!;
	            	// Traverse rights
            		if (r != null && (n = r.node) != bound && n.key != null) {
				k = n.key.value;
                		if ((c = key.compareTo(k)) > 0) {
                    			q = r;
                    			r = r.right;
                    			continue;
                		} else if (c == 0) {
                    			var v: Object = n.value;
                    			return (v != null)? v as V: getUsingFindNode(key);
                		} else
                    			bound = n;
            		}

            		// Traverse down
            		if ((d = q.down) != null) {
               			q = d;
               			r = d.right;
            		} else
               			break;
       		}

       		// Traverse nexts
       		for (n = q.node.next;  n != null; n = n.next) {
       			if (n.key != null) {
				k = n.key.value;
       				if ((c = key.compareTo(k)) == 0) {
               				var v: Object = n.value;
				        return (v != null)? v as V: getUsingFindNode(key);
               			} else if (c < 0)
               				break;
       			}
       		}
       		return null as V;
    	}

 	private def getUsingFindNode(key: Comparable[K]):V {
        /*
         * Loop needed here and elsewhere in case value field goes
         * null just as it is about to be returned, in which case we
         * lost a race with a deletion, so must retry.
         */
        	for (;;) {
            		var n: Node[K,V]! = findNode(key);
            		if (n == null)
                		return null as V;
            		var v: Object = n.value;
           		if (v != null)
                		return v as V;
        	}
    	}

    	/* ---------------- Insertion -------------- */

    	/**
     	 * Main insertion method.  Adds element if not present, or
     	 * replaces value if present and onlyIfAbsent is false.
     	 * @param kkey the key
     	 * @param value  the value that must be associated with key
     	 * @param onlyIfAbsent if should not insert if already present
     	 * @return the old value, or null if newly inserted
     	 
    	private def doPut(kkey: K, value: V, onlyIfAbsent: boolean) : V {
        	var key: Comparable[K]! = comparable(kkey);
        	for (;;) {
            		var b: Node[K,V]! = findPredecessor(key);
            		var n: Node[K,V]! = b.next;
            		for (;;) {
                		if (n != null) {
                    			var f: Node[K,V]! = n.next;
                    			if (n != b.next)               // inconsistent read
                        			break;;
                    			var v: Object = n.value;
                    			if (v == null) {               // n is deleted
                        			n.helpDelete(b, f);
                        			break;
                    			}
                    			if (v == n || b.value == null) // b is deleted
                        			break;
                    			var c: int! = key.compareTo(n.key);
                    			if (c > 0) {
                        			b = n;
                        			n = f;
                        			continue;
                    			}
                    			if (c == 0) {
                        			if (onlyIfAbsent || n.casValue(v, value))
                            				return v as V;
                        			else
                            				break; // restart if lost race to replace value
                    			}
                    			// else c < 0; fall through
                		}

                		var z: Node[K,V]! = new Node[K,V](kkey, value, n);
                		if (!b.casNext(n, z))
                    			break;         // restart if lost race to append to b
                		//var level: int! = randomLevel();
				var level: int! = 4;
                		if (level > 0)
                    			insertIndex(z, level);
                		return null as V;
            		}
        	}
    	} */

    	/**
     	 * Returns a random level for inserting a new node.
     	 
    	private def randomLevel() : int {
        	var x: int! = randomSeed;
        	x ^= x << 13;
        	x ^= x >>> 17;
        	randomSeed = x ^= x << 5;
        	if ((x & 0x8001) != 0) // test highest and lowest bits
            		return 0;
        	var level: int = 1;
        	while (((x >>>= 1) & 1) != 0) ++level;
        	return level;
    	} */

	public static def main(args: Rail[String]!) {
		var test: Node[Int, Int]! = null ;
		var test2: Node[Int, Int]! = new Node[Int, Int](test);

		if(test2.equals(test2))
			Console.OUT.println("Equals operation works");
		else Console.OUT.println("Equals operation does not work");
	}



}
