package x10.util;

/**
 * A SortedSet extended with navigation methods reporting closest matches for given search targets.
 *
 * Parameters for the interface:
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

public interface NavigableSet[T] extends SortedSet[T] {

	/*
	 * Returns the greatest element in this set strictly less than the given element, or null if there is no such element.
	 */
	def lower(t: T) : Box[T];

	/*
	 * Returns the greatest element in this set less than or equal to the given element, or null if there is no such element.
	 */
	def floor(t: T) : Box[T];

	/*
	 * Returns the least element in this set greater than or equal to the given element, or null if there is no such element.
	 */
	def ceiling(t: T) : Box[T];

	/*
	 * Returns the least element in this set strictly greater than the given element, or null if there is no such element.
	 */
	def higher(t: T) : Box[T];

	/*
	 * Retrieves and removes the first (lowest) element, or returns null if this set is empty.
	 */
	def pollfirst() : Box[T];

	/*
	 * Retrieves and removes the last (highest) element, or returns null if this set is empty.
	 */
	def pollLast() : Box[T];

	/*
	 * Returns an iterator over the elements in this set, in ascending order.
	 */
	def iterator() : Iterator[T];

	/*
	 * Returns a reverse order view of the elements contained in this set.
	 */	
	def descendingSet() : NavigableSet[T];

	/*
	 * Returns an iterator over the elements in this set, in descending order.
	 */
	def descendingIterator() : Iterator[T];

	/*
	 * Returns a view of the portion of this set whose elements range from fromElement to toElement.
	 */	
	def subSet(fromElement: T, fromInclusive: Boolean, toElement: T, toInclusive: Boolean) : NavigableSet[T];

	/*
	 * Returns a view of the portion of this set whose elements are less than (or equal to, if inclusive is true) toElement.
	 */	
	def headSet(toElement: T, inclusive: Boolean) : NavigableSet[T];

	/*
	 * Returns a view of the portion of this set whose elements are greater than (or equal to, if inclusive is true) fromElement.
	 */	
	def tailSet(fromElement: T, inclusive: Boolean) : NavigableSet[T];

	/*
	 * Returns a view of the portion of this set whose elements range from fromElement, inclusive, to toElement, exclusive.
	 */
	def subSet(fromElement: T, toElement: T) : SortedSet[T];

	/*
	 * Returns a view of the portion of this set whose elements are strictly less than toElement.
	 */	
	def headSet(toElement: T) : SortedSet[T];

	/*
	 * Returns a view of the portion of this set whose elements are greater than or equal to fromElement.
	 */
	def tailSet(fromElement: T) : SortedSet[T];
}
