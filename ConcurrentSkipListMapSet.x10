// package x10.util.concurrent;
// import sun.misc.Unsafe;
import x10.util.*;

public class ConcurrentSkipListSet [E] extends AbstractSet[E]
    implements NavigableSet[E] {				// Cloneable, java.io.Serializable

    /**
     * The underlying map. Uses Boolean.TRUE as value for each
     * element.  This field is declared final for the sake of thread
     * safety, which entails some ugliness in clone()
     */
    private def final m: ConcurrentNavigableMap[E,Object];

    /**
     * Constructs a new, empty set that orders its elements according to
     * their {@linkplain Comparable natural ordering}.
     */
    public this() {
        m = new ConcurrentSkipListMap[E,Object]();
    }

    /**
     * Constructs a new, empty set that orders its elements according to
     * the specified comparator.
     *
     * @param comparator the comparator that will be used to order this set.
     *        If <tt>null</tt>, the {@linkplain Comparable natural
     *        ordering} of the elements will be used.
     */
    public def this(comparator: Comparator[E]) {
        m = new ConcurrentSkipListMap[E,Object](comparator);
    }

    /**
     * Constructs a new set containing the elements in the specified
     * collection, that orders its elements according to their
     * {@linkplain Comparable natural ordering}.
     *
     * @param c The elements that will comprise the new set
     * @throws ClassCastException if the elements in <tt>c</tt> are
     *         not {@link Comparable}, or are not mutually comparable
     * @throws NullPointerException if the specified collection or any
     *         of its elements are null
     */
    public def this(c: Collection[E]) {		// Collection<? extends E>
        m = new ConcurrentSkipListMap[E,Object]();
        addAll(c);
    }

    /**
     * Constructs a new set containing the same elements and using the
     * same ordering as the specified sorted set.
     *
     * @param s sorted set whose elements will comprise the new set
     * @throws NullPointerException if the specified sorted set or any
     *         of its elements are null
     */
    public def this(s: SortedSet[E]) {
        m = new ConcurrentSkipListMap[E,Object](s.comparator());
        addAll(s);
    }

    /**
     * For use by submaps
     */
    def this(m: ConcurrentNavigableMap[E,Object]) {
        this.m = m;
    }

    /**
     * Returns a shallow copy of this <tt>ConcurrentSkipListSet</tt>
     * instance. (The elements themselves are not cloned.)
     *
     * @return a shallow copy of this set
     */
    public def clone() : ConcurrentSkipListSet[E] {
        var clone: ConcurrentSkipListSet[E] = null;
        try {
            clone = super.clone() as ConcurrentSkipListSet[E];
            clone.setMap(new ConcurrentSkipListMap(m));
        } catch (e: OperationUnsupportedException) {		// CloneNotSupportedException
            throw new InternalError();
        }

        return clone;
    }

    /* ---------------- Set operations -------------- */

    /**
     * Returns the number of elements in this set.  If this set
     * contains more than <tt>Integer.MAX_VALUE</tt> elements, it
     * returns <tt>Integer.MAX_VALUE</tt>.
     *
     * <p>Beware that, unlike in most collections, this method is
     * <em>NOT</em> a constant-time operation. Because of the
     * asynchronous nature of these sets, determining the current
     * number of elements requires traversing them all to count them.
     * Additionally, it is possible for the size to change during
     * execution of this method, in which case the returned result
     * will be inaccurate. Thus, this method is typically not very
     * useful in concurrent applications.
     *
     * @return the number of elements in this set
     */
    public def size() : Int {
        return m.size();
    }

    /**
     * Returns <tt>true</tt> if this set contains no elements.
     * @return <tt>true</tt> if this set contains no elements
     */
    public def isEmpty() : Boolean {
        return m.isEmpty();
    }

    /**
     * Returns <tt>true</tt> if this set contains the specified element.
     * More formally, returns <tt>true</tt> if and only if this set
     * contains an element <tt>e</tt> such that <tt>o.equals(e)</tt>.
     *
     * @param o object to be checked for containment in this set
     * @return <tt>true</tt> if this set contains the specified element
     * @throws ClassCastException if the specified element cannot be
     *         compared with the elements currently in this set
     * @throws NullPointerException if the specified element is null
     */
    public def contains(o: Object) : Boolean {
        return m.containsKey(o);
    }

    /**
     * Adds the specified element to this set if it is not already present.
     * More formally, adds the specified element <tt>e</tt> to this set if
     * the set contains no element <tt>e2</tt> such that <tt>e.equals(e2)</tt>.
     * If this set already contains the element, the call leaves the set
     * unchanged and returns <tt>false</tt>.
     *
     * @param e element to be added to this set
     * @return <tt>true</tt> if this set did not already contain the
     *         specified element
     * @throws ClassCastException if <tt>e</tt> cannot be compared
     *         with the elements currently in this set
     * @throws NullPointerException if the specified element is null
     */
    public def add(e: E) : Boolean {
        return m.putIfAbsent(e, Boolean.TRUE) == null;
    }

    /**
     * Removes the specified element from this set if it is present.
     * More formally, removes an element <tt>e</tt> such that
     * <tt>o.equals(e)</tt>, if this set contains such an element.
     * Returns <tt>true</tt> if this set contained the element (or
     * equivalently, if this set changed as a result of the call).
     * (This set will not contain the element once the call returns.)
     *
     * @param o object to be removed from this set, if present
     * @return <tt>true</tt> if this set contained the specified element
     * @throws ClassCastException if <tt>o</tt> cannot be compared
     *         with the elements currently in this set
     * @throws NullPointerException if the specified element is null
     */
    public def remove(o: Object) : Boolean {
        return m.remove(o, Boolean.TRUE);
    }

    /**
     * Removes all of the elements from this set.
     */
    public def clear() : void {
        m.clear();
    }

    /**
     * Returns an iterator over the elements in this set in ascending order.
     *
     * @return an iterator over the elements in this set in ascending order
     */
    public def iterator() : Iterator[E] {
        return m.navigableKeySet().iterator();
    }

    /**
     * Returns an iterator over the elements in this set in descending order.
     *
     * @return an iterator over the elements in this set in descending order
     */
    public def descendingIterator() : Iterator[E] {
        return m.descendingKeySet().iterator();
    }


    /* ---------------- AbstractSet Overrides -------------- */

    /**
     * Compares the specified object with this set for equality.  Returns
     * <tt>true</tt> if the specified object is also a set, the two sets
     * have the same size, and every member of the specified set is
     * contained in this set (or equivalently, every member of this set is
     * contained in the specified set).  This definition ensures that the
     * equals method works properly across different implementations of the
     * set interface.
     *
     * @param o the object to be compared for equality with this set
     * @return <tt>true</tt> if the specified object is equal to this set
     */
    public def equals(o: Object) : Boolean {
        // Override AbstractSet version to avoid calling size()
        if (o == this)
            return true;
        if (!(o instanceof Set))
            return false;
        var c: Collection[?] = o as Collection[?];
        try {
            return containsAll(c) && c.containsAll(this);
        } catch (unused: ClassCastException)   {
            return false;
        } catch (unused: NullPointerException) {
            return false;
        }
    }

    /**
     * Removes from this set all of its elements that are contained in
     * the specified collection.  If the specified collection is also
     * a set, this operation effectively modifies this set so that its
     * value is the <i>asymmetric set difference</i> of the two sets.
     *
     * @param  c collection containing elements to be removed from this set
     * @return <tt>true</tt> if this set changed as a result of the call
     * @throws ClassCastException if the types of one or more elements in this
     *         set are incompatible with the specified collection
     * @throws NullPointerException if the specified collection or any
     *         of its elements are null
     */
    public def removeAll(c: Collection[?]) : Boolean {
        // Override AbstractSet version to avoid unnecessary call to size()
        var modified: Boolean = false;
        for (var i: Iterator[?] = c.iterator(); i.hasNext(); )
            if (remove(i.next()))
                modified = true;
        return modified;
    }

    /* ---------------- Relational operations -------------- */

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if the specified element is null
     */
    public def lower(e: E) : E{
        return m.lowerKey(e);
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if the specified element is null
     */
    public def floor(e: E) : E {
        return m.floorKey(e);
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if the specified element is null
     */
    public def ceiling(e: E) : E {
        return m.ceilingKey(e);
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if the specified element is null
     */
    public def higher(e: E) : E {
        return m.higherKey(e);
    }

    public def pollFirst() : E {
        var e: Map.Entry[E,Object] = m.pollFirstEntry();
        return e == null? null : e.getKey();
    }

    public def pollLast() : E {
        var e: Map.Entry[E,Object] = m.pollLastEntry();
        return e == null? null : e.getKey();
    }


    /* ---------------- SortedSet operations -------------- */


    public def comparator() : Comparator[E] {
        return m.comparator();
    }

    /**
     * @throws NoSuchElementException {@inheritDoc}
     */
    public def first() : E {
        return m.firstKey();
    }

    /**
     * @throws NoSuchElementException {@inheritDoc}
     */
    public def last() : E {
        return m.lastKey();
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if {@code fromElement} or
     *         {@code toElement} is null
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def subSet(fromElement: E, fromInclusive: Boolean, toElement: E,
			toInclusive: Boolean) : NavigableSet[E] {
        return new ConcurrentSkipListSet[E](m.subMap(fromElement, fromInclusive, toElement, toInclusive));
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if {@code toElement} is null
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def headSet(toElement: E, inclusive: Boolean) : NavigableSet[E] {
        return new ConcurrentSkipListSet[E](m.headMap(toElement, inclusive));
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if {@code fromElement} is null
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def tailSet(fromElement: E, inclusive: Boolean) : NavigableSet[E] {
        return new ConcurrentSkipListSet[E](m.tailMap(fromElement, inclusive));
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if {@code fromElement} or
     *         {@code toElement} is null
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def subSet(fromElement: E, toElement: E) : NavigableSet[E] {
        return subSet(fromElement, true, toElement, false);
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if {@code toElement} is null
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def headSet(toElement: E) : NavigableSet[E] {
        return headSet(toElement, false);
    }

    /**
     * @throws ClassCastException {@inheritDoc}
     * @throws NullPointerException if {@code fromElement} is null
     * @throws IllegalArgumentException {@inheritDoc}
     */
    public def tailSet(fromElement: E) : NavigableSet[E] {
        return tailSet(fromElement, true);
    }

    /**
     * Returns a reverse order view of the elements contained in this set.
     * The descending set is backed by this set, so changes to the set are
     * reflected in the descending set, and vice-versa.
     *
     * <p>The returned set has an ordering equivalent to
     * <tt>{@link Collections#reverseOrder(Comparator) Collections.reverseOrder}(comparator())</tt>.
     * The expression {@code s.descendingSet().descendingSet()} returns a
     * view of {@code s} essentially equivalent to {@code s}.
     *
     * @return a reverse order view of this set
     */
    public def descendingSet() : NavigableSet[E] {
        return new ConcurrentSkipListSet(m.descendingMap());
    }

    // Support for resetting map in clone

    // private static final Unsafe unsafe = Unsafe.getUnsafe();
    // private static final long mapOffset;

    static {
        try {
            mapOffset = unsafe.objectFieldOffset
                (ConcurrentSkipListSet.class.getDeclaredField("m"));
        } catch (ex: Exception) { throw new Error(ex); }
    }
    private def setMap(map: ConcurrentNavigableMap[E,Object]) : void {
        unsafe.putObjectVolatile(this, mapOffset, map);
    }

}
