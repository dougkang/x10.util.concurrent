package x10.util;


/*
 * A map that further guarantees that it will be in ascending key order, 
 * sorted according to the natural ordering of its keys (see the Comparable interface), 
 * or by a comparator provided at sorted map creation time.
 * 
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
 *
 * Class/Comments Reference:
 * openjdk-6-src-b18-16_feb_2010
 */
public interface SortedMap[K,V] extends Map[K,V] {

	/*
	 * Returns the comparator associated with this sorted map, or null if it uses its keys' natural ordering.
	 */
	def comparator(): Comparator[K];

	/*
	 * Returns a view of the portion of this sorted map whose keys range 
	 * from fromKey, inclusive, to toKey, exclusive.
	 */
	def subMap(fromKey: K, toKey: K): SortedMap[K,V];

	/*
	 * Returns a view of the portion of this sorted map whose keys are strictly less than toKey.
	 */
    	def headMap(toKey: K): SortedMap[K,V];

	/*
	 * Returns the first (lowest) key currently in this sorted map.
	 */
    	def firstKey(): K;

	/*
	 * Returns the last (highest) key currently in this sorted map.
	 */
    	def lastKey(): K;
}
