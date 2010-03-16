package x10.util.concurrent;

import x10.util.*;
import x10.util.concurrent.*; 
/**
 * An unbounded {@linkplain BlockingQueue blocking queue} that uses
 * the same ordering rules as class {@link PriorityQueue} and supplies
 * blocking retrieval operations. While this queue is logically
 * unbounded, attempted additions may fail due to resource exhaustion
 * (causing <tt>OutOfMemoryError</tt>). This class does not permit
 * <tt>null</tt> elements. A priority queue relying on {@linkplain
 * Comparable natural ordering} also does not permit insertion of
 * non-comparable objects (doing so results in
 * <tt>ClassCastException</tt>).
 *
 * <p>This class and its iterator implement all of the
 * <em>optional</em> methods of the {@link Collection} and {@link
 * Iterator} interfaces. The Iterator provided in method {@link
 * #iterator()} is <em>not</em> guaranteed to traverse the elements of
 * the PriorityBlockingQueue in any particular order. If you need
 * ordered traversal, consider using
 * <tt>Arrays.sort(pq.toArray())</tt>. Also, method <tt>drainTo</tt>
 * can be used to <em>remove</em> some or all elements in priority
 * order and place them in another collection.
 *
 * <p>Operations on this class make no guarantees about the ordering
 * of elements with equal priority. If you need to enforce an
 * ordering, you can define custom classes or comparators that use a
 * secondary key to break ties in primary priority values. For
 * example, here is a class that applies first-in-first-out
 * tie-breaking to comparable elements. To use it, you would insert a
 * <tt>new FIFOEntry(anEntry)</tt> instead of a plain entry object.
 *
 * <pre>
 * class FIFOEntry&lt;E extends Comparable&lt;? super E&gt;&gt;
 * implements Comparable&lt;FIFOEntry&lt;E&gt;&gt; {
 * final static AtomicLong seq = new AtomicLong();
 * final long seqNum;
 * final E entry;
 * public FIFOEntry(E entry) {
 * seqNum = seq.getAndIncrement();
 * this.entry = entry;
 * }
 * public E getEntry() { return entry; }
 * public int compareTo(FIFOEntry&lt;E&gt; other) {
 * int res = entry.compareTo(other.entry);
 * if (res == 0 &amp;&amp; other.entry != this.entry)
 * res = (seqNum &lt; other.seqNum ? -1 : 1);
 * return res;
 * }
 * }</pre>
 *
 * <p>This class is a member of the
 * <a href="{@docRoot}/../technotes/guides/collections/index.html">
 * Java Collections Framework</a>.
 *
 * @since 1.5
 * @author Doug Lea
 * @param <E> the type of elements held in this collection
 */
