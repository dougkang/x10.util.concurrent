package x10.util;
import x10.util.Map.Entry;

/**
 * This class provides a skeletal implementation of the Map interface. 
 *
 * Each of these methods may be overridden if the map being implemented has
 * a more efficient implementation. 
 * 
 * Parameters for the class:
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

public abstract class AbstractMap[K,V] implements Map[K,V] {
	/**
     	 * Sole constructor.  (For invocation by subclass constructors, typically
     	 * implicit.)
     	 */
    	protected def this() {
    	}
	
	// Query Operations

    	/**
     	 * This implementation returns entries().size().
     	 */
    	public def size() : Int {
        	return entries().size();
    	}

	/**
     	 * This implementation returns size() == 0.
     	 */
    	public def isEmpty() : Boolean {
        	return size() == 0;
    	}

	/**
	 * Operation not supported, should override this method
	 */
	public def put(key: K, value: V) : Box[V] {
        	throw new UnsupportedOperationException();
    	}

    	public def clear() : void {
        	entries().clear();
    	}

	public abstract def entries(): Set[Map.Entry[K,V]];

	public def iterator() : Iterator[Map.Entry[K,V]] { return entries().iterator(); }

	/**
	 * Copies all values into a HashSet, which implements Collection and 
	 * returns this HashSet
	 */
	public def values(): Collection[V] {
		var vs: Collection[V]! = new HashSet[V]();
		var it: Iterator[Map.Entry[K, V]]! = iterator();
		while (it.hasNext()) {
			var cur: Map.Entry[K, V]! = it.next();
			vs.add(cur.getValue());
		}
		return vs;
    	}

	/**
	 * Extracts all entries and places all keys into a HashSet
	 */
	public def keySet(): Set[K] {
		/*if (keySet == null)
           		keySet = new AbstractMap_AbstractSet_1[K](this); 
		return keySet;*/
		var whole:Set[K]! = new HashSet[K]();
		var it: Iterator[Map.Entry[K,V]]! = iterator();
		while (it.hasNext()) {
			var cur: Map.Entry[K,V]! = it.next();
			whole.add(cur.getKey());
		}
		return whole;
    	}

	/**
	 * Entry that maintains immutable value fields
	 */
	public static class SimpleImmutableEntry[K,V] implements Map.Entry[K,V]
	{
		private global val key: Box[K];
		private global val value: Box[V];

		/**
		 * Creates an entry representing a mapping from the specified
		 * key to the specified value.
		 */
		public def this(key: K, value: V) {
		    this.key   = key;
		    this.value = value;
		}

		/**
		 * Creates an entry representing the same mapping as the
		 * specified entry.
		 */
		public def this(entry: Entry[K, V]!) {
			this.key   = entry.getKey();
			this.value = entry.getValue();
		}

		/**
		 * Returns the key corresponding to this entry.
		 */
		public def getKey(): K {
			if (key == null)
				return null as K;
		    	return key.value();
		}

		/**
		 * Returns the value corresponding to this entry.
		 */
		public def getValue(): V {
			if (value == null)
				return null as V;
		    	return value.value();
		}

		/**
		 * Replaces the value corresponding to this entry with the specified
		 * value (optional operation).  This implementation simply throws
		 * UnsupportedOperationException, as this class implements
		 * an immutable map entry.
		 */
		public def setValue(value: V): void {
			throw new UnsupportedOperationException();
		}

		/**
		 * Compares the specified object with this entry for equality.
		 * Returns true if the given object is also a map entry and
		 * the two entries represent the same mapping.
		 */
		public def equals(o: Object): Boolean {
			if (!(o instanceof Entry[K,V]))
		        	return false;
		    	var e: Entry[K,V]! = o as Entry[K,V]!;
		    	return (key == null ? e.getKey() == null : key.equals(e.getKey())) && 
				(value == null ? e.getValue() == null : value.equals(e.getValue()));
		}

		/**
		 * Returns the hash code value for this map entry.
		 */
		public global safe def hashCode() : Int {
			return (key   == null ? 0 :   key.hashCode()) ^
		        	(value == null ? 0 : value.hashCode());
		}

		/**
		 * Returns a String representation of this map entry.  This
		 * implementation returns the string representation of this
		 * entry's key followed by the equals character ("=")
		 * followed by the string representation of this entry's value.
		 */
		public global safe def toString() : String {
			return key + "=" + value;
		}
	}
	
}

