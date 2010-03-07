package x10.util.concurrent;
import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.atomic.AtomicInteger;
 
/**
 * A concurrent form of HashMap that should perform normal hashmap functions atomically.
 *
 * Parameters for the class:
 * <K> the type of keys maintained by this map
 * <V> the type of mapped values
 *
 * Authors:
 * Ryan Evans
 * Jessica Wang
 * UCLA CS130 Winter 2010
 * 
 * Class/Comments Reference:
 * openjdk-6-src-b18-16_feb_2010
 */
 
class ConcurrentHashMap[K,V] extends AbstractMap[K, V] {

	//a rail of non-concurrent hashmaps to store data in
	private var hMaps:Rail[HashMap[K, V]]!;
	//the number of non-concurrent hashmaps in the rail
	private val numBoxes:Int;
	//an atomic integer to store the total number of elements in the array of non-concurrent hashmaps
	private var size:AtomicInteger;
 
	//static default number of non-concurrent hashmaps in the rail
	static DEFAULT_NUM_BOXES:Int = 16;
	
	/*
	 * Constructors: takes in parameter specifying number of non-concurrent hashmaps
	 */
	public def this(var numMaps:Int) {

		if(numMaps < 1) numMaps = 1;
		//construct a temporary railbuilder to build
		//our array of hashmaps
		var temp:RailBuilder[HashMap[K, V]]!
		= new RailBuilder[HashMap[K, V]](numMaps);
		//initialize the array
		for(var i:Int = 0; i<numMaps; i++) {
			temp.add(new HashMap[K, V]());
		}
		hMaps = temp.result();
		size = new AtomicInteger(0);
		numBoxes = numMaps;
		}
 
	public def this() {
		this(DEFAULT_NUM_BOXES);
	}
 
	/*
	 * This function overrides the equals function in Object
	 * Should return true only if object is of type ConcurrentHashMap, has the
	 * same size and has the exactly key-value pairs as this ConcurrentHashMap.
	 */
	public def equals(o: Object) : Boolean {
		if (this == o)
			return true;
		else if (!(o instanceof ConcurrentHashMap[K,V]))
			return false;
		else {
			var map2: ConcurrentHashMap[K,V]! = o as ConcurrentHashMap[K,V];
			if (this.size() == map2.size()) {
				// compare values inside only if sizes are the same
				var s:Set[Map.Entry[K,V]]! = map2.entries();		
				var it:Iterator[Map.Entry[K,V]]! = s.iterator();
			
				while(it.hasNext()) {
					var cur: Map.Entry[K,V]! = it.next();
					var key: K = cur.getKey();
					var matchval: Box[V] = this.get(key);
					if(matchval == null)
						return false;
					else if(!cur.getValue().equals(matchval.value))
					{
						return false;
					}
				}
			
				s = this.entries();
				it = s.iterator();
			
				while(it.hasNext()) {
					var cur: Map.Entry[K,V]! = it.next();
					var key: K = cur.getKey();
					var matchval: Box[V] = map2.get(key);
					if(matchval == null)
						return false;
					else if(!cur.getValue().equals(matchval.value))
					{
						return false;
					}
				}
				// equal if both sets map to each other exactly
				return true;
			}
		}
		return false;
	}

	/*
	 * Removes all mappings from this map.
	 */
	public def clear() : void {
		for(var i:Int = 0; i<numBoxes; i++) {
		//this needs to have an atomic in front of it
		//just need to add safe keyword to clear method
		//in HashMap.x10 to compile without error
			hMaps(i).clear();
		}
		size.set(0);
	}
 
	/* 
	 * Legacy method from Java testing if some key maps into the specified value in this table.
	 */
	public def contains(val: Object) : Boolean {
		return containsValue(val);	
	}
 
	/*
	 * Returns true if this map maps one or more keys to the specified value.
	 */
	public def containsValue(val: Object) : Boolean {
		var entries:Set[Map.Entry[K, V]]! = entries();
		var iterator:Iterator[Map.Entry[K, V]]! = entries.iterator();
 
		var entry:Map.Entry[K, V]!;
		var curVal:V;
		while(iterator.hasNext()) {
			entry = iterator.next();
			curVal = entry.getValue();
			if(val.equals(curVal))
				return true;
		}
		return false;
	}
 
	/*
	 * Tests if the specified object is a key in this table.
	 */
	public safe def containsKey(key: K) : Boolean{
		var temphash:Int = key.hashCode();
		if(temphash < 0)
			temphash *= -1;
		val index:Int = temphash%numBoxes;
		return hMaps(index).containsKey(key);
	}
 
	/*
	 * Returns a set of the mappings contained in this map.
 	 */
	public def entries() : Set[Map.Entry[K,V]] {
		var whole:HashMap[K,V]! = hMaps(0);
		for(var i:Int = 1; i<numBoxes; i++) {
			var it: Iterator[Map.Entry[K, V]]! = hMaps(i).entries().iterator();
			while (it.hasNext()) {
				var cur: Map.Entry[K, V]! = it.next();
				whole.put(cur.getKey(), cur.getValue());
			}
		}
		return whole.entries();
	}
 
