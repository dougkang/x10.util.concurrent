/*
 * Mirroring x10 test for ConcurrentHashMap
 */

import java.util.concurrent.*;

public class ConcurrentHashMapTest {
    public static void main(String[] args) {
        ConcurrentHashMapTest testObject = new ConcurrentHashMapTest();
	testObject.testClear();
	testObject.testContainsKey();
	testObject.testGet();
	testObject.testIsEmpty();
	testObject.testReplace();
	testObject.testPutIfAbsent();
	testObject.testRemove();
	testObject.testSize();
    }

    /**
     * Create a map from Integers 1-5 to Strings "A"-"E".
     */
    private static ConcurrentHashMap map5() {
        ConcurrentHashMap map = new ConcurrentHashMap(5);
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
    public void testClear() {
        ConcurrentHashMap map = map5();
        map.clear();
       	if(map.size() == 0) System.out.println("PASSED: testClear()");
        else System.out.println("FAILED: testClear()");
    }

    public void testContains() {
        ConcurrentHashMap map = map5();
        if(map.contains("A")) System.out.println("PASSED: map.contains(\"A\")");
        else System.out.println("FAILED: map.contains(\"A\")");
        if(map.contains("Z")) System.out.println("FAILED: !map.contains(\"Z\")");
        else System.out.println("PASSED: map.contains(\"Z\")");
    }

    /**
     *  containsKey returns true for contained key
     */
    public void testContainsKey() {
        ConcurrentHashMap map = map5();
        if(map.containsKey("one")) System.out.println("PASSED: map.containsKey(\"one\")");
	else System.out.println("FAILED: map.containsKey(\"one\")");
        if(map.containsKey("zero")) System.out.println("FAILED: map.containsKey(\"zero\")");
	else System.out.println("PASSED: map.containsKey(\"zero\")");
    }

    /**
     *  get returns the correct element at the given key,
     *  or null if not present
     */
    public void testGet() {
        ConcurrentHashMap map = map5();
        ConcurrentHashMap empty = new ConcurrentHashMap();
        if((map.get("one")).equals("A")) System.out.println("PASSED: map.get(\"one\")");
	else System.out.println("FAILED: map.get(\"one\")");
        if(empty.get("anything") == null) System.out.println("PASSED: empty.get(\"anything\") from empty map");
	else System.out.println("FAILED: empty.get(\"anything\") from empty map");
    }

    /**
     *  isEmpty is true of empty map and false for non-empty
     */
    public void testIsEmpty() {
        ConcurrentHashMap empty = new ConcurrentHashMap();
        ConcurrentHashMap map = map5();
        if(empty.isEmpty()) System.out.println("PASSED: Map empty");
	else System.out.println("FAILED: Map not empty");
        if(!map.isEmpty()) System.out.println("PASSED: Map is not empty");
	else System.out.println("FAILED: Map is empty");
    }

    /**
     *   putIfAbsent works when the given key is not present
     */
    public void testPutIfAbsent() {
        ConcurrentHashMap map = map5();
        map.putIfAbsent("six", "Z");
        if(map.containsKey("six")) System.out.println("PASSED: map.putIfAbsent(\"six\",\"Z\")");
	else System.out.println("FAILED: map.putIfAbsent(\"six\",\"Z\")");
    }

    /**
     *   replace fails when the given key is not present
     */
    public void testReplace() {
        ConcurrentHashMap map = map5();
        if(map.replace("six", "Z") == null) System.out.println("PASSED: map.replace(\"six\",\"Z\")");
	else System.out.println("FAILED: map.replace(six,\"Z\")");
        if(!map.containsKey("six")) System.out.println("PASSED: key is not in hashmap for testReplace()");
	else System.out.println("FAILED: value pair inserted for testReplace()");
    }

    /**
     *   remove removes the correct key-value pair from the map
     */
    public void testRemove() {
        ConcurrentHashMap map = map5();
        map.remove("five");
        if(map.size() == 4) System.out.println("PASSED: map.remove(\"five\") cause size to change");
	else System.out.println("PASSED: map.remove(\"five\") did not cause size to change");
        if(!map.containsKey("five")) System.out.println("PASSED: map.remove(\"five\")");
	else System.out.println("PASSED: map.remove(\"five\")");
    }

    /**
     *   size returns the correct values
     */
    public void testSize() {
        ConcurrentHashMap map = map5();
        ConcurrentHashMap empty = new ConcurrentHashMap();
        if(empty.size()==0) System.out.println("PASSED: map.size()==0");
	else System.out.println("FAILED: map.size()");
        if(map.size()==5) System.out.println("PASSED: map.size()==5");
	else System.out.println("FAILED: map.size()==5");
    }

}
