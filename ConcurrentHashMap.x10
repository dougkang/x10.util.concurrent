/*Things to know:
	putting a ! after a variable declaration solves some compiler issues
	var declared a changeable variable, val declares an unchangeable one
	() is used to index into an array
	[] is used to specify a type of a multi-type class
*/

import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.atomic.AtomicInteger;


/**
 * The classic hello world program, shows how to output to the console.
 * @author ??
 * @author vj 
 */
class ConcurrentHashMap {
	//an array of non-concurrent hashmaps that store data in
	var hMaps:Rail[HashMap[String, String]]!;
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
		
		Console.OUT.println(CHMObject.get("1"));
		Console.OUT.println(CHMObject.get("2"));
		Console.OUT.println("The size is " + CHMObject.size());
		
		if(CHMObject.isEmpty()) Console.OUT.println("Is Empty");
		else Console.OUT.println("Is not Empty.");
	
		CHMObject.clear();
	
		if(CHMObject.isEmpty()) Console.OUT.println("Is Empty");
		else Console.OUT.println("Is not Empty.");
	}
	

	/*Constructors*/
	/**/
	public def this(var numMaps:Int) {
		if(numMaps < 1) numMaps = 1;
		var temp:RailBuilder[HashMap[String, String]]!
			= new RailBuilder[HashMap[String, String]](numMaps);
		for(var i:Int = 0; i<numMaps; i++) {
			temp.add(new HashMap[String, String]());
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

	//can't do contains() or containsValue() because underlying hashmap
	//does not implement those functions

	//skipping elements() for now because I don't know what an enumeration is
	
	//returns true if the key is stored in a hashmap, false otherwise
	public def containsKey(var key:String):Boolean{
		var hash:Int = key.hashCode()%numBoxes;
		return hMaps(hash).containsKey(key);
	}
	
	//returns a Set with all the entires from all the HashMaps in it
	public def entrySet():Set[Map.Entry[String,String]] {
		first:Set[Map.Entry[String,String]]! = hMaps(0).entries();
		for(var i:Int = 1; i<numBoxes; i++) {
			first.addAll(hMaps(i).entries());
		}
		return first;
	}
	
	//returns the value attached to the string
	//need to check retval for null before calling retValue.value()
	public def get(keyStr:String):String {
		var index:Int = keyStr.hashCode()%numBoxes;
		var retVal:Box[String];
		atomic retVal = hMaps(index).get(keyStr);
		return retVal.value();
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
	public def keySet():Set[String] {
		first:Set[String]! = hMaps(0).keySet();
		for(var i:Int = 1; i<numBoxes; i++) {
			first.addAll(hMaps(i).keySet());
		}
		return first;
	}	

	public def put(keyStr:String, valStr:String):void {
		//calculates the bucket to put the data in by
		//modding the hash value with the number of buckets
		var index:Int = keyStr.hashCode()%numBoxes;
		atomic hMaps(index).put(keyStr, valStr);
		size.incrementAndGet();
	}
	
	public def size():Int {
		return size.get();
	}

}


