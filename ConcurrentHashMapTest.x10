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
import x10.util.concurrent.*;
 
 
/**
 * ConcurrentHashMap that should perform normal hashmap functions atomically.
 * @author Ryan Evans
 * @author Jessica Wang
 * @author Vincent Ying
 */
 
class ConcurrentHashMapTest {

    	var test:Test;

	var map:ConcurrentHashMap[String, String];
	var map1:ConcurrentHashMap[String, String];
	var map2:ConcurrentHashMap[String, String];
 
	public static def main(args:Rail[String]!):void {
		val testObject:ConcurrentHashMapTest! = new ConcurrentHashMapTest();
		testObject.testClear();
		testObject.testContainsKey();
		testObject.testContainsValue();
		testObject.testGet();
		testObject.testIsEmpty();
		testObject.testReplace();
		testObject.testReplace2();
		testObject.testPutIfAbsent();
		testObject.testPutIfAbsent2();
		testObject.testRemove();
		testObject.testRemove2();
		testObject.testRemove3();
		testObject.testSize();
		testObject.testKeySet();
		testObject.testEntrySetToArray();
		testObject.testEntrySet();

		testObject.testEnumeration();
		testObject.testKeys();
		testObject.testValuesToArray();
		testObject.testValues();

		//testObject.testConcurrency();
		testObject.testPutAll();
		testObject.testEquals(); 

	}
 
	private def map5():ConcurrentHashMap[String, String] {
	    var map:ConcurrentHashMap[String, String]! = new ConcurrentHashMap[String, String](5);
		test.assertTrue(map.isEmpty());
        	
		map.put("one", "A");
        	map.put("two", "B");
        	map.put("three", "C");
        	map.put("four", "D");
        	map.put("five", "E");

		test.assertFalse(map.isEmpty());
		// test.assertFalse(5, map.size());

        	return map;
	}

    /**
     * Concurrency demo
     */
   public def testConcurrency():void {
    	map = map5();
        finish {

		for(shared var k: Int = 0; k < 100; k++) {
			val kk:String = k.toString();
			async { 
				map.put("one", kk); 
				Console.OUT.println("Now storing " + kk + " into key \"one\"");
			}
			
		}
		for(shared var k: Int = 0; k < 100; k++) {
			async { 
				Console.OUT.println("Now retrieving " + map.get("one"));
			}
			
		}
	}
	Console.OUT.println(map.get("one"));
    }
    
    /**
     *  clear removes all pairs
     */
    public def testClear():void {
     	   map = map5();
     	   map.clear();
           test.assertEquals(map.size(), 0);
    }

    /**
     *  Maps with same contents are equal
     */
    public def testEquals():void {
        map1 = map5();
        map2 = map5();
	test.assertTrue(map1.equals(map1));
	test.assertTrue(map2.equals(map1));
	test.assertTrue(map1.equals(map2));

        map1.clear();
	test.assertTrue(map1.equals(map1));
        test.assertFalse(map1.equals(map2));
	test.assertFalse(map2.equals(map1));
    }

    /**
     * containsKey returns true for one and false for zero
     */
    public def testContainsKey():void {
        map = map5();
        test.assertTrue(map.containsKey("one"));
        test.assertFalse(map.containsKey("zero"));
    }

    /**
     * containsValue returns true for A and false for Z
     */ 
    public def testContainsValue():void {
        map = map5();
        test.assertTrue(map.containsValue("A"));
        test.assertFalse(map.containsValue("Z"));
    }

    /**
     *   enumeration returns an enumeration containing the correct
     *   elements
     *   changed to iterator
     */
     
    public def testEnumeration():void {
    	map = map5();
        e:Iterator[Object]! = map.elements();
        var count:int = 0;
        while (e.hasNext()) {
            count++;
            e.next();
        }
        test.assertEquals(5, count);
    } 

    /**
     *  get returns the correct element at the given key,
     *  or null if not present
     */
    public def testGet():void {
    	map = map5();
        test.assertEquals("A", map.get("one").value as String);
        var empty:ConcurrentHashMap[String, String] = new ConcurrentHashMap[String, String]();
        test.assertNull(map.get("anything"));
    }

    /**
     *  isEmpty is true of empty map and false for non-empty
     */
    public def testIsEmpty():void {
    	empty:ConcurrentHashMap[String, String]! = new ConcurrentHashMap[String, String]();
        map = map5();
        test.assertTrue(empty.isEmpty());
        test.assertFalse(map.isEmpty());
    }

    /**
     *   keys returns an enumeration/iterator containing all the keys from the map
     */
    public def testKeys():void {
    	map = map5();
        e:Iterator[Object]!  = map.keys();
        var count:int = 0;
        while (e.hasNext()) {
            count++;
            e.next();
        }
        test.assertEquals(5, count);
    } 

    /**
     *   keySet returns a Set containing all the keys
     */
    public def testKeySet():void {
    	map = map5();
        s:Set[String]! = map.keySet();
        test.assertEquals(5, s.size());
        test.assertTrue(s.containsValue("one"));
        test.assertTrue(s.containsValue("two"));
        test.assertTrue(s.containsValue("three"));
        test.assertTrue(s.containsValue("four"));
        test.assertTrue(s.containsValue("five"));
    }

