package x10.util;

public interface SortedMap[K,V] extends Map[K,V] {
    def comparator(): Comparator[K];
    def subMap(fromKey: K, toKey: K): SortedMap[K,V];
    def headMap(toKey: K): SortedMap[K,V];
    def firstKey(): K;
    def lastKey(): K;
    def keySet(): Set[K];
    def values(): Collection[V];
    def entrySet(): Set[Map.Entry[K, V]];
}
