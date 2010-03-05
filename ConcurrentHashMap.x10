import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.atomic.AtomicInteger;
 
 
/**
 * ConcurrentHashMap that should perform normal hashmap functions atomically.
 * @author Ryan Evans
 * @author Jessica Wang
 */
 
class ConcurrentHashMap[K,V] extends AbstractMap[K, V] {

	//an array of non-concurrent hashmaps to store data in
	private var hMaps:Rail[HashMap[K, V]]!;
	//the number of non-concurrent hashmaps in the array
	private val numBoxes:Int;
	//an atomic integer to store the total number of elements in
	//the array of non-concurrent hashmaps
	private var size:AtomicInteger;
 
	static DEFAULT_NUM_BOXES:Int = 16;
	
	/*Constructors*/
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
 
 
	/*public methods for Concurrent HashMap*/
 
	//overriding equals function in Object
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

	//clears all the hash maps in this data structure
	public def clear():void {
		for(var i:Int = 0; i<numBoxes; i++) {
		//this needs to have an atomic in front of it
		//just need to add safe keyword to clear method
		//in HashMap.x10 to compile without error
			hMaps(i).clear();
		}
		size.set(0);
	}
 
	// contains method	
	public def contains(val:Object):Boolean {
		return containsValue(val);	
	}
 
	// containsValue method
	public def containsValue(val:Object):Boolean {
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
 
	//returns true if the key is stored in a hashmap, false otherwise
	public safe def containsKey(key:K):Boolean{
		var temphash:Int = key.hashCode();
		if(temphash < 0)
			temphash *= -1;
		val index:Int = temphash%numBoxes;
		return hMaps(index).containsKey(key);
	}
 
	//returns a Set with all the entries from all the HashMaps in it
	public def entries():Set[Map.Entry[K,V]] {
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
 
	//returns the value attached to the key
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

	//methods from Map Interface
	public safe def getOrElse(k: K, orelse: V) : V {
		var result: Box[V] = get(k);
		if (result == null)
			return orelse;
		return result.value;
	}

	public safe def getOrThrow(k: K) : V {
		var result: Box[V] = get(k);
		if (result == null)
			throw new NoSuchElementException();
		return result.value;
	}
 
	//returns true if the hashmap has no elements, false otherwise
	public def isEmpty():Boolean {
		if(size.get() != 0)
			return false;
		else
			return true;
	}
 
	//returns a Set with all the keys from all the HashMaps in it
	public def keySet():Set[K] {
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

	//returns a Collection with all the values from the HashMaps in it
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
	
 
	//put method
	public def put(key:K, val:V):Box[V] {
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
 

	//copies all of the mappings from the specified map to this one
	//replaces any mappings that this map had for any of the keys
	// currently in the specified map
	public def putAll(map:Map[K, V]!):void {
		mapset:Set[Map.Entry[K,V]]! = map.entries();
 
		var iterator:Iterator[Map.Entry[K, V]]! = mapset.iterator();
		while(iterator.hasNext()) {
			var entry:Map.Entry[K, V]! = iterator.next();
			put(entry.getKey(), entry.getValue());
		}
	}
 
	//putIfAbsent method
	public def putIfAbsent(key:K, val:V):Box[V] {
		if (!containsKey(key))
			return put(key, val);
		else
			return get(key);
	}
 
	//remove method	with 1 parameter
	public def remove(key:K):Box[V] {
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
 
	//remove method with 2 parameters
	public def remove(key:K, val:V):Boolean {
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
 
	public def replace(key:K, val:V): Box[V] {
		if (containsKey(key)) {
			return put(key, val);
		}
		else return null;
	}
 
	public def replace(key:K, oldVal:V, newVal:V):Boolean {
		if (get(key) == null)
			return false;
		else if (get(key).value.equals(oldVal)) {
			put(key, newVal);
			return true;
		}
		else return false;
	}
 
	public def size():Int {
		return size.get();
	}

	// returns iterators instead of enumerations	
	public def keys() : Iterator[K] {
        	val keys: Set[K]! = keySet();
		return keys.iterator();
    	}
	
	public def elements() : Iterator[V] {
        	val val: Collection[V]! = values();
		return val.iterator();
    	}
}
