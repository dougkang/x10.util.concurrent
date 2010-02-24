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
import x10.util.Map.Entry;
import x10.util.*;
import x10.util.concurrent.atomic.AtomicInteger;
import x10.lang.*;
 
/**
 * ConcurrentSkipListMap that should perform map functions atomically.
 * @author Vincent Ying
 * @author Jessica Wang
 */
 
public class ConcurrentSkipListMap[K,V] {

    	/**
     	 * Generates the initial random seed for the cheaper per-instance
     	 * random number generators used in randomLevel.
     	 */
	private static val seedGenerator: Random! = new Random();

	private static val BASE_HEADER: Object! = new Object();

	/**
	 * The topmost head index of the skiplist.
     	 */
    	private var head: HeadIndex[K, V];

    	/**
     	 * The comparator used to maintain order in this map, or null
     	 * if using natural ordering.
     	 * @serial
     	 */
    	private var comparator: Comparator[K];

    	/**
     	 * Seed for simple random number generator.  Not volatile since it
     	 * doesn't matter too much if different threads don't see updates.
     	 */
	private transient var randomSeed: Int;

    	/**
     	 * Initializes or resets state. Needed by constructors, clone,
     	 * clear, readObject. and ConcurrentSkipListSet.clone.
     	 * (Note that comparator must be separately initialized.)
     	 */
    	private proto def initialize() : void {
        	//keySet = null;
        	//entrySet = null;
        	//values = null;
        	//descendingMap = null;
        	randomSeed = seedGenerator.nextInt() | 0x0100; // ensure nonzero
//        	head = new HeadIndex[K,V](new Node[K,V](null as K, BASE_HEADER, null as Node[K,V]), null, null, 1);
    	}

    	/**
     	 * compareAndSet head node
     	 */
    	private atomic def casHead(cmp: HeadIndex[K,V],  val: HeadIndex[K,V]) : Boolean {
		if (cmp == val) {
			this.head = val;
        		return true;
 		}   	
		else 
			return false;
	}

	/* --------------------- Node ----------------------*/

	static class Node[K, V] {
		val key: Object;
		var value: Object;
		var next: Node[K, V];
		
