/*Things to know:
putting a ! after a variable declaration solves some compiler issues
var declared a changeable variable, val declares an unchangeable one
() is used to index into an array
[] is used to specify a type of a multi-type class
git add files
git commit -m "COMMENTS"
git push git@github.com:dougkang/x10.util.concurrent.git to push
need to change all the strings to objects, or better yet, to
arbitrary key value variables like the HashMap underneath
*/
 
import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.atomic.AtomicInteger;
 
 
/**
 * ConcurrentHashMap that should perform normal hashmap functions atomically.
 * @author Ryan Evans
 * @author Jessica Wang
 */
 
class ConcurrentHashMap {

	//an array of non-concurrent hashmaps to store data in
	var hMaps:Rail[HashMap[Object, Object]]!;
	//the number of non-concurrent hashmaps in the array
	val numBoxes:Int;
	//an atomic integer to store the total number of elements in
	//the array of non-concurrent hashmaps
	var size:AtomicInteger;
 
	static DEFAULT_NUM_BOXES:Int = 16;
 
	/*Constructors*/
	/**/
	public def this(var numMaps:Int) {

		if(numMaps < 1) numMaps = 1;
		//construct a temporary railbuilder to build
		//our array of hashmaps
		var temp:RailBuilder[HashMap[Object, Object]]!
		= new RailBuilder[HashMap[Object, Object]](numMaps);
		//initialize the array
		for(var i:Int = 0; i<numMaps; i++) {
			temp.add(new HashMap[Object, Object]());
		}
		hMaps = temp.result();
		size = new AtomicInteger(0);
		numBoxes = numMaps;
		}
 
	public def this() {
		this(DEFAULT_NUM_BOXES);
	}
 
 
	/*public methods for Concurrent HashMap*/
 
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
		var entries:Set[Map.Entry[Object, Object]]! = entrySet();
		var iterator:Iterator[Map.Entry[Object, Object]]! = entries.iterator();
 
		var entry:Map.Entry[Object, Object]!;
		var curVal:Object;
		while(iterator.hasNext()) {
			entry = iterator.next();
			curVal = entry.getValue();
			if(val.equals(curVal))
				return true;
		}
		return false;
	}
 
	//skipping elements() for now because I don't know what an enumeration is
 
	//returns true if the key is stored in a hashmap, false otherwise
	public def containsKey(var key:Object):Boolean{
		var temphash:Int = key.hashCode();
		if(temphash < 0)
			temphash *= -1;
		val index:Int = temphash%numBoxes;
		return hMaps(index).containsKey(key);
	}
 
	//returns a Set with all the entries from all the HashMaps in it
	public def entrySet():Set[Map.Entry[Object,Object]] {
		first:Set[Map.Entry[Object,Object]]! = hMaps(0).entries();
		for(var i:Int = 1; i<numBoxes; i++) {
			first.addAll(hMaps(i).entries());
		}
		return first;
	}
 
	//returns the value attached to the key
	public def get(key:Object):Object {
		var hash:Int = key.hashCode();
		if(hash < 0)
			hash *= -1;
		val index:Int = hash%numBoxes;
		var retVal:Box[Object];
		//Console.OUT.println("The index of " + key.toString() + " is: " + index + " when computed with " + numBoxes + "boxes.");
		atomic retVal = hMaps(index).get(key);
		if(retVal==null) return null;
		else return retVal.value();
	}
 
	//returns true if the hashmap has no elements, false otherwise
	public def isEmpty():Boolean {
		if(size.get() != 0)
			return false;
		else
			return true;
	}
 
	//skipping keys() for now because I don't know what an enumeration is
 
	//returns a Set with all the keys from all the HashMaps in it
	public def keySet():Set[Object] {
		first:Set[Object]! = hMaps(0).keySet();
		for(var i:Int = 1; i<numBoxes; i++) {
			first.addAll(hMaps(i).keySet());
		}
		return first;
	}
 
	//put method
	public def put(key:Object, val:Object):Object {
		//calculates the bucket to put the data in by
		//modding the hash value with the number of buckets
		prevVal:Object = get(key);
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
	public def putAll(map:Map[Object, Object]!):void {
		mapset:Set[Map.Entry[Object,Object]]! = map.entries();
 
		var iterator:Iterator[Map.Entry[Object, Object]]! = mapset.iterator();
		while(iterator.hasNext()) {
			var entry:Map.Entry[Object, Object]! = iterator.next();
			put(entry.getKey(), entry.getValue());
		}
	}
 
	//putIfAbsent method
	public def putIfAbsent(key:Object, val:Object):Object {
		if (!containsKey(key))
			return put(key, val);
		else
			return get(key);
	}
 
	//remove method	with 1 parameter
	public def remove(key:Object):Object {
		var hash:Int = key.hashCode();
		if(hash < 0)
			hash *= -1;
		val index:Int = hash%numBoxes;
		val retVal:Box[Object];
		retVal = hMaps(index).remove(key);
		if(retVal==null) return null;
		else {
			size.decrementAndGet();
			return retVal.value();
		}
	}
 
	//remove method with 2 parameters
	public def remove(key:Object, val:Object):Boolean {
		val retVal:Object = get(key);
		if(retVal!=null && retVal.equals(val)) {
			remove(key);
			return true;
		}
		return false;
	}
 
	public def replace(key:Object, val:Object):Object {
		if (containsKey(key)) {
			return put(key, val);
		}
		else return null;
	}
 
	public def replace(key:Object, oldVal:Object, newVal:Object):Boolean {
		if (get(key).equals(oldVal)) {
			put(key, newVal);
			return true;
		}
		else return false;
	}
 
	public def size():Int {
		return size.get();
	}
 
	//values() looks like it will take some work, so I'll try to implement it later
 
}
