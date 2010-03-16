package x10.util.concurrent;

/*
 * @(#)LinkedBlockingDeque.x10	1.0 10/03/12
 *
 * Copyright 2006 Sun Microsystems, Inc. All rights reserved.
 * SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

import x10.util.*;
import x10.util.concurrent.*;
import x10.util.concurrent.atomic.AtomicInteger;
import x10.lang;

/**
 * An optionally-bounded {@linkplain BlockingDeque blocking deque} based on
 * linked nodes.
 *
 * <p> The optional capacity bound constructor argument serves as a
 * way to prevent excessive expansion. The capacity, if unspecified,
 * is equal to {@link Integer#MAX_VALUE}.  Linked nodes are
 * dynamically created upon each insertion unless this would bring the
 * deque above capacity.
 *
 * <p>Most operations run in constant time (ignoring time spent
 * blocking).  Exceptions include {@link #remove(Object) remove},
 * {@link #removeFirstOccurrence removeFirstOccurrence}, {@link
 * #removeLastOccurrence removeLastOccurrence}, {@link #contains
 * contains}, {@link #iterator iterator.remove()}, and the bulk
 * operations, all of which run in linear time.
 *
 * <p>This class and its iterator implement all of the
 * <em>optional</em> methods of the {@link Collection} and {@link
 * Iterator} interfaces.
 *
 * <p>This class is a member of the
 * <a href="{@docRoot}/../technotes/guides/collections/index.html">
 * Java Collections Framework</a>.
 *
 * @since 1.6
 * @author  Doug Lea
 * @param <E> the type of elements held in this collection
 */
