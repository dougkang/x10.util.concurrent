package x10.util.concurrent;
import x10.util.*;

public interface ConcurrentNavigableMap[K,V] extends ConcurrentMap[K,V], NavigableMap[K,V]
{
    def subMap(fromKey: K, fromInclusive: boolean, toKey: K, toInclusive: boolean) : ConcurrentNavigableMap[K,V];
    def headMap(toKey: K, inclusive: boolean) : ConcurrentNavigableMap[K,V];
    def tailMap(fromKey: K, inclusive: boolean) : ConcurrentNavigableMap[K,V];
    def subMap(fromKey: K, toKey: K) : ConcurrentNavigableMap[K,V];
    def headMap(toKey: K) : ConcurrentNavigableMap[K,V];
    def tailMap(fromKey: K) : ConcurrentNavigableMap[K,V];
    def descendingMap() : ConcurrentNavigableMap[K,V];
    public def navigableKeySet() : NavigableSet[K] ;
    def keySet() : NavigableSet[K];
    public def descendingKeySet() : NavigableSet[K];
}

