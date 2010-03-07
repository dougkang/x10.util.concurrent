package x10.util.concurrent;
import x10.util.*;

/**
 * A ConcurrentMap supporting NavigableMap operations.
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

public interface ConcurrentNavigableMap[K,V] extends ConcurrentMap[K,V], NavigableMap[K,V]
{
	/*
	 * Returns a view of the portion of this map whose keys range from fromKey to toKey.
	 */
    	def subMap(fromKey: K, fromInclusive: Boolean, toKey: K, toInclusive: Boolean) : ConcurrentNavigableMap[K,V];

	/*
	 * Returns a view of the portion of this map whose keys are less than or equal to (if inclusive is true) toKey.
	 */
	def headMap(toKey: K, inclusive: Boolean) : ConcurrentNavigableMap[K,V];

	/*
	 * Returns a view of the portion of this map whose keys are greater than or equal to (if inclusive is true) fromKey.
	 */
    	def tailMap(fromKey: K, inclusive: Boolean) : ConcurrentNavigableMap[K,V];
	
	/*
	 * returns a view of the portion of this map whose keys range from fromKey, inclusive, to toKey, exclusive.
	 */    	
	def subMap(fromKey: K, toKey: K) : ConcurrentNavigableMap[K,V];

	/*
	 * Returns a view of the portion of this map whose keys are strictly less than toKey.
	 */	
    	def headMap(toKey: K) : ConcurrentNavigableMap[K,V];

	/*
	 * Returns a view of the portion of this map whose keys are greater than or equal to fromKey.
	 */
    	def tailMap(fromKey: K) : ConcurrentNavigableMap[K,V];

	/*
	 * Returns a reverse order view of the mappings contained in this map.
	 */
    	def descendingMap() : ConcurrentNavigableMap[K,V];
    
	/*
	 * Returns a NavigableSet view of the keys contained in this map.
	 */
	def navigableKeySet() : NavigableSet[K];
	
	/*
	 * Returns a NavigableSet view of the keys contained in this map.
	 */
    	def keySet() : NavigableSet[K];

 	/*
	 * Returns a reverse order NavigableSet view of the keys contained in this map.
	 */
	 public def descendingKeySet() : NavigableSet[K];
}

