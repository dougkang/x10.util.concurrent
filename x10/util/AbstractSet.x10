package x10.util;
import x10.util.*;

/**
 * This class provides a skeletal implementation of the Set interface. 
 *
 * Note this class does not override an of the implementations from the
 * AbstractCollection class. It adds implementations for equals and hashCode.
 * 
 * Parameters for the class:
 * <T> the type of elements maintained by this set
 *
 * Authors:
 * Vincent Ying
 * Jessica Wang
 * UCLA CS130 Winter 2010
 * 
 * Class/Comments Reference:
 * openjdk-6-src-b18-16_feb_2010
 */

public abstract class AbstractSet[T] extends AbstractCollection[T] implements Set[T] {
	/*
	 * Sole constructor
	 */
	protected def this() { }

	/*
	 * Compares the specified object with this set for equality. Returns true 
	 * if the given object is also a set, the two sets have the same size, and 
	 * every member of the given set is contained in this set.
	 */
	public def equals(o: Object) : Boolean {
		if (o == this)
			return true;
		
		if (! (o instanceof Set))
			return false;
		var c: Collection[T]! = o as Collection[T];
		if (c.size() != size())
			return false;
		try {
			return containsAll(c);
		} catch (unused: ClassCastException) {
			return false;
		} catch (unused: NullPointerException) {
			return false;
		}
	}

	/*
	 * This method returns the hash code value for this set. It is left as abstract and currently unimplemented
	 * because the iterator used for traversal is not marked as safe and global.
	 */
	public abstract global safe def hashCode() : Int;
	
	/* 
	 * This optional operation is unsupported because the iterator method does not implement the remove method 
	 */
	public def removeAll(c: Collection[T]!) : Boolean {
		throw new UnsupportedOperationException();
	}
}
