import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.atomic.AtomicInteger;


/**
 * The classic hello world program, shows how to output to the console.
 * @author ??
 * @author vj 
 */
class ConcurrentHashMap {
	var hMaps:Rail[HashMap[String, String]]!;
	var numBoxes:Int;
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
	
	/*Constructors and helper methods for them*/
	/**/
	public def this(var numMaps:Int) {
		var temp:RailBuilder[HashMap[String, String]]! = new RailBuilder[HashMap[String, String]](numMaps);
		this.numBoxes = numMaps;
		for(var i:Int = 0; i<numMaps; i++) {
			temp.add(new HashMap[String, String]());
		}
		hMaps = temp.result();
		size = new AtomicInteger(0);
	}
	
	public def this() {
		this(DEFAULT_NUM_BOXES);
	}
	
	/*public methods for Concurrent HashMap*/
	public def put(keyStr:String, valStr:String):void {
		//calculates the bucket to put the data in by
		//modding the hash value with the number of buckets
		var index:Int = keyStr.hashCode()%numBoxes;
		atomic hMaps(index).put(keyStr, valStr);
		size.incrementAndGet();
	}
	
	public def get(keyStr:String):String {
		var index:Int = keyStr.hashCode()%numBoxes;
		var retVal:Box[String];
		atomic retVal = hMaps(index).get(keyStr);
		return retVal.value();
	}
	
	public def size():Int {
		return size.get();
	}
	
	public def clear():void {
		for(var i:Int = 0; i<numBoxes; i++) {
			hMaps(i).clear();
		}
		size.set(0);
	}
	
	public def isEmpty():Boolean {
		if(size.get() != 0)
			return false;
		else
			return true;
	}
	
	public def containsKey(var key:String):Boolean{
		var hash:Int = key.hashCode()%numBoxes;
		return hMaps(hash).containsKey(key);
	}

}


