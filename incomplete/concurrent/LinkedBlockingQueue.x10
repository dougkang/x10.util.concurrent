/**   
 *  Class LinkedBlockingQueue
 */  
package x10.util.concurrent;

import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.*;
import x10.util.concurrent.atomic.AtomicInteger;
import x10.lang;

public class LinkedBlockingQueue[E] extends AbstractQueue[E]
                                    implements BlockingQueue[E] {
    /**   
     *  Main method 
     */
     public static def main(args:Rail[String]): Void {  
     }
    
     /**
      * Linked list node class
      */
     static class Node[E] {
         global var item: E;
         public var next: Node[E];      
         public def this(x: E) { item = x; }
     }
     
     /** The capacity bound, or Integer.MAX_VALUE if none */
     private val capacity: Int;

     /** Current number of elements */
     private var count: AtomicInteger = new AtomicInteger(0);

     /** Head of linked list */
     private var head: Node[E];

     /** Tail of linked list */
     private var last: Node[E];
     
    
    /**
     * Creates a node and links it at end of queue.
     * @param x the item
     */
    private def insert(x: E): Void {
        last = last.next = new Node[E](x);
    }

    /**
     * Removes a node from head of queue,
     * @return the node
     */
    private def extract(): E {
        var first: Node[E] = head.next;
        head = first;
        x: E = first.item;
        first.item = (null as E);
        return x;
    }
    
    /**
     * Creates a <tt>LinkedBlockingQueue</tt> with a capacity of
     * {@link Integer#MAX_VALUE}.
     */
    public def this() {
        this(Int.MAX_VALUE);
    }

    /**
     * Creates a <tt>LinkedBlockingQueue</tt> with the given (fixed) capacity.
     *
     * @param capacity the capacity of this queue
     * @throws IllegalArgumentException if <tt>capacity</tt> is not greater
     *         than zero
     */
    public def this(capacity: Int) {
        if (capacity <= 0)
        	throw new IllegalArgumentException("Illegal Argument Exception");
        this.capacity = capacity;
        last = head = new Node[E](null as E);
    }

    /**
     * Creates a <tt>LinkedBlockingQueue</tt> with a capacity of
     * {@link Integer#MAX_VALUE}, initially containing the elements of the
     * given collection,
     * added in traversal order of the collection's iterator.
     *
     * @param c the collection of elements to initially contain
     * @throws NullPointerException if the specified collection or any
     *         of its elements are null
     */
    public def this(c: Collection[E]) {
        this(Int.MAX_VALUE);
        for (e: E in c)
            add(e);
    }
     
     //   this doc comment is overridden to remove the reference to collections
     // greater in size than Integer.MAX_VALUE
     /**
      * Returns the number of elements in this queue.
      *
      * @return the number of elements in this queue
      */
     public def size(): Int {
         return count.get();
     }

     // this doc comment is a modified copy of the inherited doc comment,
     // without the reference to unlimited queues.
     /**
      * Returns the number of additional elements that this queue can ideally
      * (in the absence of memory or resource constraints) accept without
      * blocking. This is always equal to the initial capacity of this queue
      * less the current <tt>size</tt> of this queue.
      *
      * <p>Note that you <em>cannot</em> always tell if an attempt to insert
      * an element will succeed by inspecting <tt>remainingCapacity</tt>
      * because it may be the case that another thread is about to
      * insert or remove an element.
      */
     public def remainingCapacity(): Int {
         return capacity - count.get();
     }

     /**
      * Inserts the specified element at the tail of this queue, waiting if
      * necessary for space to become available.
      *
      * @throws InterruptedException {@inheritDoc}
      * @throws NullPointerException {@inheritDoc}
      */
     public def put(e: E): Void {
         if (e == null) throw new NullPointerException();           
         while(count.get() == capacity) {} //Wait until it's available
         atomic insert(e);
     }
      
      /**
       * Inserts the specified element at the tail of this queue, waiting if
       * necessary up to the specified wait time in nanosecond for space to
       * become available.
       *
       * @return <tt>true</tt> if successful, or <tt>false</tt> if
       *         the specified waiting time elapses before space is available.
       * @throws InterruptedException {@inheritDoc}
       * @throws NullPointerException {@inheritDoc}
       */
      public def offer(e: E, nanos: Long): Boolean {  	   
          if (e == null) throw new NullPointerException();
          atomic {
        	  if (count.get() < capacity) {
        		  insert(e);
        		  return true;	  
        	  }
          }	  
          if (nanos <= 0)
        	  return false;
          countDown: Long = Timer.nanoTime();
          // Waiting until the space to become available 
          while( (Timer.nanoTime() - countDown) <= nanos ) { 
        	  atomic {
        		  if (count.get() < capacity) {
        			  insert(e);
        			  return true;
        		  }
                  }
          }
          return false;
      }
       
       /**
        * Inserts the specified element at the tail of this queue if it is
        * possible to do so immediately without exceeding the queue's capacity,
        * returning <tt>true</tt> upon success and <tt>false</tt> if this queue
        * is full.
        * When using a capacity-restricted queue, this method is generally
        * preferable to method {@link BlockingQueue#add add}, which can fail to
        * insert an element only by throwing an exception.
        *
        * @throws NullPointerException if the specified element is null
        */
       public def offer(e: E): Boolean {
           if (e == null) throw new NullPointerException();
           atomic {
        	   if (count.get() >= capacity)   
        		   return false;
        	   else {
        	           insert(e);
        	           return true;
        	   }
           }
       }
        
       public def take(): E {
           var x: E = null;
           while(count.get() == 0) {}
           atomic extract();
           return x;
       }
       
       public def poll(nanos: Long): E {
    	   var x: E = null;
           atomic {
        	   if (count.get() > 0) {
        		   x = extract();
        		   return x;
        	   }
           }
           if (nanos <= 0)
        	   return null;
           countDown: Long = Timer.nanoTime();
           // Waiting until the space to become available 
           while( (Timer.nanoTime() - countDown) <= nanos ) {
        	   atomic {
        	           if (count.get() > 0) {
        	        	   x = extract();
        	        	   break;
        	           }
        	   }
           }
           return x;
       }
       
       public atomic def poll(): E {
    	   var x: E = null;
           if (count.get() > 0)
    	           x = extract();
           return x;
       }
       
       public def peek(): E {
           if (count.get() == 0)
               return null;
           atomic {
               first: Node[E] = head.next;
               if (first == null)
                   return null;
               else
                   return first.item;
           } 
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
       public atomic def remove(o: Object): Boolean {
           if (o == null) return false;
           var removed: Boolean = false;

           trail: Node[E] = head;
           p: Node[E] = head.next;
           while (p != null) {
        	   if (o.equals(p.item)) {
        		   removed = true;
        		   break;
        	   }
        	   trail = p;
                   p = p.next;
           }
           if (removed) {
        	   p.item = null;
                   trail.next = p.next;
                   if (last == p)
                	   last = trail;
           }
           return removed;
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
        public def toArray(): Rail[Object] {
        	val size: Int = count.get();
                a: Rail[Object] = new Rail[Object](size);
                var k: Int = 0;
                for (p: Node[Object] = head.next; p != null; p = p.next)
                    a(k++) = p.item;
                return a;
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
        public def toArray(a: Rail[Object]): Rail[Object] {
            atomic {
                size: Int = count.get();
                if (a.length < size)
                    a = ( x10.lang.reflect.Array.newInstance
                        (a.getClass().getComponentType(), size) as Rail[Object] );

                var k: Int = 0;
                for (p: Node = head.next; p != null; p = p.next)
                    a(k++) = ( p.item as Object );
                if (a.length > k)
                    a(k) = null;
                return a;
            }
        }
         
         public atomic def toString(): String {
        	 return super.toString();
         }
         
         /**
          * Atomically removes all of the elements from this queue.
          * The queue will be empty after this call returns.
          */
         public atomic def clear(): Void {
        	 head.next = null;
        	 assert head.item == null;
        	 last = head;
         }
         
         /**
          * @throws UnsupportedOperationException {@inheritDoc}
          * @throws ClassCastException            {@inheritDoc}
          * @throws NullPointerException          {@inheritDoc}
          * @throws IllegalArgumentException      {@inheritDoc}
          */
         public def drainTo(c: Collection[E]): Int {
             if (c == null)
                 throw new NullPointerException();
             if (c == this)
                 throw new IllegalArgumentException();
             val first: Node[E];

             atomic {
                 first = head.next;
                 head.next = null;
                 assert head.item == null;
                 last = head;
                 count.set(0);
             }
             // Transfer the elements outside of locks
             n: Int = 0;
             for (var p: Node[E] = first; p != null; p = p.next) {
                 c.add(p.item);
                 p.item = null;
                 ++n;
             }
             return n;
         }
          
          /**
           * @throws UnsupportedOperationException {@inheritDoc}
           * @throws ClassCastException            {@inheritDoc}
           * @throws NullPointerException          {@inheritDoc}
           * @throws IllegalArgumentException      {@inheritDoc}
           */
          public def drainTo(c: Collection[E], maxElements: Int): Int {
              if (c == null)
                  throw new NullPointerException();
              if (c == this)
                  throw new IllegalArgumentException();
              
              var n: Int = 0;

              atomic {
                  p: Node[E] = head.next;
                  while (p != null && n < maxElements) {
                      c.add(p.item);
                      p.item = null;
                      p = p.next;
                      ++n;
                  }
                  if (n != 0) {
                      head.next = p;
                      assert head.item == null;
                      if (p == null)
                    	  last = head;
                      count.getAndAdd(-n);
                  }
              }
              return n;
          }

           /**
            * Returns an iterator over the elements in this queue in proper sequence.
            * The returned <tt>Iterator</tt> is a "weakly consistent" iterator that
            * will never throw {@link ConcurrentModificationException},
            * and guarantees to traverse elements as they existed upon
            * construction of the iterator, and may (but is not guaranteed to)
            * reflect any modifications subsequent to construction.
            *
            * @return an iterator over the elements in this queue in proper sequence
            */
           public def iterator(): Iterator[E] {
        	   return new Itr();
           }

           private class Itr implements Iterator[E] {
               /*
                * Basic weak-consistent iterator.  At all times hold the next
                * item to hand out so that if hasNext() reports true, we will
                * still have it to return even if lost race with a take etc.
                */
               private var current: Node[E];
               private var lastRet: Node[E];
               private var currentElement: E;

               public def this() {
            	   atomic{
                       current = head.next;
                       if (current != null)
                    	   currentElement = current.item;
            	   }
               }

               public def hasNext(): Boolean {
                   return current != null;
               }

               public atomic def next(): E {
                       if (current == null)
                           throw new NoSuchElementException();
                       val x: E = currentElement;
                       lastRet = current;
                       current = current.next;
                       if (current != null)
                           currentElement = current.item;
                       return x;
               }

               public def remove(): Void {
                   if (lastRet == null)
                       throw new IllegalStateException();

                   atomic {
                       node: Node[E] = lastRet;
                       lastRet = null;
                       var trail: Node[E] = head;
                       var p: Node[E] = head.next;
                       while (p != null && p != node) {
                           trail = p;
                           p = p.next;
                       }
                       if (p == node) {
                           p.item = null;
                           trail.next = p.next;
                           if (last == p)
                               last = trail;
                       }
                   }
               }
           }
}