public class PriorityBlockingQueue[E] extends AbstractQueue[E]
    implements BlockingQueue[E] {
 
    private val q: PriorityQueue[E];
 
    /**
     * Creates a <tt>PriorityBlockingQueue</tt> with the default
     * initial capacity (11) that orders its elements according to
     * their {@linkplain Comparable natural ordering}.
     */
    public def this() {
        q = new PriorityQueue[E]();
    }
 
    /**
     * Creates a <tt>PriorityBlockingQueue</tt> with the specified
     * initial capacity that orders its elements according to their
     * {@linkplain Comparable natural ordering}.
     *
     * @param initialCapacity the initial capacity for this priority queue
     * @throws IllegalArgumentException if <tt>initialCapacity</tt> is less
     * than 1
     */
    public def this(initialCapacity: Int) {
        q = new PriorityQueue[E](initialCapacity, null);
    }
 
    /**
     * Creates a <tt>PriorityBlockingQueue</tt> with the specified initial
     * capacity that orders its elements according to the specified
     * comparator.
     *
     * @param initialCapacity the initial capacity for this priority queue
     * @param comparator the comparator that will be used to order this
     * priority queue. If {@code null}, the {@linkplain Comparable
     * natural ordering} of the elements will be used.
     * @throws IllegalArgumentException if <tt>initialCapacity</tt> is less
     * than 1
     */
    public def this(initialCapacity: Int,
                               comparator: Comparator[E]) {
        q = new PriorityQueue[E](initialCapacity, comparator);
    }
 
    /**
     * Creates a <tt>PriorityBlockingQueue</tt> containing the elements
     * in the specified collection. If the specified collection is a
     * {@link SortedSet} or a {@link PriorityQueue}, this
     * priority queue will be ordered according to the same ordering.
     * Otherwise, this priority queue will be ordered according to the
     * {@linkplain Comparable natural ordering} of its elements.
     *
     * @param c the collection whose elements are to be placed
     * into this priority queue
     * @throws ClassCastException if elements of the specified collection
     * cannot be compared to one another according to the priority
     * queue's ordering
     * @throws NullPointerException if the specified collection or any
     * of its elements are null
     */
    public def this(c: Collection[E]) {
        q = new PriorityQueue[E](c);
    }
 
    /**
     * Inserts the specified element into this priority queue.
     *
     * @param e the element to add
     * @return <tt>true</tt> (as specified by {@link Collection#add})
     * @throws ClassCastException if the specified element cannot be compared
     * with elements currently in the priority queue according to the
     * priority queue's ordering
     * @throws NullPointerException if the specified element is null
     */
    public def add(e: E): Boolean {
        return offer(e);
    }
 
    /**
     * Inserts the specified element into this priority queue.
     *
     * @param e the element to add
     * @return <tt>true</tt> (as specified by {@link Queue#offer})
     * @throws ClassCastException if the specified element cannot be compared
     * with elements currently in the priority queue according to the
     * priority queue's ordering
     * @throws NullPointerException if the specified element is null
     */
    public def offer(e: E): Boolean {
        atomic {
            var ok : Boolean = q.offer(e);
            assert ok;
            notEmpty.signal();
            return true;
        }
    }
 
    /**
     * Inserts the specified element into this priority queue. As the queue is
     * unbounded this method will never block.
     *
     * @param e the element to add
     * @throws ClassCastException if the specified element cannot be compared
     * with elements currently in the priority queue according to the
     * priority queue's ordering
     * @throws NullPointerException if the specified element is null
     */
    public def put(e: E): Void {
        offer(e); // never need to block
    }
 
    /**
     * Inserts the specified element into this priority queue. As the queue is
     * unbounded this method will never block.
     *
     * @param e the element to add
     * @param timeout This parameter is ignored as the method never blocks
     * @param unit This parameter is ignored as the method never blocks
     * @return <tt>true</tt>
     * @throws ClassCastException if the specified element cannot be compared
     * with elements currently in the priority queue according to the
     * priority queue's ordering
     * @throws NullPointerException if the specified element is null
     */
    
    public def offer(e: E, nanos: Long): Boolean {
        return offer(e); // never need to block
    }
 
    public atomic def poll(): E {
        return q.poll();
    }
 
    public def take(): E {
    	while (q.size() == 0) {} //Wait
        
    	when(q.size() > 0) {
    		var x: E = q.poll();
    	assert x != null;
    	return x;
    	}
    }
    /*
    public def poll(timeout: long, unit: TimeUnit) : E throws UnsupportedOperationException { //InterruptedException {
        //long nanos = unit.toNanos(timeout);
        //final ReentrantLock lock = this.lock;
        //lock.lockInterruptibly();
        try {
            for (;;) {
                var x: E = q.poll();
                if (x != null)
                    return x;
                if (nanos <= 0)
                    return null;
                try {
                    nanos = notEmpty.awaitNanos(nanos);
                } catch (InterruptedException ie) {
                    notEmpty.signal(); // propagate to non-interrupted thread
                    throw ie;
                }
            }
        } finally {
        // lock.unlock();
        }
    } */
 
    public def peek() : E {
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            return q.peek();
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * Returns the comparator used to order the elements in this queue,
     * or <tt>null</tt> if this queue uses the {@linkplain Comparable
     * natural ordering} of its elements.
     *
     * @return the comparator used to order the elements in this queue,
     * or <tt>null</tt> if this queue uses the natural
     * ordering of its elements
     */
    public def comparator() : Comparator[E] {
        return q.comparator();
    }
 
    public def size() : Int {
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            return q.size();
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * Always returns <tt>Integer.MAX_VALUE</tt> because
     * a <tt>PriorityBlockingQueue</tt> is not capacity constrained.
     * @return <tt>Integer.MAX_VALUE</tt>
     */
    /*
    public def remainingCapacity() : Int {
        return Integer.MAX_VALUE;
    } */
 
    /**
     * Removes a single instance of the specified element from this queue,
     * if it is present. More formally, removes an element {@code e} such
     * that {@code o.equals(e)}, if this queue contains one or more such
     * elements. Returns {@code true} if and only if this queue contained
     * the specified element (or equivalently, if this queue changed as a
     * result of the call).
     *
     * @param o element to be removed from this queue, if present
     * @return <tt>true</tt> if this queue changed as a result of the call
     */
    public def remove(o: Object) : Boolean {
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            return q.remove(o);
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * Returns {@code true} if this queue contains the specified element.
     * More formally, returns {@code true} if and only if this queue contains
     * at least one element {@code e} such that {@code o.equals(e)}.
     *
     * @param o object to be checked for containment in this queue
     * @return <tt>true</tt> if this queue contains the specified element
     */
    public def contains(o: Object) : boolean {
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            return q.contains(o);
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * Returns an array containing all of the elements in this queue.
     * The returned array elements are in no particular order.
     *
     * <p>The returned array will be "safe" in that no references to it are
     * maintained by this queue. (In other words, this method must allocate
     * a new array). The caller is thus free to modify the returned array.
     *
     * <p>This method acts as bridge between array-based and collection-based
     * APIs.
     *
     * @return an array containing all of the elements in this queue
     */
    public def toArray() : Rail[Object]{
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            return q.toArray();
        } finally {
        // lock.unlock();
        }
    }
 
 
    public def toString() : String {
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            return q.toString();
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * @throws UnsupportedOperationException {@inheritDoc}
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException {@inheritDoc}
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def drainTo(c: Collection[E]!) : Int {
        if (c == null)
            throw new NullPointerException();
        if (c == this)
            throw new IllegalArgumentException();
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            var n: Int = 0;
            var e: E;
            while ( (e = q.poll()) != null) {
                c.add(e);
                ++n;
            }
            return n;
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * @throws UnsupportedOperationException {@inheritDoc}
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException {@inheritDoc}
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def drainTo(c: Collection[E]!, maxElements: Int) : Int {
        if (c == null)
            throw new NullPointerException();
        if (c == this)
            throw new IllegalArgumentException();
        if (maxElements <= 0)
            return 0;
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            var n: Int = 0;
            var e: E;
            while (n < maxElements && (e = q.poll()) != null) {
                c.add(e);
                ++n;
            }
            return n;
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * Atomically removes all of the elements from this queue.
     * The queue will be empty after this call returns.
     */
    public def clear() : void {
        //final ReentrantLock lock = this.lock;
        //lock.lock();
        try {
            q.clear();
        } finally {
        // lock.unlock();
        }
    }
 
    /**
     * Returns an array containing all of the elements in this queue; the
     * runtime type of the returned array is that of the specified array.
     * The returned array elements are in no particular order.
     * If the queue fits in the specified array, it is returned therein.
     * Otherwise, a new array is allocated with the runtime type of the
     * specified array and the size of this queue.
     *
     * <p>If this queue fits in the specified array with room to spare
     * (i.e., the array has more elements than this queue), the element in
     * the array immediately following the end of the queue is set to
     * <tt>null</tt>.
     *
     * <p>Like the {@link #toArray()} method, this method acts as bridge between
     * array-based and collection-based APIs. Further, this method allows
     * precise control over the runtime type of the output array, and may,
     * under certain circumstances, be used to save allocation costs.
     *
     * <p>Suppose <tt>x</tt> is a queue known to contain only strings.
     * The following code can be used to dump the queue into a newly
     * allocated array of <tt>String</tt>:
     *
     * <pre>
     * String[] y = x.toArray(new String[0]);</pre>
     *
     * Note that <tt>toArray(new Object[0])</tt> is identical in function to
     * <tt>toArray()</tt>.
     *
     * @param a the array into which the elements of the queue are to
     * be stored, if it is big enough; otherwise, a new array of the
     * same runtime type is allocated for this purpose
     * @return an array containing all of the elements in this queue
     * @throws ArrayStoreException if the runtime type of the specified array
     * is not a supertype of the runtime type of every element in
     * this queue
     * @throws NullPointerException if the specified array is null
     */
    
    public atomic def toArray(a: Rail[Object]): Rail[Object] {
            return q.toArray(a);
    } 
 
    /**
     * Returns an iterator over the elements in this queue. The
     * iterator does not return the elements in any particular order.
     * The returned <tt>Iterator</tt> is a "weakly consistent"
     * iterator that will never throw {@link
     * ConcurrentModificationException}, and guarantees to traverse
     * elements as they existed upon construction of the iterator, and
     * may (but is not guaranteed to) reflect any modifications
     * subsequent to construction.
     *
     * @return an iterator over the elements in this queue
     */
    public def iterator() : Iterator[E] {
        return new Itr(toArray());
    }
 
    /**
     * Snapshot iterator that works off copy of underlying q array.
     */
    private class Itr implements Iterator[E] {
        val array: Rail[Object]; // Array of all elements
        var cursor: Int; // index of next element to return;
        var lastRet: Int; // index of last element, or -1 if no such
 
        def this(array: Rail[Object]) {
            lastRet = -1;
            this.array = array;
        }
 
        public def hasNext() : Boolean {
            return cursor < array.length;
        }
 
        public def next() : E {
            if (cursor >= array.length)
                throw new NoSuchElementException();
            lastRet = cursor;
            return array(cursor++) as E;
        }
 
        public def remove() : void {
            if (lastRet < 0)
                throw new UnsupportedOperationException(); //IllegalStateException();
            var x: Object = array(lastRet);
            lastRet = -1;
            // Traverse underlying queue to find == element,
            // not just a .equals element.
            //lock.lock();
            try {
                for (var it: Iterator! = q.iterator(); it.hasNext(); ) {
                    if (it.next() == x) {
                        it.remove();
                        return;
                    }
                }
            } finally {
            // lock.unlock();
            }
        }
    }
 
}