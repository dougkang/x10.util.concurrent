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
 
 
/**
 * ConcurrentHashMap that should perform normal hashmap functions atomically.
 * @author Ryan Evans
 * @author Jessica Wang
 */
 
class ConcurrentHashMapTest {
	var map:ConcurrentHashMap;
	var map1:ConcurrentHashMap;
	var map2:ConcurrentHashMap;
 
	public static def main(args:Rail[String]!):void {
		val testObject:ConcurrentHashMapTest! = new ConcurrentHashMapTest();
		testObject.testClear();
		testObject.testContainsKey();
		testObject.testGet();
		testObject.testIsEmpty();
		testObject.testReplace();
		testObject.testPutIfAbsent();
		testObject.testRemove();
		testObject.testSize();
	}
 
	private def map5():ConcurrentHashMap {
	    var map:ConcurrentHashMap! = new ConcurrentHashMap(5);
        map.put("one", "A");
        map.put("two", "B");
        map.put("three", "C");
        map.put("four", "D");
        map.put("five", "E");
        return map;
	}
    /**
     *  clear removes all pairs
     */
    public def testClear():void {
        map = map5();
        map.clear();
        if(map.size() == 0) Console.OUT.println("PASSED: testClear()");
        else Console.OUT.println("FAILED: testClear()");
    }

    /**
     *  Maps with same contents are equal
    public def testEquals():void {
	var map3:HashMap[String, String]! = new HashMap[String,String](2);
	var map4:HashMap[String, String]! = new HashMap[String,String](2);
	map3.put("1","one");
	map3.put("2","two");
	map4.put("1","one");
	map4.put("2","two");
	if(map3.equals(map4)) 
		Console.OUT.println("THIS WORKS AT LEAST");
	else Console.OUT.println("object equals is broken");
	var map3:HashMap[String, String]! = new HashMap[String,String](2);
	var map4:HashMap[String, String]! = new HashMap[String,String](2);
	map3.put("1","one");
	map3.put("2","two");
	map4.put("1","one");
	map4.put("2","two");
	var some:Set[Map.Entry[String,String]]! = map4.entries();
	some.addAll(map3.entries());
	
	

        map1 = map5();
        map2 = map5();
        if(map1.equals(map2)) Console.OUT.println("PASSED: map1.equals(map2)");
        else Console.OUT.println("FAILED: map1.equals(map2)");
        if(map2.equals(map1)) Console.OUT.println("PASSED: map2.equals(map1).");
        else Console.OUT.println("FAILED: map2.equals(map1)");
        map1.clear();
        if(map1.equals(map2)) Console.OUT.println("FAILED: !map1.equals(map2)");
        else Console.OUT.println("PASSED: !map1.equals(map2)");
        if(map2.equals(map1)) Console.OUT.println("FAILED: !map2.equals(map1).");
        else Console.OUT.println("PASSED: !map2.equals(map1)");
    }*/

    /**
     *  contains returns true for contained value
     */
    public def testContains():void {
        map = map5();
        if(map.contains("A")) Console.OUT.println("PASSED: map.contains(\"A\")");
        else Console.OUT.println("FAILED: map.contains(\"A\")");
        if(map.contains("Z")) Console.OUT.println("FAILED: !map.contains(\"Z\")");
        else Console.OUT.println("PASSED: map.contains(\"Z\")");
    }

    /**
     * containsKey returns true for one and false for zero
     */
    public def testContainsKey():void {
        map = map5();
        if(map.containsKey("one")) Console.OUT.println("PASSED: map.containsKey(\"one\")");
	else Console.OUT.println("FAILED: map.containsKey(\"one\")");
        if(map.containsKey("zero")) Console.OUT.println("FAILED: map.containsKey(\"zero\")");
	else Console.OUT.println("PASSED: map.containsKey(\"zero\")");
    }

    /**
     * containsValue returns true for A and false for Z
     
    public def testContainsValue():void {
        map = map5();
        if(map.containsValue("A")) Console.OUT.println("PASSED: map.containsValue(\"A\")");
        else Console.OUT.println("FAILED: map.containsValue(\"A\")");
        if(map.containsValue("Z")) Console.OUT.println("FAILED: !map.containsValue(\"Z\")");
        else Console.OUT.println("PASSED: map.containsValue(\"Z\")");
    }*/

    /**
     * testReplace returns true if replaced, false if not replaced
     */
    public def testReplace():void {
        map = map5();
        if(map.replace("six", "Z") == null) Console.OUT.println("PASSED: map.replace(\"six\",\"Z\")");
	else Console.OUT.println("FAILED: map.replace(\"six\",\"Z\")");
        if(!map.containsKey("six")) Console.OUT.println("PASSED: key is not in hashmap for testReplace()");
	else Console.OUT.println("FAILED: value pair inserted for testReplace()");
    }

    /**
     * putIfAbsent is true if value is inserted, false when not inserted
     */
    public def testPutIfAbsent():void {
        map = map5();
        map.putIfAbsent("six", "Z");
        if(map.containsKey("six")) Console.OUT.println("PASSED: map.putIfAbsent(\"six\",\"Z\")");
	else Console.OUT.println("FAILED: map.putIfAbsent(\"six\",\"Z\")");
    }

    /**
     * testGet is true if value retrieved
     */
    public def testGet():void {
        map = map5();
        if((map.get("one")).equals("A")) Console.OUT.println("PASSED: map.get(\"one\")");
	else Console.OUT.println("FAILED: map.get(\"one\")");
        var empty:ConcurrentHashMap! = new ConcurrentHashMap();
        if(empty.get("anything") == null) Console.OUT.println("PASSED: empty.get(\"anything\") from empty map");
	else Console.OUT.println("FAILED: empty.get(\"anything\") from empty map");
    }
    
    /**
     * testGet is true if value retrieved
     */
     public def testIsEmpty():void {
        var empty:ConcurrentHashMap! = new ConcurrentHashMap();
        map = map5();
	if(empty.isEmpty()) Console.OUT.println("PASSED: Map empty");
	else Console.OUT.println("FAILED: Map not empty");
        if(!map.isEmpty()) Console.OUT.println("PASSED: Map is not empty");
	else Console.OUT.println("FAILED: Map is empty");
    }

    /**
     * testRemove is true if value is removed
     */
    public def testRemove():void {
        map = map5();
        map.remove("five");
        if(map.size() == 4) Console.OUT.println("PASSED: map.remove(\"five\") cause size to change");
	else Console.OUT.println("PASSED: map.remove(\"five\") did not cause size to change");
        if(!map.containsKey("five")) Console.OUT.println("PASSED: map.remove(\"five\")");
	else Console.OUT.println("PASSED: map.remove(\"five\")");
    }

    /**
     *   size returns the correct values
     */
    public def testSize():void {
        map = map5();
        var empty:ConcurrentHashMap! = new ConcurrentHashMap();
        if(empty.size()==0) Console.OUT.println("PASSED: map.size()==0");
	else Console.OUT.println("FAILED: map.size()");
        if(map.size()==5) Console.OUT.println("PASSED: map.size()==5");
	else Console.OUT.println("FAILED: map.size()==5");
    }
}
