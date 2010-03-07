package x10.util;

/*
 * A set that guarantees its iterator will traverse the set in ascending element order, sorted according to the 
 * natural ordering of its elements, or by a Comparator provided at sorted set creation time.
 *
 * Parameters for the interface:
 * <T> The type of elements maintained by this set.
 *
 * Authors:
 * Vincent Ying
 * Jessica Wang
 * UCLA CS130 Winter 2010
 *
 *
 * Class/Comments Reference:
 * openjdk-6-src-b18-16_feb_2010
 */
public interface SortedSet[T] extends Set[T] {

	/*
	 * Returns the comparator associated with this sorted set, 
	 * or null if it uses its elements' natural ordering.
	 */
	def comparator() : Comparator[T];

	/*
	 * Returns a view of the portion of this sorted set whose elements range from 
	 * fromElement, inclusive, to toElement, exclusive.
	 */
	def subSet(fromElement: T, toElement: T) : SortedSet[T];

	/*
	 * Returns a view of the portion of this sorted set whose elements are strictly less than toElement.
	 */
	def headSet(toElement: T) : SortedSet[T];

	/*
	 * Returns a view of the portion of this sorted set whose elements are greater than or equal to fromElement.
	 */
	def tailSet(fromElement: T) : SortedSet[T];

	/*
	 * Returns the first (lowest) element currently in this sorted set.
	 */
	def first() : T;

	/*
	 * Returns the last (highest) element currently in this sorted set.
	 */
	def last() : T;
}
