/*Things to know:
	putting a ! after a variable declaration solves some compiler issues
	var declared a changeable variable, val declares an unchangeable one
	() is used to index into an array
	[] is used to specify a type of a multi-type class
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
	
	public static def main(args:Rail[String]):void {
		var CHMObject:ConcurrentHashMap! = new ConcurrentHashMap();

		CHMObject.put("1", "jim");
		CHMObject.put("2", "edwards");		
		
		if(CHMObject.get("1").equals("jim")) Console.OUT.println("success");
		else Console.OUT.println("failure");

		if(CHMObject.get("2").equals("edwards")) Console.OUT.println("success");
		else Console.OUT.println("failure");

		if(CHMObject.size() == 2)  Console.OUT.println("success");
		else Console.OUT.println("failure");
		
		if(CHMObject.isEmpty()) Console.OUT.println("failure");
		else Console.OUT.println("success");
		
		if(CHMObject.containsKey("1")) Console.OUT.println("success");
		else Console.OUT.println("failure");
		
		if(CHMObject.containsKey("3")) Console.OUT.println("failure");
		else  Console.OUT.println("success");
		
		CHMObject.remove("1");
		
		if(CHMObject.containsKey("1")) Console.OUT.println("failure");
		else Console.OUT.println("success");
	
		CHMObject.clear();
	
		if(CHMObject.isEmpty()) Console.OUT.println("success");
		else Console.OUT.println("failure");
	}
	

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

	public def contains(val:Object):Boolean {
		return containsValue(val);
	}
	
	public def containsValue(val:Object):Boolean {
		var entires:Set[Map.Entry[Object, Object]]! = entrySet();
		var iterator:Iterator[Map.Entry[Object, Object]]! = entires.iterator();
		
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
		atomic {
			val hash:Int = key.hashCode()%numBoxes;
			return hMaps(hash).containsKey(key);
		}
	}
	
	//returns a Set with all the entires from all the HashMaps in it
	public def entrySet():Set[Map.Entry[Object,Object]] {
		var first:Set[Map.Entry[Object,Object]]! = hMaps(0).entries();
		for(var i:Int = 1; i<numBoxes; i++) {
			first.addAll(hMaps(i).entries());
		}
		return first;
	}
	
	//returns the value attached to the key
	public def get(key:Object):Object {
		val index:Int = key.hashCode()%numBoxes;
		var retVal:Box[Object];
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

	public def put(key:Object, val:Object):Object {
		//calculates the bucket to put the data in by
		//modding the hash value with the number of buckets
		prevVal:Object = get(key);
		var index:Int = key.hashCode()%numBoxes;
		atomic hMaps(index).put(key, val);
		if(prevVal==null)
			size.incrementAndGet();
		return prevVal;
	}
	
	//putAll looks hard, so skipping it for now
	
	public def putIfAbsent(key:Object, val:Object):Object {
		if (containsKey(key)) 
			return put(key, val);
		else
			return get(key);
	}
	
	public def remove(key:Object):Object {
		val index:Int = key.hashCode()%numBoxes;
		val retVal:Box[Object];
		retVal = hMaps(index).remove(key);
		if(retVal==null) return null;
		else {
			size.decrementAndGet();
			return retVal.value();
		}
	}
	
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
