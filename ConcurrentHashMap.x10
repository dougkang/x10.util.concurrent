import x10.io.Console;
import x10.util.HashMap;

/**
 * The classic hello world program, shows how to output to the console.
 * @author ??
 * @author vj 
 */
class ConcurrentHashMap {
	hMap:HashMap[String, String]!;
	
	public static def main(args:Rail[String]):void {
		CHMObject:ConcurrentHashMap! = new ConcurrentHashMap();
		valStr:String = "Jim";
		keyStr:String = "1";
		CHMObject.put(keyStr, valStr);
		retVal:String = CHMObject.get(keyStr);
		Console.OUT.println(retVal);
	}
	
	public def this() {
		hMap = new HashMap[String, String]();
	}
	
	public def put(keyStr:String, valStr:String):void {
		atomic hMap.put(keyStr, valStr);
	}
	
	public def get(keyStr:String):String {
		retVal:Box[String] = hMap.get(keyStr);
		return retVal.value();
	}

}


