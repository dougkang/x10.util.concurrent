import x10.util.Set;

public interface SortedSet[T] extends Set[T] {

	def comparator() : Comparator[T];
	def subSet(fromElement: T, toElement: T) : SortedSet[T];
	def headSet(toElement: T) : SortedSet[T];
	def tailSet(fromElement: T) : SortedSet[T];
	def first() : T;
	def last() : T;
}