	/*
	 * Returns the value to which the specified key is mapped in this table.
	 */
	public safe def get(key:K):Box[V] {
		var hash:Int = key.hashCode();
		if(hash < 0)
			hash *= -1;
		val index:Int = hash%numBoxes;
		var retVal:Box[V];
		atomic retVal = hMaps(index).get(key);
		if(retVal==null) return null;
		else return retVal.value();
	}

	/* 
	 * Method from Map Interface: Returns the value from the key-mapping or V if key returns no mapping. 
	 */
	public safe def getOrElse(k: K, orelse: V) : V {
		var result: Box[V] = get(k);
		if (result == null)
			return orelse;
		return result.value;
	}

	/*
	 * Returns the value from the key-mapping or throw a NoSuchElementException() exception if 
	 * key returns no mapping.
	 */
	public safe def getOrThrow(k: K) : V {
		var result: Box[V] = get(k);
		if (result == null)
			throw new NoSuchElementException();
		return result.value;
	}
 
	/*
	 * Returns true if this map contains no key-value mappings.
	 */
	public def isEmpty() : Boolean {
		if(size.get() != 0)
			return false;
		else
			return true;
	}
 
	/*
	 * Returns a set view of the keys contained in this map.
	 */
	public def keySet() : Set[K] {
		var whole:HashMap[K,V]! = hMaps(0);
		for(var i:Int = 1; i<numBoxes; i++) {
			var it: Iterator[Map.Entry[K, V]]! = hMaps(i).entries().iterator();
			while (it.hasNext()) {
				var cur: Map.Entry[K, V]! = it.next();
				whole.put(cur.getKey(), cur.getValue());
			}
		}
		return whole.keySet();
	}

	/*
	 * Returns a collection view of the values contained in this map.
	 */
	public def values() : Collection[V] {
        	var vs: Collection[V]! = new HashSet[V]();
        	for(var i:Int = 0; i<numBoxes; i++) {
			var it: Iterator[Map.Entry[K, V]]! = hMaps(i).entries().iterator();
			while (it.hasNext()) {
				var cur: Map.Entry[K, V]! = it.next();
				vs.add(cur.getValue());
			}
		}
		return vs;
    	}
	
 
	/*
	 * Maps the specified key to the specified value in this table.
	 */
	public def put(key:K, val:V) : Box[V] {
		//calculates the bucket to put the data in by
		//modding the hash value with the number of buckets
		val prevVal:Box[V];
		if (get(key) != null)
			prevVal = get(key).value;
		else
			prevVal = null;
		var hash:Int = key.hashCode();
		if(hash < 0)
			hash *= -1;
		val index:Int = hash%numBoxes;
		atomic hMaps(index).put(key, val);
		if(prevVal==null)
			size.incrementAndGet();
		return prevVal;
	}
 

	/*
	 * Copies all of the mappings from the specified map to this one
 	 * replaces any mappings that this map had for any of the keys
	 * currently in the specified map.
	 */
	public def putAll(map: Map[K, V]!) : void {
		mapset:Set[Map.Entry[K,V]]! = map.entries();
 
		var iterator:Iterator[Map.Entry[K, V]]! = mapset.iterator();
		while(iterator.hasNext()) {
			var entry:Map.Entry[K, V]! = iterator.next();
			put(entry.getKey(), entry.getValue());
		}
	}
 
	/* 
	 * If the specified key is not already associated with a value, associate it with the given value.
	 */
	public def putIfAbsent(key: K, val: V) : Box[V] {
		if (!containsKey(key))
			return put(key, val);
		else
			return get(key);
	}
 
	/*
	 * Removes the key (and its corresponding value) from this table.
	 */
	public def remove(key: K) : Box[V] {
		var hash:Int = key.hashCode();
		if(hash < 0)
			hash *= -1;
		val index:Int = hash%numBoxes;
		val retVal:Box[V];
		retVal = hMaps(index).remove(key);
		if(retVal==null) return null;
		else {
			size.decrementAndGet();
			return retVal.value();
		}
	}
 
	/*
	 * Remove entry for key only if currently mapped to given value.
	 */
	public def remove(key: K, val: V) : Boolean {
		val retVal:Box[V];
		if (get(key) != null)
			retVal = get(key).value;
		else
			retVal = null;
		if(retVal!=null && val!= null && retVal.value.equals(val)) {
			remove(key);
			return true;
		}
		return false;
	}
 
	/*
	 * Replace entry for key only if currently mapped to some value.
	 */
	public def replace(key: K, val: V) : Box[V] {
		if (containsKey(key)) {
			return put(key, val);
		}
		else return null;
	}
 
	/*
	 * Replace entry for key only if currently mapped to given value.
	 */
	public def replace(key: K, oldVal: V, newVal: V) : Boolean {
		if (get(key) == null)
			return false;
		else if (get(key).value.equals(oldVal)) {
			put(key, newVal);
			return true;
		}
		else return false;
	}
 	
	/*
	 * Returns the number of key-value mappings in this map.
	 */
	public def size() : Int {
		return size.get();
	}

	/*
	 * Returns an iterator of the keys in this table.
	 */
	public def keys() : Iterator[K] {
        	val keys: Set[K]! = keySet();
		return keys.iterator();
    	}
	
	/*
	 * Returns an iterator of the values in this table.
	 */
	public def elements() : Iterator[V] {
        	val val: Collection[V]! = values();
		return val.iterator();
    	}
}
