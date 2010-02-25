//package x10.util.concurrent;
import x10.util.Map;

public interface ConcurrentMap[K, V] extends Map[K, V] {
    def putIfAbsent(key: K, value: V) : V;
    def remove(key: Object, value: Object) : boolean;
    def replace(key: K, oldValue: V, newValue: V) : boolean;
    def replace(key: K, value: V) : V;
}

