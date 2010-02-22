import x10.util.*;

public interface NavigableSet[T] extends SortedSet[T] {

	def lower(t: T) : T;
	def floor(t: T) : T;
	def ceiling(t: T) : T;
	def higher(t: T) : T;
	def pollfirst() : T;
	def pollLast() : T;
	def iterator() : Iterator[T];
	def descendingSet() : NavigableSet[T];
	def descendingIterator() : Iterator[T];
	def subSet(fromElement: T, fromInclusive: Boolean, toElement: T, toInclusive: Boolean) : NavigableSet[T];
	def headSet(toElement: T, inclusive: Boolean) : NavigableSet[T];
	def tailSet(fromElement: T, inclusive: Boolean) : NavigableSet[T];
	def subSet(fromElement: T, toElement: T) : SortedSet[T];
	def headSet(toElement: T) : SortedSet[T];
	def tailSet(fromElement: T) : SortedSet[T];
}