public class LinkedBlockingDeque[E]
    extends AbstractQueue[E]
    implements BlockingDeque[E] {

    /*
     * Implemented as a simple doubly-linked list protected by a
     * single lock and using conditions to manage blocking.
     */

    /*
     * We have "diamond" multiple interface/abstract class inheritance
     * here, and that introduces ambiguities. Often we want the
     * BlockingDeque javadoc combined with the AbstractQueue
     * implementation, so a lot of method specs are duplicated here.
     */

    /** Doubly-linked list node class */
    static class Node[E] {
	var item: E;
        var prev: Node[E];
        var next: Node[E];
        def Node(x: E, p: Node[E], n: Node[E]): Void {
            item = x;
            prev = p;
            next = n;
        }
    }

    /** Pointer to first node */
    private var first: Node[E];//transient
    /** Pointer to last node */
    private var last: Node[E];//transient
    /** Number of items in the deque */
    private var count: Int;
    /** Maximum number of items in the deque */
    private capacity: Int;

    /**
     * Creates a <tt>LinkedBlockingDeque</tt> with a capacity of
     * {@link Integer#MAX_VALUE}.
     */
    public def this() {
        this(Int.MAX_VALUE);
    }

    /**
     * Creates a <tt>LinkedBlockingDeque</tt> with the given (fixed) capacity.
     *
     * @param capacity the capacity of this deque
     * @throws IllegalArgumentException if <tt>capacity</tt> is less than 1
     */
    public def this(capacity: Int) {
        if (capacity <= 0) throw new IllegalArgumentException();
        this.capacity = capacity;
    }

    /**
     * Creates a <tt>LinkedBlockingDeque</tt> with a capacity of
     * {@link Integer#MAX_VALUE}, initially containing the elements of
     * the given collection, added in traversal order of the
     * collection's iterator.
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


    // Basic linking and unlinking operations, called only while holding lock

    /**
     * Links e as first element, or returns false if full.
     */
    private def linkFirst(e: E): Boolean {
        if (count >= capacity)
            return false;
        ++count;
        f: Node[E] = first;
        x: Node[E] = new Node[E](e, null, f);
        first = x;
        if (last == null)
            last = x;
        else
            f.prev = x;
        return true;
    }

    /**
     * Links e as last element, or returns false if full.
     */
    private def linkLast(e: E): Boolean {
        if (count >= capacity)
            return false;
        ++count;
        l: Node[E] = last;
        x: Node[E] = new Node[E](e, l, null);
        last = x;
        if (first == null)
            first = x;
        else
            l.next = x;
        return true;
    }

    /**
     * Removes and returns first element, or null if empty.
     */
    private def unlinkFirst(): E {
        f: Node[E] = first;
        if (f == null)
            return null;
        n: Node[E] = f.next;
        first = n;
        if (n == null)
            last = null;
        else
            n.prev = null;
        --count;
        return f.item;
    }

    /**
     * Removes and returns last element, or null if empty.
     */
    private def unlinkLast(): E {
        l: Node[E] = last;
        if (l == null)
            return null;
        p: Node[E] = l.prev;
        last = p;
        if (p == null)
            first = null;
        else
            p.next = null;
        --count;
        return l.item;
    }

    /**
     * Unlink e
     */
    private def unlink(x: Node[E]): Void {
        p: Node[E] = x.prev;
        n: Node[E] = x.next;
        if (p == null) {
            if (n == null)
                first = last = null;
            else {
                n.prev = null;
                first = n;
            }
        } else if (n == null) {
            p.next = null;
            last = p;
        } else {
            p.next = n;
            n.prev = p;
        }
        --count;
    }

    // BlockingDeque methods

    /**
     * @throws IllegalStateException {@inheritDoc}
     * @throws NullPointerException  {@inheritDoc}
     */
    public def addFirst(e: E): Void {
        if (!offerFirst(e))
            throw new IllegalOperationException("Deque full");//IllegalStateException
    }

    /**
     * @throws IllegalStateException {@inheritDoc}
     * @throws NullPointerException  {@inheritDoc}
     */
    public def addLast(e: E): Void {
        if (!offerLast(e))
            throw new IllegalOperationException("Deque full");//IllegalOperationException
    }

    /**
     * @throws NullPointerException {@inheritDoc}
     */
    public def offerFirst(e: E): Boolean {
        if (e == null) throw new NullPointerException();
        atomic return linkFirst(e);
    }

    /**
     * @throws NullPointerException {@inheritDoc}
     */
    public def offerLast(e: E): Boolean {
        if (e == null) throw new NullPointerException();
        atomic return linkLast(e);
    }

    /**
     * @throws NullPointerException {@inheritDoc}
     * @throws InterruptedException {@inheritDoc}
     */
    public def putFirst(e: E): Void{
        if (e == null) throw new NullPointerException();
        atomic {
            while (!linkFirst(e)) {} //notFull.await();
        }
    }

    /**
     * @throws NullPointerException {@inheritDoc}
     * @throws InterruptedException {@inheritDoc}
     */
    public def putLast(e: E): Void{
        if (e == null) throw new NullPointerException();
        atomic {
            while (!linkLast(e)) {}//notFull.await();
        }
    }

    /**
     * @throws NullPointerException {@inheritDoc}
     * @throws InterruptedException {@inheritDoc}
     */
    public def offerFirst(e: E, nanos: Long): Boolean {
        if (e == null) throw new NullPointerException();
        atomic {
        	if (linkFirst(e))
        		return true;
        }
        
        if (nanos <= 0)
        	return false;
        
        countDown: Long = Timer.nanoTime();
        while( (Timer.nanoTime() - countDown) <= nanos ) { //Waiting until the space to become available 
        	atomic {
        	        if (linkFirst(e))
        	        	return true;
        	}
        }
     }

    /**
     * @throws NullPointerException {@inheritDoc}
     * @throws InterruptedException {@inheritDoc}
     */
    public def offerLast(e: E, nanos: Long): Boolean {
        if (e == null) throw new NullPointerException();
        atomic {
        	if (linkLast(e))
        		return true;
        }
        
        if (nanos <= 0)
        	return false;
        
        countDown: Long = Timer.nanoTime();
        while( (Timer.nanoTime() - countDown) <= nanos ) { //Waiting until the space to become available 
        	atomic {
        	        if (linkLast(e))
        	        	return true;
        	}
        }
    }

    /**
     * @throws NoSuchElementException {@inheritDoc}
     */
    public def removeFirst(): E {
        x: E = pollFirst();
        if (x == null) throw new NoSuchElementException();
        return x;
    }

    /**
     * @throws NoSuchElementException {@inheritDoc}
     */
    public def removeLast(): E {
        x: E = pollLast();
        if (x == null) throw new NoSuchElementException();
        return x;
    }

    public def pollFirst(): E {
        atomic return unlinkFirst();
    }

    public def pollLast(): E {
        atomic return unlinkLast();
    }

    public def takeFirst(): E{
    	var x: E = null;
        while (x == null) {
        	atomic x = unlinkFirst();
        }
        return x;   
    }

    public def takeLast(): E {
    	var x: E = null;
        while (x == null) {
    	        atomic x = unlinkLast();
        }
        return x;  
    }

    public def pollFirst(nanos: Long): E {
    	var x: E = null;
        atomic {
    	        x = unlinkFirst();
    	        if (x != null)
    	        	return x;
        }
    	if (nanos <= 0)
    		return null;
    
    	countDown: Long = Timer.nanoTime();
    	while( (Timer.nanoTime() - countDown) <= nanos ) { //Waiting until the space to become available 
    		atomic {
    		        x = unlinkFirst();
    		        if (x != null)
    		        	break;
    	        }
    	}
    	return x;
    }

    public def pollLast(nanos: Long): E {
    	var x: E = null;
        atomic {
    	        x = unlinkLast();
    	        if (x != null)
    	        	return x;
        }
    	if (nanos <= 0)
    		return null;
    
    	countDown: Long = Timer.nanoTime();
    	while( (Timer.nanoTime() - countDown) <= nanos ) { //Waiting until the space to become available 
    		atomic {
    		         x = unlinkLast();
    		         if (x != null)
    		        	 break;
    		}
    	}
    	return x;
    }

    /**
     * @throws NoSuchElementException {@inheritDoc}
     */
    public def getFirst(): E {
        x: E = peekFirst();
        if (x == null) throw new NoSuchElementException();
        return x;
    }

    /**
     * @throws NoSuchElementException {@inheritDoc}
     */
    public def getLast(): E {
        x: E = peekLast();
        if (x == null) throw new NoSuchElementException();
        return x;
    }

    public def peekFirst(): E {
        atomic return (first == null) ? null : first.item;
    }

    public def peekLast(): E {
        atomic return (last == null) ? null : last.item;
    }

    public def removeFirstOccurrence(o: Object): Boolean {
        if (o == null) return false;
        atomic {
            for (var p: Node[E] = first; p != null; p = p.next) {
                if (o.equals(p.item)) {
                    unlink(p);
                    return true;
                }
            }
            return false;
        }
    }

    public def removeLastOccurrence(o: Object): Boolean {
        if (o == null) return false;
        atomic {
            for (var p: Node[E] = last; p != null; p = p.prev) {
                if (o.equals(p.item)) {
                    unlink(p);
                    return true;
                }
            }
            return false;
        }
    }

    // BlockingQueue methods

    /**
     * Inserts the specified element at the end of this deque unless it would
     * violate capacity restrictions.  When using a capacity-restricted deque,
     * it is generally preferable to use method {@link #offer(Object) offer}.
     *
     * <p>This method is equivalent to {@link #addLast}.
     *
     * @throws IllegalStateException if the element cannot be added at this
     *         time due to capacity restrictions
     * @throws NullPointerException if the specified element is null
     */
    public def add(e: E): Boolean {
	addLast(e);
	return true;
    }

    /**
     * @throws NullPointerException if the specified element is null
     */
    public def offer(e: E): Boolean {
	return offerLast(e);
    }

    /**
     * @throws NullPointerException {@inheritDoc}
     * @throws InterruptedException {@inheritDoc}
     */
    public def put(e: E): Void{
	putLast(e);
    }

    /**
     * @throws NullPointerException {@inheritDoc}
     * @throws InterruptedException {@inheritDoc}
     */
    public def offer(e: E, nanos: Long): Boolean {
	return offerLast(e, nanos);
    }

    /**
     * Retrieves and removes the head of the queue represented by this deque.
     * This method differs from {@link #poll poll} only in that it throws an
     * exception if this deque is empty.
     *
     * <p>This method is equivalent to {@link #removeFirst() removeFirst}.
     *
     * @return the head of the queue represented by this deque
     * @throws NoSuchElementException if this deque is empty
     */
    public def remove(): E {
	return removeFirst();
    }

    public def poll(): E {
	return pollFirst();
    }

    public def take(): E {
	return takeFirst();
    }

    public def poll(nanos: Long): E {
	return pollFirst(nanos);
    }

    /**
     * Retrieves, but does not remove, the head of the queue represented by
     * this deque.  This method differs from {@link #peek peek} only in that
     * it throws an exception if this deque is empty.
     *
     * <p>This method is equivalent to {@link #getFirst() getFirst}.
     *
     * @return the head of the queue represented by this deque
     * @throws NoSuchElementException if this deque is empty
     */
    public def element(): E {
	return getFirst();
    }

    public def peek(): E {
	return peekFirst();
    }

    /**
     * Returns the number of additional elements that this deque can ideally
     * (in the absence of memory or resource constraints) accept without
     * blocking. This is always equal to the initial capacity of this deque
     * less the current <tt>size</tt> of this deque.
     *
     * <p>Note that you <em>cannot</em> always tell if an attempt to insert
     * an element will succeed by inspecting <tt>remainingCapacity</tt>
     * because it may be the case that another thread is about to
     * insert or remove an element.
     */
    public def remainingCapacity(): Int {
        atomic return (capacity - count);
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
        atomic {
            for (var p: Node[E] = first; p != null; p = p.next)
                c.add(p.item);
            var n: Int = count;
            count = 0;
            first = last = null;
            return n;
        }
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
        atomic {
            n: Int = 0;
            while (n < maxElements && first != null) {
                c.add(first.item);
                first.prev = null;
                first = first.next;
                --count;
                ++n;
            }
            if (first == null)
                last = null;
            return n;
        }
    }

    // Stack methods

    /**
     * @throws IllegalStateException {@inheritDoc}
     * @throws NullPointerException  {@inheritDoc}
     */
    public def push(e: E): Void {
	addFirst(e);
    }

    /**
     * @throws NoSuchElementException {@inheritDoc}
     */
    public def pop(): E {
	return removeFirst();
    }

    // Collection methods

    /**
     * Removes the first occurrence of the specified element from this deque.
     * If the deque does not contain the element, it is unchanged.
     * More formally, removes the first element <tt>e</tt> such that
     * <tt>o.equals(e)</tt> (if such an element exists).
     * Returns <tt>true</tt> if this deque contained the specified element
     * (or equivalently, if this deque changed as a result of the call).
     *
     * <p>This method is equivalent to
     * {@link #removeFirstOccurrence(Object) removeFirstOccurrence}.
     *
     * @param o element to be removed from this deque, if present
     * @return <tt>true</tt> if this deque changed as a result of the call
     */
    public def remove(o: Object): Boolean {
	return removeFirstOccurrence(o);
    }

    /**
     * Returns the number of elements in this deque.
     *
     * @return the number of elements in this deque
     */
    public def size(): Int {
        atomic return count;
    }

    /**
     * Returns <tt>true</tt> if this deque contains the specified element.
     * More formally, returns <tt>true</tt> if and only if this deque contains
     * at least one element <tt>e</tt> such that <tt>o.equals(e)</tt>.
     *
     * @param o object to be checked for containment in this deque
     * @return <tt>true</tt> if this deque contains the specified element
     */
    public def contains(o: Object): Boolean {
        if (o == null) return false;
        atomic {
            for (var p: Node[E] = first; p != null; p = p.next)
                if (o.equals(p.item))
                    return true;
            return false;
        }
    }

    /**
     * Variant of removeFirstOccurrence needed by iterator.remove.
     * Searches for the node, not its contents.
     */
    def removeNode(e: Node[E]): Boolean {
        atomic {
            for (var p: Node[E] = first; p != null; p = p.next) {
                if (p == e) {
                    unlink(p);
                    return true;
                }
            }
            return false;
        }
    }

    /**
     * Returns an array containing all of the elements in this deque, in
     * proper sequence (from first to last element).
     *
     * <p>The returned array will be "safe" in that no references to it are
     * maintained by this deque.  (In other words, this method must allocate
     * a new array).  The caller is thus free to modify the returned array.
     *
     * <p>This method acts as bridge between array-based and collection-based
     * APIs.
     *
     * @return an array containing all of the elements in this deque
     */
    public atomic def toArray(): Rail[Object] {
    	var a: Rail[Object] = new Rail[Object](count);
            var k: Int = 0;
            for (var p: Node[E] = first; p != null; p = p.next)
            	a(k++) = p.item;
            return a;
    }

    /**
     * Returns an array containing all of the elements in this deque, in
     * proper sequence; the runtime type of the returned array is that of
     * the specified array.  If the deque fits in the specified array, it
     * is returned therein.  Otherwise, a new array is allocated with the
     * runtime type of the specified array and the size of this deque.
     *
     * <p>If this deque fits in the specified array with room to spare
     * (i.e., the array has more elements than this deque), the element in
     * the array immediately following the end of the deque is set to
     * <tt>null</tt>.
     *
     * <p>Like the {@link #toArray()} method, this method acts as bridge between
     * array-based and collection-based APIs.  Further, this method allows
     * precise control over the runtime type of the output array, and may,
     * under certain circumstances, be used to save allocation costs.
     *
     * <p>Suppose <tt>x</tt> is a deque known to contain only strings.
     * The following code can be used to dump the deque into a newly
     * allocated array of <tt>String</tt>:
     *
     * <pre>
     *     String[] y = x.toArray(new String[0]);</pre>
     *
     * Note that <tt>toArray(new Object[0])</tt> is identical in function to
     * <tt>toArray()</tt>.
     *
     * @param a the array into which the elements of the deque are to
     *          be stored, if it is big enough; otherwise, a new array of the
     *          same runtime type is allocated for this purpose
     * @return an array containing all of the elements in this deque
     * @throws ArrayStoreException if the runtime type of the specified array
     *         is not a supertype of the runtime type of every element in
     *         this deque
     * @throws NullPointerException if the specified array is null
     */
    public atomic def toArray(a: Rail[Object]): Rail[Object] {
    	 if (a.length < count)
    		 a = ( x10.lang.reflect.Array.newInstance(a.getClass().getComponentType(), count) as Rail[Object] );

    	 var k: Int = 0;
    	 for (p: Node[E] = first; p != null; p = p.next)
    		 a(k++) = (p.item as Object);
    	 if (a.length > k)
    		 a(k) = null;
    	 return a;
    }

    public atomic def toString(): String {
    	return super.toString();
    }

    /**
     * Atomically removes all of the elements from this deque.
     * The deque will be empty after this call returns.
     */
    public atomic def clear(): Void {
    	first = last = null;
    	count = 0;
    }

    /**
     * Returns an iterator over the elements in this deque in proper sequence.
     * The elements will be returned in order from first (head) to last (tail).
     * The returned <tt>Iterator</tt> is a "weakly consistent" iterator that
     * will never throw {@link ConcurrentModificationException},
     * and guarantees to traverse elements as they existed upon
     * construction of the iterator, and may (but is not guaranteed to)
     * reflect any modifications subsequent to construction.
     *
     * @return an iterator over the elements in this deque in proper sequence
     */
    public def iterator(): Iterator[E] {
        return new Itr();
    }

    /**
     * Returns an iterator over the elements in this deque in reverse
     * sequential order.  The elements will be returned in order from
     * last (tail) to first (head).
     * The returned <tt>Iterator</tt> is a "weakly consistent" iterator that
     * will never throw {@link ConcurrentModificationException},
     * and guarantees to traverse elements as they existed upon
     * construction of the iterator, and may (but is not guaranteed to)
     * reflect any modifications subsequent to construction.
     */
    public def descendingIterator(): Iterator[E] {
        return new DescendingItr();
    }

    /**
     * Base class for Iterators for LinkedBlockingDeque
     */
    private abstract class AbstractItr implements Iterator[E] {
        /**
         * The next node to return in next
         */
         var next: Node[E];

        /**
         * nextItem holds on to item fields because once we claim that
         * an element exists in hasNext(), we must return item read
         * under lock (in advance()) even if it was in the process of
         * being removed when hasNext() was called.
         */
        var nextItem: E;

        /**
         * Node returned by most recent call to next. Needed by remove.
         * Reset to null if this element is deleted by a call to remove.
         */
        private var lastRet: Node[E];

        def this() {
            advance(); // set to initial position
        }

        /**
         * Advances next, or if not yet initialized, sets to first node.
         * Implemented to move forward vs backward in the two subclasses.
         */
        abstract def advance(): void;

        public def hasNext(): Boolean {
            return next != null;
        }

        public def next(): E {
            if (next == null)
                throw new NoSuchElementException();
            lastRet = next;
            x: E = nextItem;
            advance();
            return x;
        }

        public def remove(): Void {
            n: Node[E] = lastRet;
            if (n == null)
                throw new IllegalStateException();
            lastRet = null;
            // Note: removeNode rescans looking for this node to make
            // sure it was not already removed. Otherwise, trying to
            // re-remove could corrupt list.
            removeNode(n);
        }
    }

    /** Forward iterator */
    private class Itr extends AbstractItr {
        atomic def advance(): Void {
                next = (next == null)? first : next.next;
                nextItem = (next == null)? null : next.item;
        }
    }

    /**
     * Descending iterator for LinkedBlockingDeque
     */
    private class DescendingItr extends AbstractItr {
        atomic def advance(): Void {
                next = (next == null)? last : next.prev;
                nextItem = (next == null)? null : next.item;
        }
    }

}
