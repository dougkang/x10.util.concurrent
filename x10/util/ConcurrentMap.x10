package x10.util;
import x10.util.Map;

/**
 * A Map providing additional atomic putIfAbsent, remove, and replace methods.
 * 
 * Parameters for the interface:
 * <K> the type of keys maintained by this map
 * <V> the type of mapped values
 *
 * Authors:
 * Vincent Ying
 * Jessica Wang
 * UCLA CS130 Winter 2010
 * 
 * Class/Comments Reference:
 * openjdk-6-src-b18-16_feb_2010
 */

public interface ConcurrentMap[K, V] extends Map[K, V] {
  
	/* 
	 * If the specified key is not already associated with a value,
	 * associate it with the given value (performed atomically).\
	 *
	 * Returns the previous value associated with the specified key or
	 * null if there was no mapping for the key.
	 */
	def putIfAbsent(key: K, value: V) : Box[V];
	
	/*
	 * Removes the entry for a key only if currently mapped to a given value.
	 *
	 * Returns true if the value was removed.
	 */
    	def remove(key: K, value: V) : Boolean;

	/*
	 * Replaces entry for a key only if currently mapped to a given value.
	 *
	 * Returns true if the value was replaced.
	 */
    	def replace(key: K, oldValue: V, newValue: V) : Boolean;

	/*
	 * Replaces entry for a key only if currently mapped to some value.
	 *
	 * Returns the previous value associated with the specified key or 
	 * null if there was no mapping for the key.
	 */
    	def replace(key: K, value: V) : Box[V];
}


