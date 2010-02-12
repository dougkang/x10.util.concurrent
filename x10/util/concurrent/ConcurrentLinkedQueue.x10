package x10.util.concurrent;
import x10.util.*;
import x10.io.Console;

/*
 * @(#)ConcurrentLinkedQueue.x10	0.10 10/02/07
 *
 */

/**
 * An unbounded thread-safe {@linkplain Queue queue} based on linked nodes.
 * This queue orders elements FIFO (first-in-first-out).
 * The <em>head</em> of the queue is that element that has been on the
 * queue the longest time.
 * The <em>tail</em> of the queue is that element that has been on the
 * queue the shortest time. New elements
 * are inserted at the tail of the queue, and the queue retrieval
 * operations obtain elements at the head of the queue.
 * A <tt>ConcurrentLinkedQueue</tt> is an appropriate choice when
 * many threads will share access to a common collection.
 * This queue does not permit <tt>null</tt> elements.
 *
 * <p>This implementation employs an efficient &quot;wait-free&quot;
 * algorithm based on one described in <a
 * href="http://www.cs.rochester.edu/u/michael/PODC96.html"> Simple,
 * Fast, and Practical Non-Blocking and Blocking Concurrent Queue
 * Algorithms</a> by Maged M. Michael and Michael L. Scott.
 *
 * <p>Beware that, unlike in most collections, the <tt>size</tt> method
 * is <em>NOT</em> a constant-time operation. Because of the
 * asynchronous nature of these queues, determining the current number
 * of elements requires a traversal of the elements.
 *
 * <p>This class and its iterator implement all of the
 * <em>optional</em> methods of the {@link Collection} and {@link
 * Iterator} interfaces.
 *
 * <p>Memory consistency effects: As with other concurrent
 * collections, actions in a thread prior to placing an object into a
 * {@code ConcurrentLinkedQueue}
 * <a href="package-summary.html#MemoryVisibility"><i>happen-before</i></a>
 * actions subsequent to the access or removal of that element from
 * the {@code ConcurrentLinkedQueue} in another thread.
 *
 * <p>This class is a member of the
 * <a href="{@docRoot}/../technotes/guides/collections/index.html">
 * Java Collections Framework</a>.
 *
 * @since 1.5
 * @author Doug Kang, Ha Young Park
 * @param <E> the type of elements held in this collection
 *
 **/
 class ConcurrentLinkedQueue[E] {
     
    /*
     * This is a straight adaptation of Michael & Scott algorithm.
     * For explanation, read the paper.  The only (minor) algorithmic
     * difference is that this version supports lazy deletion of
     * internal nodes (method remove(Object)) -- remove CAS'es item
     * fields to null. The normal queue operations unlink but then
     * pass over nodes with null item fields. Similarly, iteration
     * methods ignore those with nulls.
     *
     * Also note that like most non-blocking algorithms in this
     * package, this implementation relies on the fact that in garbage
     * collected systems, there is no possibility of ABA problems due
     * to recycled nodes, so there is no need to use "counted
     * pointers" or related techniques seen in versions used in
     * non-GC'ed settings.
     */
     
	 private static class Node[E] {
  	   private var item:Box[E];
  	   private var nxt:Node[E];
  	   
           public def this () { nxt = null; }
  	   public def this (x:E) { item = x; nxt = null; }
  	   public def this (x:E, n:Node[E]) { item = x; nxt = n; }
       
  	   public def getItem ():Box[E] {
  	     return item;
  	   }
  	   
  	   public atomic def casItem (cmp:E, v:E!) {
  	     return setItem(v);
  	   }
  	   
  	   public atomic def setItem (v:Box[E]!) {
  	     item = v;
  	     return true;
  	   }
  	   
  	   public atomic def getNext():Node[E] { return nxt; }

  	   public atomic def casNext(cmp:Node[E], v:Node[E]) {
  	     return setNext(v);
  	   }
  	   
  	   public atomic def setNext(v:Node[E]) {
  	     nxt = v;
  	     return true;
  	   }
  	 }
    
      private atomic def casTail(v:Node[E]):Boolean {
        tail = v;
        return true;
      }

      private atomic def casHead(v:Node[E]):Boolean {
        head = v;
        return true;
      }
     
      private var head:Node[E];
      private var tail:Node[E];
      private var size:Int;

     
     /**
      * Creates a <tt>ConcurrentLinkedQueue</tt> that is initially empty.
      */
     public def this() { size = 0; }

     /**
      * Creates a <tt>ConcurrentLinkedQueue</tt>
      * initially containing the elements of the given collection,
      * added in traversal order of the collection's iterator.
      * Extends E does not yet work
      * @param c the collection of elements to initially contain
      * @throws NullPointerException if the specified collection or any
      *         of its elements are null
      */
     public def this(c:Collection[E]!) {
       for((i):Point in [0..c.size()-1]) {
    	   val cvr:Rail[E]! = c.toValRail(); // Collection c ValRail
    	   //add(cvr(i));
       }
     }
      
      /**
       * Inserts the specified element at the tail of this queue.
       *
       * @return <tt>true</tt> (as specified by {@link Collection#add})
       * @throws NullPointerException if the specified element is null
       */
      public atomic def add(e:E):Boolean {
          return offer(e);
      }

      /**
       * Inserts the specified element at the tail of this queue.
       *
       * @return <tt>true</tt> (as specified by {@link Queue#offer})
       * @throws NullPointerException if the specified element is null
       */
      public atomic def offer(e:E):Boolean {
    	if (e == null) { throw new NullPointerException(); }
        var n:Node[E] = new Node[E](e);
    	if (head == null) {
          casHead(n);
          casTail(n);
    	} else {
          tail.setNext(n);
          casTail(n);
    	}
    	size++;
    	return true;
      }
       
      public atomic def poll():Box[E] {
    	  if (head != null) {
              var curr:Node[E]! = head;
              while(curr != tail && curr.getItem() == null) {
                curr = curr.getNext();
              }
              
              if (curr.getItem() != null) {
                item:Box[E] = curr.getItem();
                casHead(curr.getNext());
                curr.setItem(null);
                size--;
    	        return item;
              }
            }
              
    	  return null;

      }
      
      public atomic def peek():Box[E] { // same as poll except don't remove item
          if (head != null) {
              var curr:Node[E]! = head;
              while(curr != tail && curr.getItem() == null) {
                curr = curr.getNext();
              }
              return curr.getItem();
            }
              
          return null;
      }

      /**
       * Returns the first actual (non-header) node on list.  This is yet
       * another variant of poll/peek; here returning out the first
       * node, not element (so we cannot collapse with peek() without
       * introducing race.)
       */
      public atomic def first():Node[E] {
          if (head != null) {
            var curr:Node[E]! = head;
            while(curr != null && curr.getItem() == null) {
              curr = curr.getNext();
            }
  	    return curr;
          } else {
            return null;
          }
      }
 
      /**
       * Returns <tt>true</tt> if this queue contains no elements.
       *
       * @return <tt>true</tt> if this queue contains no elements
       */
      public def isEmpty():Boolean {
          return first() == null;
      }
      
      /**
       * Returns the number of elements in this queue.  If this queue
       * contains more than <tt>Integer.MAX_VALUE</tt> elements, returns
       * <tt>Integer.MAX_VALUE</tt>.
       *
       * Due to the nature of X10, we can change this back to a constant time
       * operation!
       * 
       * <p>Beware that, unlike in most collections, this method is
       * <em>NOT</em> a constant-time operation. Because of the
       * asynchronous nature of these queues, determining the current
       * number of elements requires an O(n) traversal.
       *
       * @return the number of elements in this queue
       */
      public atomic def size():int {
         return size;
      }
      
      /**
       * Returns <tt>true</tt> if this queue contains the specified element.
       * More formally, returns <tt>true</tt> if and only if this queue contains
       * at least one element <tt>e</tt> such that <tt>o.equals(e)</tt>.
       *
       * @param o object to be checked for containment in this queue
       * @return <tt>true</tt> if this queue contains the specified element
       */
      public def contains(o:E):Boolean {
          for (var p:Node[E]! = first(); p != null; p = p.getNext()) {
              item:Box[E] = p.getItem();
              if (item != null &&
                  o.equals(item.value))
                  return true;
          }
          return false;
      }

       /**
        * Removes a single instance of the specified element from this queue,
        * if it is present.  More formally, removes an element <tt>e</tt> such
        * that <tt>o.equals(e)</tt>, if this queue contains one or more such
        * elements.
        * Returns <tt>true</tt> if this queue contained the specified element
        * (or equivalently, if this queue changed as a result of the call).
        *
        * @param o element to be removed from this queue, if present
        * @return <tt>true</tt> if this queue changed as a result of the call
        */
       public def remove(o:E) {
           for (var p:Node[E]! = first(); p != null; p = p.getNext()) {
               item:Box[E] = p.getItem();
               if (item != null &&
                   o.equals(item.value) &&
                   p.setItem(null)) {
            	   size--;
                   return true;
               }
           }
           return false;
       }

        /**
         * Returns an array containing all of the elements in this queue, in
         * proper sequence.
         *
         * <p>The returned array will be "safe" in that no references to it are
         * maintained by this queue.  (In other words, this method must allocate
         * a new array).  The caller is thus free to modify the returned array.
         *
         * <p>This method acts as bridge between array-based and collection-based
         * APIs.
         *
         * @return an array containing all of the elements in this queue
         */
        public def toArray():Rail[Object] {
            // Use ArrayList to deal with resizing.
            al:ArrayList[Object]! = new ArrayList[Object]();
            for (var p:Node[E]! = first(); p != null; p = p.getNext()) {
                val item = p.getItem();
                if (item != null)
                    al.add(item);
            }
            return al.toArray();
        }
        
        /**
         * Returns an array containing all of the elements in this queue, in
         * proper sequence; the runtime type of the returned array is that of
         * the specified array.  If the queue fits in the specified array, it
         * is returned therein.  Otherwise, a new array is allocated with the
         * runtime type of the specified array and the size of this queue.
         *
         * <p>If this queue fits in the specified array with room to spare
         * (i.e., the array has more elements than this queue), the element in
         * the array immediately following the end of the queue is set to
         * <tt>null</tt>.
         *
         * <p>Like the {@link #toArray()} method, this method acts as bridge between
         * array-based and collection-based APIs.  Further, this method allows
         * precise control over the runtime type of the output array, and may,
         * under certain circumstances, be used to save allocation costs.
         *
         * <p>Suppose <tt>x</tt> is a queue known to contain only strings.
         * The following code can be used to dump the queue into a newly
         * allocated array of <tt>String</tt>:
         *
         * <pre>
         *     String[] y = x.toArray(new String[0]);</pre>
         *
         * Note that <tt>toArray(new Object[0])</tt> is identical in function to
         * <tt>toArray()</tt>.
         *
         * @param a the array into which the elements of the queue are to
         *          be stored, if it is big enough; otherwise, a new array of the
         *          same runtime type is allocated for this purpose
         * @return an array containing all of the elements in this queue
         * @throws ArrayStoreException if the runtime type of the specified array
         *         is not a supertype of the runtime type of every element in
         *         this queue
         * @throws NullPointerException if the specified array is null
         */
        public def toArray(a:Rail[Box[E]]!):Rail[Box[E]] {
            // try to use sent-in array
            var k:Int = 0;
            var p:Node[E]! = first();
            for ( ; p != null && k < a.length; p = p.getNext()) {
                item:Box[E] = p.getItem();
                if (item != null)
                    a(k++) = item;
            }
            if (p == null) {
                if (k < a.length)
                    a(k) = null;
                return a;
            }

            // If won't fit, use ArrayList version
            al:ArrayList[Box[E]]! = new ArrayList[Box[E]]();
            for (var q:Node[E]! = first(); q != null; q = q.getNext()) {
                item:Box[E] = q.getItem();
                if (item != null)
                    al.add(item);
            }
            return al.toArray();
        }

         /**
          * Returns an iterator over the elements in this queue in proper sequence.
          * The returned iterator is a "weakly consistent" iterator that
          * will never throw {@link ConcurrentModificationException},
          * and guarantees to traverse elements as they existed upon
          * construction of the iterator, and may (but is not guaranteed to)
          * reflect any modifications subsequent to construction.
          *
          * @return an iterator over the elements in this queue in proper sequence
          */
         //public def iterator():Iterator[E] {
         //    return new Itr();
         //}
          
      public atomic def output():void {
    	  var t:Node[E]! = head;
    	  var s:Node[E]!;
          while (t != null) {
              s = t.getNext();
              if (t.getItem() != null) {
              Console.OUT.print(t.getItem() + " ");
              }
              t = s;
          }
          Console.OUT.println();
      }
      
     public static def main(args:Rail[String]!){
       Console.OUT.println("Initialize Queue");
       var clq:ConcurrentLinkedQueue[String]! = new ConcurrentLinkedQueue[String]();
       finish {
    	   Console.OUT.println("Adding 1");
    	   clq.add("1");
    	   Console.OUT.println("Adding 2");
    	   clq.add("2");
    	   Console.OUT.println("Adding 3");
    	   clq.add("3");
    	   Console.OUT.println("Adding 4");
    	   clq.add("4");
       }
       clq.output();
       Console.OUT.println("Size " + clq.size());
       Console.OUT.println("POLL " + clq.poll().value);
       Console.OUT.println("PEEK " + clq.peek().value);
       Console.OUT.println("FIRST " + clq.first().getItem().value);
       Console.OUT.println("Size " + clq.size());
       Console.OUT.println("POLL " + clq.poll().value);
       Console.OUT.println("REMOVE " + clq.remove("3"));
       Console.OUT.println("Size " + clq.size());
       //clq.output();
       Console.OUT.println("POLL " + clq.poll().value);
       Console.OUT.println("POLL " + clq.poll());
       Console.OUT.println(clq.peek());
       //clq.output();
     }
}