package x10.util;

/**
 * A comparison function, which imposes a total ordering on some collection
 * of objects. Comparators can be passed to a sort method to allow precise
 * control over the sort order. 
 *
 * Note this class does not override an of the implementations from the
 * AbstractCollection class. It adds implementations for equals and hashCode.
 * 
 * Parameters for the interface:
 * <T> the type of objects that may be compared by this comparator
 *
 * Authors:
 * Vincent Ying
 * Jessica Wang
 * UCLA CS130 Winter 2010
 * 
 * Class/Comments Reference:
 * openjdk-6-src-b18-16_feb_2010
 */

public interface Comparator[T] {
	/* 
	 * Compares two arguments for order. Returns a negative Int, zero, or positive Int
	 * if the first argument is less than, equal to, or greater than the second respectively.
	 */
	def compare(that1:T, that2:T):Int;
	
	/*
	 * Indicates whether some other object is equal to this comparator. 
	 */
	def equals(that:T):Boolean;
}