    /**
     *  Values.toArray contains all values
     */
    public def testValuesToArray():void {
    	map = map5();
        v:Collection[String]! = map.values();
        ar:Rail[String]! = v.toRail();
	s:ArrayList[String]! = ArrayList.make[String](v);
        test.assertEquals(5, ar.length);
        test.assertTrue(s.containsValue("A"));
        test.assertTrue(s.containsValue("B"));
        test.assertTrue(s.containsValue("C"));
        test.assertTrue(s.containsValue("D"));
        test.assertTrue(s.containsValue("E"));
    } 

    /**
     *  entrySet.toArray contains all entries
     */
    public def testEntrySetToArray():void {
    	map = map5();
        var s:Set[Map.Entry[String,String]]! = map.entries();
        var ar:Rail[Map.Entry[String,String]]!  = s.toRail();
        test.assertEquals(5, ar.length);
        for (var i: Int = 0; i < 5; ++i) {
            test.assertTrue(map.containsKey(ar(i).getKey()));
            test.assertTrue(map.containsValue(ar(i).getValue()));
        }
    }

    /**
     * values collection contains all values
     */
    public def testValues():void {
        map = map5();
        s:Collection[String]! = map.values();
        test.assertEquals(5, s.size());
        test.assertTrue(s.containsValue"A"));
        test.assertTrue(s.containsValue("B"));
        test.assertTrue(s.containsValue("C"));
        test.assertTrue(s.containsValue("D"));
        test.assertTrue(s.containsValue("E"));
    } 


    /**
     * entrySet contains all pairs
     */
    public def testEntrySet():void {
        map = map5();
        s:Set[Map.Entry[String,String]]! = map.entries();
        test.assertEquals(5, s.size());
        it:Iterator[Map.Entry[String,String]]! = s.iterator();
        while (it.hasNext()) {
            var e: Map.Entry[String,String]! = it.next() as Map.Entry[String,String];
            test.assertTrue(
                       (e.getKey().equals("one") && e.getValue().equals("A")) ||
                       (e.getKey().equals("two") && e.getValue().equals("B")) ||
                       (e.getKey().equals("three") && e.getValue().equals("C")) ||
                       (e.getKey().equals("four") && e.getValue().equals("D")) ||
                       (e.getKey().equals("five") && e.getValue().equals("E")));
        }
    } 

    /**
     *   putAll adds all key-value pairs from the given map
     */
    public def testPutAll():void {
        var empty:ConcurrentHashMap[String, String]! = new ConcurrentHashMap[String, String]();
        map = map5();
        empty.putAll(map);
        test.assertEquals(5, empty.size());
        test.assertTrue(empty.containsKey("one"));
        test.assertTrue(empty.containsKey("two"));
        test.assertTrue(empty.containsKey("three"));
        test.assertTrue(empty.containsKey("four"));
        test.assertTrue(empty.containsKey("five"));
    }

    /**
     *   putIfAbsent works when the given key is not present
     */
    public def testPutIfAbsent():void {
        map = map5();
        map.putIfAbsent("six", "Z");
        test.assertTrue(map.containsKey("six"));
    }

    /**
     *   putIfAbsent does not add the pair if the key is already present
     */
    public def testPutIfAbsent2():void {
        map = map5();
        test.assertEquals("A", map.putIfAbsent("one", "Z").value);
    }

    /**
     *   replace fails when the given key is not present
     */
    public def testReplace():void {
        map = map5();
        test.assertNull(map.replace("six", "Z"));
        test.assertFalse(map.containsKey("six"));
    }

    /**
     *   replace succeeds if the key is already present
     */
    public def testReplace2():void {
        map = map5();
        test.assertNotNull(map.replace("one", "Z"));
        test.assertEquals("Z", map.get("one").value);
    }

    /**
     * replace value fails when the given key not mapped to expected value
     */
    public def testReplaceValue():void {
        map = map5();
        test.assertEquals("A", map.get("one"));
        test.assertFalse(map.replace("one", "Z", "Z"));
        test.assertEquals("A", map.get("one"));
    }

    /**
     * replace value succeeds when the given key mapped to expected value
     */
    public def testReplaceValue2():void {
        map = map5();
        test.assertEquals("A", map.get("one").value);
        test.assertTrue(map.replace("one", "A", "Z"));
        test.assertEquals("Z", map.get("one").value);
    }

    /**
     *   remove removes the correct key-value pair from the map
     */
    public def testRemove():void {
        map = map5();
        map.remove("five");
        test.assertEquals(4, map.size());
        test.assertFalse(map.containsKey("five"));
    }

    /**
     * remove(key,value) removes only if pair present
     */
    public def testRemove2():void {
        map = map5();
        map.remove("five", "E");
        test.assertEquals(4, map.size());
        test.assertFalse(map.containsKey("five"));
        map.remove("four", "A");
        test.assertEquals(4, map.size());
        test.assertTrue(map.containsKey("four"));
    }

    /**
     *   size returns the correct values
     */
    public def testSize():void  {
        map = map5();
        var empty:ConcurrentHashMap[String, String]! = new ConcurrentHashMap[String, String]();
        test.assertEquals(0, empty.size());
        test.assertEquals(5, map.size());
    }

    /**
     * toString contains toString of elements
     */
    public def testToString():void {
        map = map5();
        s:String = map.toString();
        for (var i:int = 1; i <= 5; ++i) {
            test.assertTrue(s.indexOf(String.valueOf(i)) >= 0);
        }
    }

    // Exception tests

    /**
     * Cannot create with negative capacity
     *
    public def testConstructor1():void {
        try {
            new ConcurrentHashMap(-1,0,1);
            shouldThrow();
        } catch (success:IllegalArgumentException ) {}
    } */

    /**
     * Cannot create with negative concurrency level
     
    public def testConstructor2():void {
        try {
            new ConcurrentHashMap(1,0,-1);
            shouldThrow();
        } catch (success:IllegalArgumentException) {}
    } */

    /**
     * Cannot create with only negative capacity
     
    public def testConstructor3():void {
        try {
            new ConcurrentHashMap(-1);
            shouldThrow();
        } catch (success:IllegalArgumentException) {}
    } */

    /**
     * get(null) throws NPE
     
    public def testGet_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.get(null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * containsKey(null) throws NPE
     
    public def testContainsKey_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.containsKey(null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * containsValue(null) throws NPE
     
    public def testContainsValue_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.containsValue(null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * contains(null) throws NPE
     
    public def testContains_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.contains(null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * put(null,x) throws NPE
     
    public def testPut1_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.put(null, "whatever");
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * put(x, null) throws NPE
     
    public def testPut2_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.put("whatever", null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * putIfAbsent(null, x) throws NPE
     
    public def testPutIfAbsent1_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.putIfAbsent(null, "whatever");
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * replace(null, x) throws NPE
     
    public def testReplace_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.replace(null, "whatever");
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * replace(null, x, y) throws NPE
     
    public def testReplaceValue_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.replace(null, one, "whatever");
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * putIfAbsent(x, null) throws NPE
     
    public def testPutIfAbsent2_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.putIfAbsent("whatever", null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */


    /**
     * replace(x, null) throws NPE
     
    public def testReplace2_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.replace("whatever", null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * replace(x, null, y) throws NPE
     
    public def testReplaceValue2_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.replace("whatever", null, "A");
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * replace(x, y, null) throws NPE
     
    public def testReplaceValue3_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.replace("whatever", one, null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */


    /**
     * remove(null) throws NPE
     
    public def testRemove1_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.put("sadsdf", "asdads");
            c.remove(null);
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * remove(null, x) throws NPE
     
    public def testRemove2_NullPointerException():void {
        try {
            var c:ConcurrentHashMap!  = new ConcurrentHashMap(5);
            c.put("sadsdf", "asdads");
            c.remove(null, "whatever");
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */


    /**
     * remove(x, null) returns false
     */
    public def testRemove3():void {
        var c:ConcurrentHashMap[String,String]!  = new ConcurrentHashMap[String,String](5);
        c.put("sadsdf", "asdads");
        test.assertFalse(c.remove("sadsdf", null));
    }

    /**
     * A deserialized map equals original
     
    public def testSerialization():void throws Exception {
        var q:ConcurrentHashMap = map5();

        bout:ByteArrayOutputStream = new ByteArrayOutputStream(10000);
        out:ObjectOutputStream = new ObjectOutputStream(new BufferedOutputStream(bout));
        out.writeObject(q);
        out.close();

        bin:ByteArrayInputStream = new ByteArrayInputStream(bout.toByteArray());
        in:ObjectInputStream = new ObjectInputStream(new BufferedInputStream(bin));
        r:ConcurrentHashMap = in.readObject() as ConcurrentHashMap;
        test.assertEquals(q.size(), r.size());
        test.assertTrue(q.equals(r));
        test.assertTrue(r.equals(q));
    } */


    /**
     * SetValue of an EntrySet entry sets value in the map.
     
    public def testSetValueWriteThrough():void {
        // Adapted from a bug report by Eric Zoerner
        var map:ConcurrentHashMap = new ConcurrentHashMap(2, 5.0f, 1);
        test.assertTrue(map.isEmpty());
        for (var i:int = 0; i < 20; i++)
            map.put(new Integer(i), new Integer(i));
        test.assertFalse(map.isEmpty());
        entry1:Map.Entry = map.entrySet().iterator().next() as Map.Entry;

        // assert that entry1 is not 16
        test.assertTrue("entry is 16, test not valid",
                   !entry1.getKey().equals(new Integer(16)));

        // remove 16 (a different key) from map
        // which just happens to cause entry1 to be cloned in map
        map.remove(new Integer(16));
        entry1.setValue("XYZ");
        test.assertTrue(map.containsValue("XYZ")); // fails
    } */
}