		/**
		 * Constructor 
		 */
		public def this (key: Object, value: Object, next: Node[K,V]) {
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
		public def getValidValue() : Object {
			var v: Object = value;
			if(v == this || v == BASE_HEADER)
				return null;
			return v;
		}

        	/**
         	 * Creates and returns a new SimpleImmutableEntry holding current
         	 * mapping if this node holds a valid value, else null.
         	 * @return new entry or null
         	 */
        	 public def createSnapshot(): SimpleImmutableEntry[K,V] {
            	 	var v: Object = getValidValue() as Object;
            		if (v == null)
                		return null;
            		return new SimpleImmutableEntry[K,V](key, v);
        	 }
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
	
	static final class ComparableUsingComparator[K] implements Comparable[K] {
        	val actualKey: Object;
        	var cmp: Comparator[K];
        
		public def this (key: Object, cmp: Comparator[K]) {
	        	this.actualKey = key;
		        this.cmp = cmp;
        	}
        	public def compareTo(k2: K): Int {
            		return cmp.compare(actualKey as K, k2);
        	}
    	}

	/**
     	 * If using comparator, return a ComparableUsingComparator, else
     	 * cast key as Comparable, which may cause ClassCastException,
     	 * which is propagated back to caller.
     	 */
    	private def comparable(key: Object) : Comparable[K] throws ClassCastException  {
        	if (key == null)
       			throw new NullPointerException();
        	if (comparator != null)
            		return new ComparableUsingComparator[K](key, comparator);
        	else
            		return key as Comparable[K];
    	}

	/**
    	 * Compares using comparator or natural ordering. Used when the
	 * ComparableUsingComparator approach doesn't apply.
     	 */
    	public def compare(k1: Object, k2: Object): Int throws ClassCastException {
    		var cmp: Comparator[K]! = comparator;
        	if (cmp != null)
            		return cmp.compare(k1 as K, k2 as K);
        	else
            		return (k1 as Comparable[K]).compareTo(k2 as K);
    	}

	/**
     	 * Returns true if given key greater than or equal to least and
     	 * strictly less than fence, bypassing either test if least or
     	 * fence are null. Needed mainly in submap operations.
     	 */
    	public def inHalfOpenRange(key: Object, least: Object, fence: Object): Boolean {
	        if (key == null)
        		throw new NullPointerException();
        	return ((least == null || compare(key, least) >= 0) &&
                	(fence == null || compare(key, fence) <  0));
    	}

	/**
         * Returns true if given key greater than or equal to least and less
         * or equal to fence. Needed mainly in submap operations.
         */
    	public def inOpenRange(key: Object, least: Object, fence: Object): Boolean {
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
		  	                var k: Object = n.key;
                    
					if (n.value == null) {
                        			if (!q.unlink(r))
                            				break;       // restart
				                r = q.right;         // reread r
                        			continue;
                    			}
  		                        if (key.compareTo(k as K) > 0) {
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
                		var c: Int = key.compareTo(n.key as K);
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
        	var k: Object;
        	var c: Int;
        
		for (;;) {
	        	var d: Index[K,V]!;
	            	// Traverse rights
            		if (r != null && (n = r.node) != bound && n.key != null) {
				k = n.key;
                		if ((c = key.compareTo(k as K)) > 0) {
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
				k = n.key;
       				if ((c = key.compareTo(k as K)) == 0) {
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
     	 */
    	private def doPut(kkey: Object, value: Object, onlyIfAbsent: boolean) : V {
        	var key: Comparable[K]! = comparable(kkey as Object);
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
                    			var c: Int = key.compareTo(n.key as K);
                    			if (c > 0) {
                        			b = n;
                        			n = f;
                        			continue;
                    			}
                    			if (c == 0) {
                        			if (onlyIfAbsent || n.casValue(v, value as Object))
                            				return v as V;
                        			else
                            				break; // restart if lost race to replace value
                    			}
                    			// else c < 0; fall through
                		}

                		var z: Node[K,V]! = new Node[K,V](kkey, value as Object, n);
                		if (!b.casNext(n, z))
                    			break;         // restart if lost race to append to b
                		var level: Int = randomLevel();
                		if (level > 0)
                    			insertIndex(z, level);
                		return null as V;
            		}
        	}
    	} 

    	/**
     	 * Returns a random level for inserting a new node.
     	 */
    	private def randomLevel() : Int {
        	var x: Int = randomSeed;
        	x ^= x << 13;
        	x ^= x >>> 17;
        	randomSeed = x ^= x << 5;
        	if ((x & 0x8001) != 0) // test highest and lowest bits
            		return 0;
        	var level: Int = 1;
        	while (((x >>>= 1) & 1) != 0) ++level;
        	return level;
    	}

    	/**
     	 * Creates and adds index nodes for the given node.
     	 * @param z the node
     	 * @param level the level of the index
      	 */
    	private def insertIndex(z: Node[K,V], templevel: Int) : void {
        	var h: HeadIndex[K,V]! = head;
        	var max: Int = h.level;
		var level: Int = templevel;

        	if (level <= max) {
            		var idx: Index[K,V] = null;
            		for (var i: Int = 1; i <= level; ++i)
                		idx = new Index[K,V](z, idx, null);
            		addIndex(idx, h, level);

        	} else { // Add a new level
            		/*
             	 	 * To reduce interference by other threads checking for
             	 	 * empty levels in tryReduceLevel, new levels are added
             	 	 * with initialized right pointers. Which in turn requires
             	 	 * keeping levels in an array to access them while
             	 	 * creating new head index nodes from the opposite
             	 	 * direction.
             	 	 */
            		level = max + 1;
            		var idxs: GrowableRail[Index[K,V]]! = new GrowableRail[Index[K,V]](level+1);
            		var idx: Index[K,V] = null;
            		for (var i:Int = 1; i <= level; ++i)
                		idxs(i) = idx = new Index[K,V](z, idx, null);

            		var oldh: HeadIndex[K,V]!;
            		var k: Int;
            		for (;;) {
                		oldh = head;
                		var oldLevel: Int = oldh.level;
                		if (level <= oldLevel) { // lost race to add level
                    			k = level;
                    			break;
                		}
                		var newh: HeadIndex[K,V] = oldh;
                		var oldbase: Node[K,V] = oldh.node;
                		for (var j: Int = oldLevel+1; j <= level; ++j)
                    			newh = new HeadIndex[K,V](oldbase, newh, idxs(j), j);
                		if (casHead(oldh, newh)) {
                    			k = oldLevel;
                    			break;
                		}
            		}
            		addIndex(idxs(	k), oldh, k);
        	}
    	}

    	/**
     	 * Adds given index nodes from given level down to 1.
     	 * @param idx the topmost index node being inserted
     	 * @param h the value of head to use to insert. This must be
     	 * snapshotted by callers to provide correct insertion level
     	 * @param indexLevel the level of the index
     	 */
    	private def addIndex(idx: Index[K,V]!, h: HeadIndex[K,V]!, indexLevel: Int) : void {
        	// Track next level to insert in case of retries
        	var insertionLevel: Int = indexLevel;
        	var key: Comparable[K]! = comparable(idx.node.key);
        	if (key == null) throw new NullPointerException();

        	// Similar to findPredecessor, but adding index nodes along
        	// path to key.
        	for (;;) {
            		var j: Int = h.level;
            		var q: Index[K,V]! = h;
            		var r: Index[K,V]! = q.right;
            		var t: Index[K,V]! = idx;
            		for (;;) {
                		if (r != null) {
                    			var n:Node[K,V]! = r.node;
                    			// compare before deletion check avoids needing recheck
                    			var c: Int = key.compareTo(n.key as K);
                    			if (n.value == null) {
                        			if (!q.unlink(r))
                        	    			break;
                        			r = q.right;
                    		    		continue;
                    			}
                    			if (c > 0) {
                        			q = r;
                        			r = r.right;
                        			continue;
                    			}
                		}
	
                		if (j == insertionLevel) {
                    			// Don't insert index if node already deleted
                    			if (t.indexesDeletedNode()) {
                        			findNode(key); // cleans up
                        			return;
                    			}
                    			if (!q.link(r, t))
                        			break; // restart
                    			if (--insertionLevel == 0) {
                        			// need final deletion check before return
                        			if (t.indexesDeletedNode())
                        	    			findNode(key);
                        			return;
                    			}
                		}
	
                		if (--j >= insertionLevel && j < indexLevel)
                    			t = t.down;
                		q = q.down;
                		r = q.right;
            		}	
        	}
    	}

    	/* ---------------- Deletion -------------- */

    	/**
     	 * Main deletion method. Locates node, nulls value, appends a
     	 * deletion marker, unlinks predecessor, removes associated index
     	 * nodes, and possibly reduces head index level.
     	 *
     	 * Index nodes are cleared out simply by calling findPredecessor.
     	 * which unlinks indexes to deleted nodes found along path to key,
     	 * which will include the indexes to this node.  This is done
     	 * unconditionally. We can't check beforehand whether there are
     	 * index nodes because it might be the case that some or all
     	 * indexes hadn't been inserted yet for this node during initial
     	 * search for it, and we'd like to ensure lack of garbage
     	 * retention, so must call to be sure.
     	 *
     	 * @param okey the key
     	 * @param value if non-null, the value that must be
     	 * associated with key
     	 * @return the node, or null if not found
     	 */
    	final def doRemove(okey: Object, value: Object) : V {
        	var key: Comparable[K]! = comparable(okey);
        	for (;;) {
            		var b: Node[K,V]! = findPredecessor(key);
            		var n: Node[K,V]! = b.next;
            		for (;;) {
                		if (n == null)
                    			return null as V;
                		var f: Node[K,V] = n.next;
                		if (n != b.next)                    // inconsistent read
                    			break;
                		var v: Object = n.value;
                		if (v == null) {                    // n is deleted
                    			n.helpDelete(b, f);
                    			break;
                		}
                		if (v == n || b.value == null)      // b is deleted
                    			break;
                		var c: Int = key.compareTo(n.key as K);
                		if (c < 0)
                    			return null as V;
               	 		if (c > 0) {
                    			b = n;
                    			n = f;
                    			continue;
                		}
                		if (value != null && !value.equals(v))
                    			return null as V;
                		if (!n.casValue(v, null))
                    			break;
                		if (!n.appendMarker(f) || !b.casNext(n, f))
                    			findNode(key);                  // Retry via findNode
                		else {
                    			findPredecessor(key);           // Clean index
                    			if (head.right == null)
                        		tryReduceLevel();
                		}
                		return v as V;
            		}
        	}
    	}

    	/**
     	 * Possibly reduce head level if it has no nodes.  This method can
     	 * (rarely) make mistakes, in which case levels can disappear even
     	 * though they are about to contain index nodes. This impacts
     	 * performance, not correctness.  To minimize mistakes as well as
     	 * to reduce hysteresis, the level is reduced by one only if the
     	 * topmost three levels look empty. Also, if the removed level
     	 * looks non-empty after CAS, we try to change it back quick
     	 * before anyone notices our mistake! (This trick works pretty
     	 * well because this method will practically never make mistakes
     	 * unless current thread stalls immediately before first CAS, in
     	 * which case it is very unlikely to stall again immediately
     	 * afterwards, so will recover.)
     	 *
     	 * We put up with all this rather than just let levels grow
     	 * because otherwise, even a small map that has undergone a large
     	 * number of insertions and removals will have a lot of levels,
     	 * slowing down access more than would an occasional unwanted
    	 * reduction.
     	 */
    	private def tryReduceLevel() : void{
        	var h:HeadIndex[K,V]! = head;
        	var d:HeadIndex[K,V]!;
        	var e:HeadIndex[K,V]!;
        	if (h.level > 3 &&
            		(d = h.down as HeadIndex[K,V]) != null &&
            		(e = d.down as HeadIndex[K,V]) != null &&
            		e.right == null &&
            		d.right == null &&
           		h.right == null &&
            		casHead(h, d) && // try to set
            		h.right != null) // recheck
            			casHead(d, h);   // try to backout
    	}

	/* ---------------- Finding and removing first element -------------- */

	/**
     	 * Specialized variant of findNode to get first valid node.
     	 * @return first node or null if empty
     	 */
    	def findFirst() : Node[K,V] {
        	for (;;) {
            		var b: Node[K,V]! = head.node;
            		var n: Node[K,V]! = b.next;
            		if (n == null)
                		return null;
            		if (n.value != null)
                		return n;
            		n.helpDelete(b, n.next);
        	}
    	}

    	/**
     	 * Removes first entry; returns its snapshot.
     	 * @return null if empty, else snapshot of first entry
     	 */
   	 def doRemoveFirstEntry() : Map.Entry[K,V]  {
        	for (;;) {
            		var b: Node[K,V]! = head.node;
            		var n: Node[K,V]! = b.next;
            		if (n == null)
                		return null;
            		var f: Node[K,V] = n.next;
            		if (n != b.next)
                		continue;
            		var v: Object = n.value;
		        if (v == null) {
                		n.helpDelete(b, f);
                		continue;
            		}
            		if (!n.casValue(v, null))
                		continue;
            		if (!n.appendMarker(f) || !b.casNext(n, f))
                		findFirst(); // retry
            		clearIndexToFirst();
            		return new SimpleImmutableEntry[K,V](n.key, v);
		}
    	}

    	/**
     	 * Clears out index nodes associated with deleted first entry.
     	 */
    	private def clearIndexToFirst() : void {
        	for (;;) {
            		var q: Index[K,V]! = head;
            		for (;;) {
                		var r: Index[K,V]! = q.right;
                		if (r != null && r.indexesDeletedNode() && !q.unlink(r))
                    			break;
                		if ((q = q.down) == null) {
                    			if (head.right == null)
                        			tryReduceLevel();
                    			return;
               			 }
           		}
       		 }
   	 }

    	/* ---------------- Finding and removing last element -------------- */

    	/**
     	 * Specialized version of find to get last valid node.
     	 * @return last node or null if empty
     	 */
    	public def findLast() : Node[K,V] {
        	/*
         	 * findPredecessor can't be used to traverse index level
         	 * because this doesn't use comparisons.  So traversals of
         	 * both levels are folded together.
         	 */
        	var q: Index[K,V]! = head;
        	for (;;) {
            		var d: Index[K,V];
			var r: Index[K,V]!;
            		if ((r = q.right) != null) {
                		if (r.indexesDeletedNode()) {
                    			q.unlink(r);
                    			q = head; // restart
                		}
                		else
                    			q = r;
            		} else if ((d = q.down) != null) {
                		q = d;
            		} else {
                		var b: Node[K,V]! = q.node;
                		var n: Node[K,V]! = b.next;
                		for (;;) {
                    			if (n == null)
                        			return (b.isBaseHeader())? null : b;
                    			var f: Node[K,V] = n.next;            // inconsistent read
                    			if (n != b.next)
                        			break;
                    			var v: Object = n.value;
                    			if (v == null) {                 // n is deleted
                        			n.helpDelete(b, f);
                        			break;
                    			}
                    			if (v == n || b.value == null)   // b is deleted
                        			break;
                    			b = n;
                    			n = f;
                		}
                		q = head; // restart
            		}
        	}
    	}

    	/**
     	 * Specialized variant of findPredecessor to get predecessor of last
     	 * valid node.  Needed when removing the last entry.  It is possible
     	 * that all successors of returned node will have been deleted upon
     	 * return, in which case this method can be retried.
     	 * @return likely predecessor of last node
     	 */
    	private def findPredecessorOfLast() : Node[K,V] {
        	for (;;) {
            		var q: Index[K,V]! = head;
            		for (;;) {
                		var d: Index[K,V];
				var r: Index[K,V]!;
                		if ((r = q.right) != null) {
                    			if (r.indexesDeletedNode()) {
                        			q.unlink(r);
                        			break;    // must restart
                    			}
                    			// proceed as far across as possible without overshooting
                    			if (r.node.next != null) {
                        			q = r;
                        			continue;
                    			}
                		}
                		if ((d = q.down) != null)
                    			q = d;
                		else
                    			return q.node;
            		}
        	}
    	}

    	/**
     	 * Removes last entry; returns its snapshot.
     	 * Specialized variant of doRemove.
     	 * @return null if empty, else snapshot of last entry
     	 */
    	public def doRemoveLastEntry() : Map.Entry[K,V] {
        	for (;;) {
            		var b: Node[K,V]! = findPredecessorOfLast();
            		var n: Node[K,V]! = b.next;
            		if (n == null) {
                		if (b.isBaseHeader())               // empty
                    			return null;
                		else
                    			continue; // all b's successors are deleted; retry
            		}
            		for (;;) {
                		var f: Node[K,V] = n.next;
                		if (n != b.next)                    // inconsistent read
                    			break;
                		var v: Object = n.value;
                		if (v == null) {                    // n is deleted
                    			n.helpDelete(b, f);
                    			break;
                		}
                		if (v == n || b.value == null)      // b is deleted
                    			break;
                		if (f != null) {
                    			b = n;
                    			n = f;
                    			continue;
                		}
                		if (!n.casValue(v, null))
                    			break;
                		var key: Object = n.key;
                		var ck: Comparable[K] = comparable(key);
                		if (!n.appendMarker(f) || !b.casNext(n, f))
                    			findNode(ck);                  // Retry via findNode
                		else {
                    			findPredecessor(ck);           // Clean index
                    			if (head.right == null)
                        			tryReduceLevel();
                		}
                		return new SimpleImmutableEntry[K,V](key,v);
            		}
        	}
    	} 

    	/* ---------------- Relational operations -------------- */

    	// Control values OR'ed as arguments to findNear

    	private static val EQ: Int = 1;
    	private static val LT: Int = 2;
    	private static val GT: Int = 0; // Actually checked as !LT

    	/**
     	 * Utility for ceiling, floor, lower, higher methods.
     	 * @param kkey the key
     	 * @param rel the relation -- OR'ed combination of EQ, LT, GT
     	 * @return nearest node fitting relation, or null if no such
     	 */
    	public def findNear(kkey: Object, rel: Int) : Node[K,V] {
        	var key: Comparable[K]! = comparable(kkey as Object);
        	for (;;) {
            		var b: Node[K,V]! = findPredecessor(key);
            		var n: Node[K,V]! = b.next;
           		for (;;) {
                		if (n == null)
                    			return ((rel & LT) == 0 || b.isBaseHeader())? null : b;
                		var f:  Node[K,V] = n.next;
                		if (n != b.next)                  // inconsistent read
                    			break;
                		var v: Object = n.value;
                		if (v == null) {                  // n is deleted
                    			n.helpDelete(b, f);
                    			break;
                		}
                		if (v == n || b.value == null)    // b is deleted
                    			break;
                		var c: Int = key.compareTo(n.key as K);
                		if ((c == 0 && (rel & EQ) != 0) || (c <  0 && (rel & LT) == 0))
                    			return n;
                		if ( c <= 0 && (rel & LT) != 0)
                    			return (b.isBaseHeader())? null : b;
                		b = n;
                		n = f;
            		}
        	}
    	} 

    	/**
     	 * Returns SimpleImmutableEntry for results of findNear.
     	 * @param key the key
     	 * @param rel the relation -- OR'ed combination of EQ, LT, GT
     	 * @return Entry fitting relation, or null if no such
     	 */
    	 public def getNear(key: Object, rel: Int) : SimpleImmutableEntry[K,V] {
        	for (;;) {
            		var n: Node[K,V]! = findNear(key, rel);
            		if (n == null)
                		return null;
            		var e: SimpleImmutableEntry[K,V] = n.createSnapshot();
            		if (e != null)
                		return e;
        	}
    	}

    	/* ---------------- Constructors -------------- */

    	/**
     	 * Constructs a new, empty map, sorted according to the
     	 * {@linkplain Comparable natural ordering} of the keys.
     	 */
    	public def this() {
        	this.comparator = null;
        	initialize();
    	} 

    	/**
     	 * Constructs a new, empty map, sorted according to the specified
     	 * comparator.
     	 *
     	 * @param comparator the comparator that will be used to order this map.
     	 *        If <tt>null</tt>, the {@linkplain Comparable natural
    	 *        ordering} of the keys will be used.
     	 */
    	public def this(comparator: Comparator[K]) {
        	this.comparator = comparator;
        	initialize();
    	}

    	/**
     	 * Constructs a new map containing the same mappings as the given map,
     	 * sorted according to the {@linkplain Comparable natural ordering} of
     	 * the keys.
     	 *
     	 * @param  m the map whose mappings are to be placed in this map
     	 * @throws ClassCastException if the keys in <tt>m</tt> are not
     	 *         {@link Comparable}, or are not mutually comparable
     	 * @throws NullPointerException if the specified map or any of its keys
     	 *         or values are null
     	 */
    	public def this(m: Map[K, V]) {
        	this.comparator = null;
        	initialize();
        	putAll(m);
    	}

    	/**
     	 * Constructs a new map containing the same mappings and using the
     	 * same ordering as the specified sorted map.
     	 *
     	 * @param m the sorted map whose mappings are to be placed in this
     	 *        map, and whose comparator is to be used to sort this map
     	 * @throws NullPointerException if the specified sorted map or any of
     	 *         its keys or values are null
	 * NOT IMPLEMENTED SINCE SortedMap is not implemented in x10
	 * Users will not need this constructor
     	 */

    	/**
     	 * Returns a shallow copy of this <tt>ConcurrentSkipListMap</tt>
     	 * instance. (The keys and values themselves are not cloned.)
     	 *
     	 * @return a shallow copy of this map
     	 */
    	public def clone() : ConcurrentSkipListMap[K,V] {
        	clone: ConcurrentSkipListMap[K,V]! = null;
        	
		//Not implemented in x10, also seems rather unecessary
		//since clone method just sets value fields in super to null
		//try {
            	//	clone = super.clone() as ConcurrentSkipListMap[K,V];
        	//} catch (e: IllegalOperationException) {
            	//	throw new IllegalOperationException();
        	//}

        	clone.initialize();
        	clone.buildFromSorted(this);
        	return clone;
    	}

    	/**
     	 * Streamlined bulk insertion to initialize from elements of
     	 * given sorted map.  Call only from constructor or clone
     	 * method.
     	 */
    	private def buildFromSorted(map: ConcurrentSkipListMap[K, V]) : void {
        	/*if (map == null)
            		throw new NullPointerException();

        	var h: HeadIndex[K,V] = head;
        	var basepred: Node[K,V] = h.node;

        	// Track the current rightmost node at each level. Uses an
        	// ArrayList to avoid committing to initial or maximum level.
        	var preds: ArrayList[Index[K,V]] = new ArrayList[Index[K,V]]();

        	// initialize
        	for (var i: Int = 0; i <= h.level; ++i)
            		preds.add(null);
        	var q: Index<K,V> = h;
        	for (int i = h.level; i > 0; --i) {
            		preds.set(i, q);
            		q = q.down;
        	}

        	var it: Iterator[ Map.Entry[K, V]] = map.entrySet().iterator();
        	while (it.hasNext()) {
            		var e: Map.Entry[K, V] = it.next();
            		var j: Int = randomLevel();
            		if (j > h.level) 
				j = h.level + 1;
            		var k: K = e.getKey();
            		var v: V = e.getValue();
            		if (k == null || v == null)
                		throw new NullPointerException();
            		var z: Node[K,V] = new Node[K,V](k, v, null);
            		basepred.next = z;
            		basepred = z;
            		if (j > 0) {
                		var idx: Index[K,V] = null;
                		for (var i: Int = 1; i <= j; ++i) {
                    			idx = new Index[K,V](z, idx, null);
                    			if (i > h.level)
                        			h = new HeadIndex[K,V](h.node, h, idx, i);

                    			if (i < preds.size()) {
                        			preds.get(i).right = idx;
                        			preds.set(i, idx);
                    			} else
                        			preds.add(idx);
                		}
            		}
        	}
        	head = h;*/
    	} 

	/**
	 *
	 * Method that is supposed to be inherited from AbstractMap class
	 * Implemented here because AbstractMap does not exist in x10
	 */
	public proto def putAll(m: Map[K,V]) : void {
        	//for (e: Map.Entry[K,V] e : m.entrySet())
        	//	put(e.getKey(), e.getValue());
    	}

	/* ---------------- Serialization -------------- */
	// Not implemented because writeObject is not available in x10
	// No ObjectStreams
	    /**
	     * Save the state of this map to a stream.
	     *
	     * @serialData The key (Object) and value (Object) for each
	     * key-value mapping represented by the map, followed by
	     * <tt>null</tt>. The key-value mappings are emitted in key-order
	     * (as determined by the Comparator, or by the keys' natural
	     * ordering if no Comparator).
	     *
	    private void writeObject(java.io.ObjectOutputStream s)
		throws java.io.IOException {
		// Write out the Comparator and any hidden stuff
		s.defaultWriteObject();

		// Write out keys and values (alternating)
		for (Node<K,V> n = findFirst(); n != null; n = n.next) {
		    V v = n.getValidValue();
		    if (v != null) {
		        s.writeObject(n.key);
		        s.writeObject(v);
		    }
		}
		s.writeObject(null);
	    }

	    /**
	     * Reconstitute the map from a stream.
	     *
	    private void readObject(final java.io.ObjectInputStream s)
		throws java.io.IOException, ClassNotFoundException {
		// Read in the Comparator and any hidden stuff
		s.defaultReadObject();
		// Reset transients
		initialize();

		/*
		 * This is nearly identical to buildFromSorted, but is
		 * distinct because readObject calls can't be nicely adapted
		 * as the kind of iterator needed by buildFromSorted. (They
		 * can be, but doing so requires type cheats and/or creation
		 * of adaptor classes.) It is simpler to just adapt the code.
		 *

		HeadIndex<K,V> h = head;
		Node<K,V> basepred = h.node;
		ArrayList<Index<K,V>> preds = new ArrayList<Index<K,V>>();
		for (int i = 0; i <= h.level; ++i)
		    preds.add(null);
		Index<K,V> q = h;
		for (int i = h.level; i > 0; --i) {
		    preds.set(i, q);
		    q = q.down;
		}

		for (;;) {
		    Object k = s.readObject();
		    if (k == null)
		        break;
		    Object v = s.readObject();
		    if (v == null)
		        throw new NullPointerException();
		    K key = (K) k;
		    V val = (V) v;
		    int j = randomLevel();
		    if (j > h.level) j = h.level + 1;
		    Node<K,V> z = new Node<K,V>(key, val, null);
		    basepred.next = z;
		    basepred = z;
		    if (j > 0) {
		        Index<K,V> idx = null;
		        for (int i = 1; i <= j; ++i) {
		            idx = new Index<K,V>(z, idx, null);
		            if (i > h.level)
		                h = new HeadIndex<K,V>(h.node, h, idx, i);

		            if (i < preds.size()) {
		                preds.get(i).right = idx;
		                preds.set(i, idx);
		            } else
		                preds.add(idx);
		        }
		    }
		}
		head = h;
	    }*/

	/* ------ Map API methods ------ */

    	/**
     	 * Returns <tt>true</tt> if this map contains a mapping for the specified
     	 * key.
     	 *
     	 * @param key key whose presence in this map is to be tested
     	 * @return <tt>true</tt> if this map contains a mapping for the specified key
     	 * @throws ClassCastException if the specified key cannot be compared
     	 *         with the keys currently in the map
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def containsKey(key: Object) : Boolean {
        	return doGet(key) != null;
    	}

    	/**
     	 * Returns the value to which the specified key is mapped,
      	 * or {@code null} if this map contains no mapping for the key.
     	 *
     	 * <p>More formally, if this map contains a mapping from a key
     	 * {@code k} to a value {@code v} such that {@code key} compares
     	 * equal to {@code k} according to the map's ordering, then this
     	 * method returns {@code v}; otherwise it returns {@code null}.
     	 * (There can be at most one such mapping.)
     	 *
     	 * @throws ClassCastException if the specified key cannot be compared
     	 *         with the keys currently in the map
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def get(key: Object) : V {
        	return doGet(key);
    	}

	/**
     	 * Associates the specified value with the specified key in this map.
     	 * If the map previously contained a mapping for the key, the old
     	 * value is replaced.
     	 *
      	 * @param key key with which the specified value is to be associated
     	 * @param value value to be associated with the specified key
     	 * @return the previous value associated with the specified key, or
     	 *         <tt>null</tt> if there was no mapping for the key
     	 * @throws ClassCastException if the specified key cannot be compared
     	 *         with the keys currently in the map
     	 * @throws NullPointerException if the specified key or value is null
     	 */
    	public def put(key: Object, value: Object) : V {
        	if (value == null)
            		throw new NullPointerException();
        	return doPut(key, value, false);
    	}

	/**
	 * Removes the mapping for the specified key from this map if present.
     	 *
     	 * @param  key key for which mapping should be removed
     	 * @return the previous value associated with the specified key, or
     	 *         <tt>null</tt> if there was no mapping for the key
     	 * @throws ClassCastException if the specified key cannot be compared
     	 *         with the keys currently in the map
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def remove(key: Object) : V {
        	return doRemove(key, null);
    	}
	

	/**
    	 * Returns <tt>true</tt> if this map maps one or more keys to the
     	 * specified value.  This operation requires time linear in the
     	 * map size.
     	 *
     	 * @param value value whose presence in this map is to be tested
     	 * @return <tt>true</tt> if a mapping to <tt>value</tt> exists;
     	 *         <tt>false</tt> otherwise
     	 * @throws NullPointerException if the specified value is null
     	 */
    	public def containsValue(value: Object) : Boolean {
        	if (value == null)
        		throw new NullPointerException();
        	for (var n: Node[K,V]! = findFirst(); n != null; n = n.next) {
            		var v: Object = n.getValidValue();
            		if (v != null && value.equals(v))
                		return true;
        	}
        	return false;
    	}

	/**
     	 * Returns the number of key-value mappings in this map.  If this map
     	 * contains more than <tt>Integer.MAX_VALUE</tt> elements, it
     	 * returns <tt>Integer.MAX_VALUE</tt>.
     	 *
     	 * <p>Beware that, unlike in most collections, this method is
     	 * <em>NOT</em> a constant-time operation. Because of the
     	 * asynchronous nature of these maps, determining the current
     	 * number of elements requires traversing them all to count them.
     	 * Additionally, it is possible for the size to change during
     	 * execution of this method, in which case the returned result
     	 * will be inaccurate. Thus, this method is typically not very
     	 * useful in concurrent applications.
     	 *
     	 * @return the number of elements in this map
     	 */
    	public def size() : Int {
        	var count: Long = 0;
        	for (var n: Node[K,V]! = findFirst(); n != null; n = n.next) {
            		if (n.getValidValue() != null)
                		++count;
        	}
        	return (count >= Int.MAX_VALUE)? Int.MAX_VALUE : count as Int;
    	}

	/**
     	 * Returns <tt>true</tt> if this map contains no key-value mappings.
     	 * @return <tt>true</tt> if this map contains no key-value mappings
     	 */
    	public def isEmpty() : Boolean {
        	return findFirst() == null;
    	}

    	/**
     	 * Removes all of the mappings from this map.
     	 */
    	public def clear() : void {
        	initialize();
    	}













	/* ---------------- Relational operations -------------- */

    	/**
    	 * Returns a key-value mapping associated with the greatest key
     	 * strictly less than the given key, or <tt>null</tt> if there is
     	 * no such key. The returned entry does <em>not</em> support the
     	 * <tt>Entry.setValue</tt> method.
     	 *
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def lowerEntry(key: Object) : Map.Entry[K,V] {
        	return getNear(key, LT);
    	}

    	/**
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def lowerKey(key: Object) : Object {
        	var n: Node[K,V]! = findNear(key, LT);
        	return (n == null)? null : n.key;
    	}

   	/**
     	 * Returns a key-value mapping associated with the greatest key
     	 * less than or equal to the given key, or <tt>null</tt> if there
     	 * is no such key. The returned entry does <em>not</em> support
     	 * the <tt>Entry.setValue</tt> method.
     	 *
     	 * @param key the key
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def floorEntry(key: Object) : Map.Entry[K,V] {
        	return getNear(key, LT|EQ);
    	}

    	/**
     	 * @param key the key
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def floorKey(key: Object) : Object {
        	var n: Node[K,V]! = findNear(key, LT|EQ);
        	return (n == null)? null : n.key;
    	}

	/**
     	 * Returns a key-value mapping associated with the least key
     	 * greater than or equal to the given key, or <tt>null</tt> if
     	 * there is no such entry. The returned entry does <em>not</em>
     	 * support the <tt>Entry.setValue</tt> method.
     	 *
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def ceilingEntry(key: Object) :  Map.Entry[K,V] {
        	return getNear(key, GT|EQ);
    	}

    	/**
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def ceilingKey(key: Object) : Object {
	        var n: Node[K,V]! = findNear(key, GT|EQ);
        	return (n == null)? null : n.key;
    	}

    	/**
     	 * Returns a key-value mapping associated with the least key
     	 * strictly greater than the given key, or <tt>null</tt> if there
     	 * is no such key. The returned entry does <em>not</em> support
     	 * the <tt>Entry.setValue</tt> method.
     	 *
     	 * @param key the key
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def higherEntry(key: Object) : Map.Entry[K,V] {
        	return getNear(key, GT);
    	}

    	/**
     	 * @param key the key
     	 * @throws ClassCastException {@inheritDoc}
     	 * @throws NullPointerException if the specified key is null
     	 */
    	public def higherKey(key: Object) : Object {
        	var n: Node[K,V]! = findNear(key, GT);
        	return (n == null)? null : n.key;
    	}

	/**
     	 * Returns a key-value mapping associated with the least
     	 * key in this map, or <tt>null</tt> if the map is empty.
     	 * The returned entry does <em>not</em> support
     	 * the <tt>Entry.setValue</tt> method.
     	 */
    	public def firstEntry() : Map.Entry[K,V] {
        	for (;;) {
            		var n: Node[K,V]! = findFirst();
            		if (n == null)
                		return null;
            		var e: SimpleImmutableEntry[K,V] = n.createSnapshot();
            		if (e != null)
                		return e;
        	}
    	}

    	/**
     	 * Returns a key-value mapping associated with the greatest
     	 * key in this map, or <tt>null</tt> if the map is empty.
     	 * The returned entry does <em>not</em> support
     	 * the <tt>Entry.setValue</tt> method.
     	 */
    	public def lastEntry() : Map.Entry[K,V] {
        	for (;;) {
            		var n: Node[K,V]! = findLast();
            		if (n == null)
                		return null;
            		var e: SimpleImmutableEntry[K,V] = n.createSnapshot();
            		if (e != null)
                		return e;
        	}
    	}

    	/**
     	 * Removes and returns a key-value mapping associated with
     	 * the least key in this map, or <tt>null</tt> if the map is empty.
     	 * The returned entry does <em>not</em> support
     	 * the <tt>Entry.setValue</tt> method.
     	 */
    	public def pollFirstEntry() : Map.Entry[K,V] {
        	return doRemoveFirstEntry();
    	}

    	/**
     	 * Removes and returns a key-value mapping associated with
     	 * the greatest key in this map, or <tt>null</tt> if the map is empty.
     	 * The returned entry does <em>not</em> support
     	 * the <tt>Entry.setValue</tt> method.
     	 */
    	public def pollLastEntry() : Map.Entry[K,V] {
        	return doRemoveLastEntry();
    	}




	public static def main(args: Rail[String]!) {
		var test: Node[Int, Int]! = null ;
		var test2: Node[Int, Int]! = new Node[Int, Int](test);

		if(test2.equals(test2))
			Console.OUT.println("Equals operation works");
		else Console.OUT.println("Equals operation does not work");
	}
}
