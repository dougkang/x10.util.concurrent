import x10.util.*;
import x10.util.concurrent.*;
import x10.io.*;

public class ConcurrentSkipListMapTest {

	var test:Test;

    /**
     * Create a map from Integers 1-5 to Strings "A"-"E".
     */
    private def map5() : ConcurrentSkipListMap[String, String] {
        var map: ConcurrentSkipListMap[String, String]! = new ConcurrentSkipListMap[String, String]();
        test.assertTrue(map.isEmpty());
        map.put("one", "A");
        map.put("five", "E");
        map.put("three", "C");
        map.put("two", "B");
        map.put("four", "D");
        test.assertFalse(map.isEmpty());
        test.assertEquals(5, map.size());
        return map;
    }

    /**
     *  clear removes all pairs
     */
    public def testClear() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        map.clear();
        test.assertEquals(map.size(), 0);
    } 

    /**
     *
     */
    public def testConstructFromSorted() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var map2: ConcurrentSkipListMap[String, String]! = new ConcurrentSkipListMap[String, String](map);
        test.assertEquals(map, map2);
    } 

    /**
     *  Maps with same contents are equal
     */
    public def testEquals() : void {
        var map1: ConcurrentSkipListMap[String, String]! = map5();
        var map2: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals(map1, map2);
        test.assertEquals(map2, map1);
        map1.clear();
        test.assertFalse(map1.equals(map2));
        test.assertFalse(map2.equals(map1));
    } 

    /**
     *  containsKey returns true for contained key
     */
    public def testContainsKey() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(map.containsKey("one"));
        test.assertFalse(map.containsKey("zero"));
    } 

    /**
     *  containsValue returns true for held values
     */
    public def testContainsValue() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(map.containsValue("A"));
        test.assertFalse(map.containsValue("Z"));
    } 

    /**
     *  get returns the correct element at the given key,
     *  or null if not present
     
    public def testGet() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.get("one") as String);
        var empty: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
        test.assertNull(empty.get("one"));
    } */

    /**
     *  isEmpty is true of empty map and false for non-empty
     */
    public def testIsEmpty() : void {
        var empty: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(empty.isEmpty());
        test.assertFalse(map.isEmpty());
    } 

    /**
     *   firstKey returns first key
     */
    public def testFirstKey() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("one", map.firstKey());
    } 

    /**
     *   lastKey returns last key
     */
    public def testLastKey() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("five", map.lastKey());
    } 


    /**
     *  keySet.toArray returns contains all keys
     
    public def testKeySetToArray() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.keySet();
        var ar: Object[]! = s.toArray();
        test.assertTrue(s.containsAll(Arrays.asList(ar)));
        test.assertEquals(5, ar.length);
        ar(0) = m10;
        test.assertFalse(s.containsAll(Arrays.asList(ar)));
    } */

    /**
     *  descendingkeySet.toArray returns contains all keys
     
    public def testDescendingKeySetToArray() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.descendingKeySet();
        var ar: Object[]! = s.toArray();
        test.assertEquals(5, ar.length);
        test.assertTrue(s.containsAll(Arrays.asList(ar)));
        ar(0) = m10;
        test.assertFalse(s.containsAll(Arrays.asList(ar)));
    } */

    /**
     *   keySet returns a Set containing all the keys
     
    public def testKeySet() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.keySet();
        test.assertEquals(5, s.size());
        test.assertTrue(s.contains("one"));
        test.assertTrue(s.contains("two"));
        test.assertTrue(s.contains("three"));
        test.assertTrue(s.contains("four"));
        test.assertTrue(s.contains("five"));
    } */

    /**
     *   keySet is ordered
     
    public def testKeySetOrder() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.keySet();
        var i: Iterator! = s.iterator();
        var last: Integer! = i.next() as Integer;
        test.assertEquals(last, one);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Integer = i.next() as Integer;
            test.assertTrue(last.compareTo(k) < 0);
            last = k;
            ++count;
        }
        test.assertEquals(count ,5);
    } */

    /**
     * descending iterator of key set is inverse ordered
     
    public def void testKeySetDescendingIteratorOrder() {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: NavigableSet! = map.navigableKeySet();
        var i: Iterator! = s.descendingIterator();
        var last: Integer! = i.next() as Integer;
        test.assertEquals(last, five);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Integer = i.next() as Integer;
            test.assertTrue(last.compareTo(k) > 0);
            last = k;
            ++count;
        }
        test.assertEquals(count ,5);
    } */

    /**
     *   descendingKeySet is ordered
     
    public def testDescendingKeySetOrder() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.descendingKeySet();
        var i: Iterator! = s.iterator();
        var last: Integer! = i.next() as Integer;
        test.assertEquals(last, five);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Integer = i.next() as Integer;
            test.assertTrue(last.compareTo(k) > 0);
            last = k;
            ++count;
        }
        test.assertEquals(count, 5);
    } */

    /**
     *  descending iterator of descendingKeySet is ordered
     
    public def testDescendingKeySetDescendingIteratorOrder() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s:NavigableSet1 = map.descendingKeySet();
        var i: Iterator! = s.descendingIterator();
        var last: Integer! = i.next() as Integer;
        test.assertEquals(last, one);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Integer = i.next() as Integer;
            test.assertTrue(last.compareTo(k) < 0);
            last = k;
            ++count;
        }
        test.assertEquals(count, 5);
    } */

    /**
     *  Values.toArray contains all values
     
    public def testValuesToArray() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var v: Collection! = map.values();
        var ar: Object[] = v.toArray();
        var s: ArrayList! = new ArrayList(Arrays.asList(ar));
        test.assertEquals(5, ar.length);
        test.assertTrue(s.contains("A"));
        test.assertTrue(s.contains("B"));
        test.assertTrue(s.contains("C"));
        test.assertTrue(s.contains("D"));
        test.assertTrue(s.contains("E"));
    } */

    /**
     * values collection contains all values
     
    public def testValues() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Collection! = map.values();
        test.assertEquals(5, s.size());
        test.assertTrue(s.contains("A"));
        test.assertTrue(s.contains("B"));
        test.assertTrue(s.contains("C"));
        test.assertTrue(s.contains("D"));
        test.assertTrue(s.contains("E"));
    } */

    /**
     * entrySet contains all pairs
     
    public def testEntrySet() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.entrySet();
        test.assertEquals(5, s.size());
        var it: Iterator! = s.iterator();
        while (it.hasNext()) {
            var e: Map.Entry! = it.next() as Map.Entry;
            test.assertTrue(
                       (e.getKey().equals("one") && e.getValue().equals("A")) ||
                       (e.getKey().equals("two") && e.getValue().equals("B")) ||
                       (e.getKey().equals("three") && e.getValue().equals("C")) ||
                       (e.getKey().equals("four") && e.getValue().equals("D")) ||
                       (e.getKey().equals("five") && e.getValue().equals("E")));
        }
    } */

    /**
     * descendingEntrySet contains all pairs
     
    public def testDescendingEntrySet() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.descendingMap().entrySet();
        test.assertEquals(5, s.size());
        var it: Iterator! = s.iterator();
        while (it.hasNext()) {
            var e: Map.Entry! = it.next() as Map.Entry;
            test.assertTrue(
                       (e.getKey().equals("one") && e.getValue().equals("A")) ||
                       (e.getKey().equals("two") && e.getValue().equals("B")) ||
                       (e.getKey().equals("three") && e.getValue().equals("C")) ||
                       (e.getKey().equals("four") && e.getValue().equals("D")) ||
                       (e.getKey().equals("five") && e.getValue().equals("E")));
        }
    } */

    /**
     *  entrySet.toArray contains all entries
     
    public def testEntrySetToArray() : void  {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.entrySet();
        var ar: Object[] = s.toArray();
        test.assertEquals(5, ar.length);
        for (var i : Int = 0; i < 5; ++i) {
            test.assertTrue(map.containsKey((ar(i) as Map.Entry).getKey()));
            test.assertTrue(map.containsValue((ar(i) as Map.Entry).getValue()));
        }
    } */

    /**
     *  descendingEntrySet.toArray contains all entries
     
    public def testDescendingEntrySetToArray() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: Set! = map.descendingMap().entrySet();
        var ar: Object[] = s.toArray();
        test.assertEquals(5, ar.length);
        for (var i : Int = 0; i < 5; ++i) {
            test.assertTrue(map.containsKey((ar(i) as Map.Entry).getKey()));
            test.assertTrue(map.containsValue((ar(i) as Map.Entry).getValue()));
        }
    } */

    /**
     *   putAll  adds all key-value pairs from the given map
     
    public def testPutAll() : void {
        var empty: ConcurrentSkipListMap = new ConcurrentSkipListMap();
        var map: ConcurrentSkipListMap[String, String]! = map5();
        empty.putAll(map);
        test.assertEquals(5, empty.size());
        test.assertTrue(empty.containsKey("one"));
        test.assertTrue(empty.containsKey("two"));
        test.assertTrue(empty.containsKey("three"));
        test.assertTrue(empty.containsKey("four"));
        test.assertTrue(empty.containsKey("five"));
    } */

    /**
     *   putIfAbsent works when the given key is not present
     */
    public def testPutIfAbsent() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        map.putIfAbsent("six", "Z");
        test.assertTrue(map.containsKey("six"));
    } 

    /**
     *   putIfAbsent does not add the pair if the key is already present
     */
    public def testPutIfAbsent2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.putIfAbsent("one", "Z"));
    } 

    /**
     *   replace fails when the given key is not present
     */
    public def testReplace() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertNull(map.replace("six", "Z"));
        test.assertFalse(map.containsKey("six"));
    } 

    /**
     *   replace succeeds if the key is already present
     */
    public def testReplace2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertNotNull(map.replace("one", "Z"));
        test.assertEquals("Z", map.get("one"));
    } 


    /**
     * replace value fails when the given key not mapped to expected value
     */
    public def testReplaceValue() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.get("one"));
        test.assertFalse(map.replace("one", "Z", "Z"));
        test.assertEquals("A", map.get("one"));
    } 

    /**
     * replace value succeeds when the given key mapped to expected value
     */
    public def testReplaceValue2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.get("one"));
        test.assertTrue(map.replace("one", "A", "Z"));
        test.assertEquals("Z", map.get("one"));
    } 

    /**
     *   remove removes the correct key-value pair from the map
     */
    public def testRemove() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        map.remove("five");
        test.assertEquals(4, map.size());
        test.assertFalse(map.containsKey("five"));
    } 

    /**
     * remove(key,value) removes only if pair present
     
    public def testRemove2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(map.containsKey("five"));
        test.assertEquals("E", map.get("five"));
        map.remove("five", "E");
        test.assertEquals(4, map.size());
        test.assertFalse(map.containsKey("five"));
        map.remove("four", "A");
        test.assertEquals(4, map.size());
        test.assertTrue(map.containsKey("four"));
    } */

    /**
     * lowerEntry returns preceding entry.

    public def testLowerEntry() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Map.Entry! = map.lowerEntry("three");
        test.assertEquals("two", e1.getKey());

        var e2: Map.Entry! = map.lowerEntry("six");
        test.assertEquals("five", e2.getKey());

        var e3: Map.Entry = map.lowerEntry("one");
        test.assertNull(e3);

        var e4: Map.Entry = map.lowerEntry("zero");
        test.assertNull(e4);
    } */

    /**
     *   remove removes the correct key-value pair from the map
     
    public def testRemove() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        map.remove("five");
        test.assertEquals(4, map.size());
        test.assertFalse(map.containsKey("five"));
    } */

    /**
     * remove(key,value) removes only if pair present
     */
    public def testRemove2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(map.containsKey("five"));
        test.assertEquals("E", map.get("five"));
        map.remove("five", "E");
        test.assertEquals(4, map.size());
        test.assertFalse(map.containsKey("five"));
        map.remove("four", "A");
        test.assertEquals(4, map.size());
        test.assertTrue(map.containsKey("four"));
    }

    /**
     * lowerEntry returns preceding entry.

    public def testLowerEntry() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Map.Entry! = map.lowerEntry("three");
        test.assertEquals("two", e1.getKey());

        var e2: Map.Entry! = map.lowerEntry("six");
        test.assertEquals("five", e2.getKey());

        var e3: Map.Entry = map.lowerEntry("one");
        test.assertNull(e3);

        var e4: Map.Entry = map.lowerEntry("zero");
        test.assertNull(e4);
    } */

    /**
     * higherEntry returns next entry.
     
    public def testHigherEntry() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Map.Entry! = map.higherEntry("three");
        test.assertEquals("four", e1.getKey());

        var e2: Map.Entry! = map.higherEntry("zero");
        test.assertEquals(one, e2.getKey());

        var e3: Map.Entry = map.higherEntry("five");
        test.assertNull(e3);

        var e4: Map.Entry = map.higherEntry("six");
        test.assertNull(e4);
    } */

    /**
     * floorEntry returns preceding entry.

    public def testFloorEntry() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Map.Entry! = map.floorEntry("three");
        test.assertEquals("three", e1.getKey());

        var e2: Map.Entry! = map.floorEntry("six");
        test.assertEquals("five", e2.getKey());

        var e3: Map.Entry = map.floorEntry("one");
        test.assertEquals("one", e3.getKey());

        var e4: Map.Entry = map.floorEntry("zero");
        test.assertNull(e4);
    } */

    /**
     * ceilingEntry returns next entry.
     
    public def testCeilingEntry() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Map.Entry! = map.ceilingEntry("three");
        test.assertEquals(three, e1.getKey());

        var e2: Map.Entry! = map.ceilingEntry("zero");
        test.assertEquals(one, e2.getKey());

        var e3: Map.Entry! = map.ceilingEntry("five");
        test.assertEquals(five, e3.getKey());

        var e4: Map.Entry! = map.ceilingEntry("six");
        test.assertNull(e4);
    } */

    /**
     * lowerEntry, higherEntry, ceilingEntry, and floorEntry return
     * immutable entries
     
    public def testEntryImmutablity() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e: Map.Entry! = map.lowerEntry("three");
        test.assertEquals("two", e.getKey());
        try {
            e.setValue("X");
            shouldThrow();
        } catch (success: UnsupportedOperationException) {}
        e = map.higherEntry("zero");
        test.assertEquals("one", e.getKey());
        try {
            e.setValue("X");
            shouldThrow();
        } catch (success: UnsupportedOperationException) {}
        e = map.floorEntry("one");
        test.assertEquals("one", e.getKey());
        try {
            e.setValue("X");
            shouldThrow();
        } catch (success: UnsupportedOperationException) {}
        e = map.ceilingEntry("five");
        test.assertEquals("five", e.getKey());
        try {
            e.setValue("X");
            shouldThrow();
        } catch (success: UnsupportedOperationException) {}
    } */

    /**
     * lowerKey returns preceding element
     */
    public def testLowerKey() : void {
        var q: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Object = q.lowerKey("three");
        test.assertEquals("two", e1);

        var e2: Object = q.lowerKey("six");
        test.assertEquals("five", e2);

        var e3: Object = q.lowerKey("one");
        test.assertNull(e3);

        var e4: Object = q.lowerKey("zero");
        test.assertNull(e4);
    }

    /**
     * higherKey returns next element
     */
    public def testHigherKey() : void {
        var q: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Object = q.higherKey("three");
        test.assertEquals("four", e1);

        var e2: Object = q.higherKey("zero");
        test.assertEquals("one", e2);

        var e3: Object = q.higherKey("five");
        test.assertNull(e3);

        var e4: Object = q.higherKey("six");
        test.assertNull(e4);
    }

    /**
     * floorKey returns preceding element
     */
    public def testFloorKey() : void {
        var q: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Object = q.floorKey("three");
        test.assertEquals("three", e1);

        var e2: Object = q.floorKey("six");
        test.assertEquals("five", e2);

        var e3: Object = q.floorKey("one");
        test.assertEquals("one", e3);

        var e4: Object = q.floorKey("zero");
        test.assertNull(e4);
    }

    /**
     * ceilingKey returns next element
     */
    public def testCeilingKey() : void {
        var q: ConcurrentSkipListMap[String, String]! = map5();
        var e1: Object = q.ceilingKey("three");
        test.assertEquals("three", e1);

        var e2: Object = q.ceilingKey("zero");
        test.assertEquals("one", e2);

        var e3: Object = q.ceilingKey("five");
        test.assertEquals("five", e3);

        var e4: Object = q.ceilingKey("six");
        test.assertNull(e4);
    }

    /**
     * pollFirstEntry returns entries in order
     
    public def testPollFirstEntry() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e: Map.Entry! = map.pollFirstEntry();
        test.assertEquals("one", e.getKey());
        test.assertEquals("A", e.getValue());
        e = map.pollFirstEntry();
        test.assertEquals("two", e.getKey());
        map.put("one", "A");
        e = map.pollFirstEntry();
        test.assertEquals("one", e.getKey());
        test.assertEquals("A", e.getValue());
        e = map.pollFirstEntry();
        test.assertEquals("three", e.getKey());
        map.remove("four");
        e = map.pollFirstEntry();
        test.assertEquals("five", e.getKey());
        try {
            e.setValue("A");
            shouldThrow();
        } catch (success: UnsupportedOperationException) {}
        e = map.pollFirstEntry();
        test.assertNull(e);
    } */

    /**
     * pollLastEntry returns entries in order

    public def testPollLastEntry() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var e: Map.Entry! = map.pollLastEntry();
        test.assertEquals("five", e.getKey());
        test.assertEquals("E", e.getValue());
        e = map.pollLastEntry();
        test.assertEquals("four", e.getKey());
        map.put("five", "E");
        e = map.pollLastEntry();
        test.assertEquals("five", e.getKey());
        test.assertEquals("E", e.getValue());
        e = map.pollLastEntry();
        test.assertEquals("three", e.getKey());
        map.remove("two");
        e = map.pollLastEntry();
        test.assertEquals("one", e.getKey());
        try {
            e.setValue("E");
            shouldThrow();
        } catch (success: UnsupportedOperationException) {}
        e = map.pollLastEntry();
        test.assertNull(e);
    } */

    /**
     *   size returns the correct values
     */
    public def testSize() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var empty: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
        test.assertEquals(0, empty.size());
        test.assertEquals(5, map.size());
    } 

    /**
     * toString contains toString of elements
     
    public def testToString() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var s: String! = map.toString();
        for (var i: Int = 1; i <= 5; ++i) {
            test.assertTrue(s.indexOf(String.valueOf(i)) >= 0);
        }
    } */

    // Exception tests

    /**
     * get(null) of nonempty map throws NPE
     
    public def testGet_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap[String, String]! = map5();
            c.get(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * containsKey(null) of nonempty map throws NPE
     
    public def testContainsKey_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap[String, String]! = map5();
            c.containsKey(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * containsValue(null) throws NPE
     
    public def testContainsValue_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap!  = new ConcurrentSkipListMap();
            c.containsValue(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */


    /**
     * put(null,x) throws NPE
     
    public def testPut1_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap[String, String]! = map5();
            c.put(null, "whatever");
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * putIfAbsent(null, x) throws NPE
     
    public def testPutIfAbsent1_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap[String, String]! = map5();
            c.putIfAbsent(null, "whatever");
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * replace(null, x) throws NPE
     
    public def testReplace_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap[String, String]! = map5();
            c.replace(null, "whatever");
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * replace(null, x, y) throws NPE
     
    public def testReplaceValue_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap[String, String]! = map5();
            c.replace(null, "one", "whatever");
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * remove(null) throws NPE
     
    public def testRemove1_NullPointerException() : void {
        try {
            var c: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
            c.put("sadsdf", "asdads");
            c.remove(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * remove(null, x) throws NPE
     
    public def void testRemove2_NullPointerException() {
        try {
            var c: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
            c.put("sadsdf", "asdads");
            c.remove(null, "whatever");
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * remove(x, null) returns false
     
    public def void testRemove3() {
        var c: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
        c.put("sadsdf", "asdads");
        test.assertFalse(c.remove("sadsdf", null));
    } */

    /**
     * A deserialized map equals original
     
    public def testSerialization() : void throws Exception {
        var q: ConcurrentSkipListMap[String, String]! = map5();

        var bout: ByteArrayOutputStream! = new ByteArrayOutputStream(10000);
        var out: ObjectOutputStream! = new ObjectOutputStream(new BufferedOutputStream(bout));
        out.writeObject(q);
        out.close();

        var bin: ByteArrayInputStream = new ByteArrayInputStream(bout.toByteArray());
        var in: ObjectInputStream! = new ObjectInputStream(new BufferedInputStream(bin));
        var r: ConcurrentSkipListMap[String, String]! = in.readObject() as ConcurrentSkipListMap[String, String];
        test.assertEquals(q.size(), r.size());
        test.assertTrue(q.equals(r));
        test.assertTrue(r.equals(q));
    } */

    /**
     * subMap returns map with keys in requested range
     
    public def testSubMapContents() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var sm: NavigableMap! = map.subMap("two", true, "four", false);
        test.assertEquals("two", sm.firstKey());
        test.assertEquals("three", sm.lastKey());
        test.assertEquals(2, sm.size());
        test.assertFalse(sm.containsKey("one"));
        test.assertTrue(sm.containsKey("two"));
        test.assertTrue(sm.containsKey("three"));
        test.assertFalse(sm.containsKey("four"));
        test.assertFalse(sm.containsKey("five"));
        var i: Iterator! = sm.keySet().iterator();
        var k: Object;
        k = i.next() as Integer;
        test.assertEquals("two", k);
        k = i.next() as Integer;
        test.assertEquals("three", k);
        test.assertFalse(i.hasNext());
        var r: Iterator! = sm.descendingKeySet().iterator();
        k = r.next() as Integer;
        test.assertEquals("three", k);
        k = r.next() as Integer;
        test.assertEquals("two", k);
        test.assertFalse(r.hasNext());

        var j: Iterator! = sm.keySet().iterator();
        j.next();
        j.remove();
        test.assertFalse(map.containsKey("two"));
        test.assertEquals(4, map.size());
        test.assertEquals(1, sm.size());
        test.assertEquals("three", sm.firstKey());
        test.assertEquals("three", sm.lastKey());
        test.assertEquals("C", sm.remove("three"));
        test.assertTrue(sm.isEmpty());
        test.assertEquals(3, map.size());
    } */

    /* 
    public def testSubMapContents2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var sm: NavigableMap! = map.subMap("two", true, "three", false);
        test.assertEquals(1, sm.size());
        test.assertEquals("two", sm.firstKey());
        test.assertEquals("two", sm.lastKey());
        test.assertFalse(sm.containsKey("one"));
        test.assertTrue(sm.containsKey("two"));
        test.assertFalse(sm.containsKey("three"));
        test.assertFalse(sm.containsKey("four"));
        test.assertFalse(sm.containsKey("five"));
        var i: Iterator! = sm.keySet().iterator();
        var k: Object;
        k = i.next() as Integer;
        test.assertEquals("two", k);
        test.assertFalse(i.hasNext());
        var r: Iterator! = sm.descendingKeySet().iterator();
        k = r.next() as Integer;
        test.assertEquals("two", k);
        test.assertFalse(r.hasNext());

        var j: Iterator! = sm.keySet().iterator();
        j.next();
        j.remove();
        test.assertFalse(map.containsKey("two"));
        test.assertEquals(4, map.size());
        test.assertEquals(0, sm.size());
        test.assertTrue(sm.isEmpty());
        test.assertSame(sm.remove("three"), null);
        test.assertEquals(4, map.size());
    } */

    /**
     * headMap returns map with keys in requested range
     
    public def testHeadMapContents() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var sm: NavigableMap! = map.headMap("four", false);
        test.assertTrue(sm.containsKey("one"));
        test.assertTrue(sm.containsKey("two"));
        test.assertTrue(sm.containsKey("three"));
        test.assertFalse(sm.containsKey("four"));
        test.assertFalse(sm.containsKey("five"));
        var i: Iterator! = sm.keySet().iterator();
        var k: Object;
        k = i.next() as Integers;
        test.assertEquals("one", k);
        k = i.next() as Integers;
        test.assertEquals("two", k);
        k = i.next() as Integers;
        test.assertEquals("three", k);
        test.assertFalse(i.hasNext());
        sm.clear();
        test.assertTrue(sm.isEmpty());
        test.assertEquals(2, map.size());
        test.assertEquals("four", map.firstKey());
    }

    /**
     * tailMap returns map with keys in requested range

    public def testTailMapContents() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var sm: NavigableMap! = map.tailMap("two", true);
        test.assertFalse(sm.containsKey("one"));
        test.assertTrue(sm.containsKey("two"));
        test.assertTrue(sm.containsKey("three"));
        test.assertTrue(sm.containsKey("four"));
        test.assertTrue(sm.containsKey("five"));
        var i: Iterator! = sm.keySet().iterator();
        var k: Object;
        k = i.next() as Integers;
        test.assertEquals("two", k);
        k = i.next() as Integers;
        test.assertEquals("three", k);
        k = i.next() as Integers;
        test.assertEquals("four", k);
        k = i.next() as Integers;
        test.assertEquals("five", k);
        test.assertFalse(i.hasNext());
        var r: Iterator! = sm.descendingKeySet().iterator();
        k = r.next() as Integers;
        test.assertEquals("five", k);
        k = r.next() as Integers;
        test.assertEquals("four", k);
        k = r.next() as Integers;
        test.assertEquals("three", k);
        k = r.next() as Integers;
        test.assertEquals("two", k);
        test.assertFalse(r.hasNext());

        var ei: Iterator! = sm.entrySet().iterator();
        var e: Map.Entry;
        e = ei.next() as Map.Entry;
        test.assertEquals("two", e.getKey());
        test.assertEquals("B", e.getValue());
        e = ei.next() as Map.Entry;
        test.assertEquals("three", e.getKey());
        test.assertEquals("C", e.getValue());
        e = ei.next() as Map.Entry;
        test.assertEquals("four", e.getKey());
        test.assertEquals("D", e.getValue());
        e = ei.next() as Map.Entry;
        test.assertEquals("five", e.getKey());
        test.assertEquals("E", e.getValue());
        test.assertFalse(i.hasNext());

        var ssm: NavigableMap! = sm.tailMap("four", true);
        test.assertEquals("four", ssm.firstKey());
        test.assertEquals("five", ssm.lastKey());
        test.assertEquals("D", ssm.remove("four"));
        test.assertEquals(1, ssm.size());
        test.assertEquals(3, sm.size());
        test.assertEquals(4, map.size());
    } */
	
    /*
    var rnd: Random = new Random(666);
    var bs : BitSet;
    */

    /**
     * Submaps of submaps subdivide correctly
     
    public def testRecursiveSubMaps() : void throws Exception {
        var mapSize: Int = 1000;
        var cl: Class = ConcurrentSkipListMap.class;
        var map: NavigableMapp[Integer, Integer]! = newMap(cl);
        bs = new BitSet(mapSize);

        populate(map, mapSize);
        check(map,                 0, mapSize - 1, true);
        check(map.descendingMap(), 0, mapSize - 1, false);

        mutateMap(map, 0, mapSize - 1);
        check(map,                 0, mapSize - 1, true);
        check(map.descendingMap(), 0, mapSize - 1, false);

        bashSubMap(map.subMap(0, true, mapSize, false),
                   0, mapSize - 1, true);
    } */

    /*
    static def newMap(cl: Class) : NavigableMap[Integer, Integer] throws Exception {
        var result: NavigableMap[Integer, Integer]! = cl.newInstance() as NavigableMap[Integer, Integer];
        test.assertEquals(result.size(), 0);
        test.assertFalse(result.keySet().iterator().hasNext());
        return result;
    } */

    /*
    def populate(map: NavigableMap[Integer, Integer], limit: Int) : void {
        for (var i: Int = 0, n = 2 * limit / 3; i < n; i++) {
            var key: Int = rnd.nextInt(limit);
            put(map, key);
        }
    } */

    /*
    def mutateMap(map: NavigableMap[Integer, Integer], min: Int, max: Int) : void {
        var size: Int = map.size();
        var rangeSize: Int = max - min + 1;

        // Remove a bunch of entries directly
        for (var i: Int = 0, n = rangeSize / 2; i < n; i++) {
            remove(map, min - 5 + rnd.nextInt(rangeSize + 10));
        }

        // Remove a bunch of entries with iterator
        for (var it: Iterator[Integer] = map.keySet().iterator(); it.hasNext(); ) {
            if (rnd.nextBoolean()) {
                bs.clear(it.next());
                it.remove();
            }
        }

        // Add entries till we're back to original size
        while (map.size() < size) {
            var key: Int = min + rnd.nextInt(rangeSize);
            test.assertTrue(key >= min && key<= max);
            put(map, key);
        }
    } */

    /*
    def mutateSubMap(map: NavigableMap[Integer, Integer], min: Int, max: Int) : void {
        var size: Int = map.size();
        var rangeSize: Int = max - min + 1;

        // Remove a bunch of entries directly
        for (var i: Int = 0, n = rangeSize / 2; i < n; i++) {
            remove(map, min - 5 + rnd.nextInt(rangeSize + 10));
        }

        // Remove a bunch of entries with iterator
        for (it: Iterator[Integer] = map.keySet().iterator(); it.hasNext(); ) {
            if (rnd.nextBoolean()) {
                bs.clear(it.next());
                it.remove();
            }
        }

        // Add entries till we're back to original size
        while (map.size() < size) {
            var key: Int = min - 5 + rnd.nextInt(rangeSize + 10);
            if (key >= min && key<= max) {
                put(map, key);
            } else {
                try {
                    map.put(key, 2 * key);
                    shouldThrow();
                } catch (IllegalArgumentException success) {}
            }
        }
    } */

    /*
    def put(map: NavigableMap[Integer, Integer], key: Int) : void {
        if (map.put(key, 2 * key) == null)
            bs.set(key);
    } */

    /*
    def remove(map: NavigableMap[Integer, Integer], key: Int) : void {
        if (map.remove(key) != null)
            bs.clear(key);
    } */

    /*
    def bashSubMap(map: NavigableMap[Integer, Integer], min: Int, max: Int, ascending: Boolean) : void {
        check(map, min, max, ascending);
        check(map.descendingMap(), min, max, !ascending);

        mutateSubMap(map, min, max);
        check(map, min, max, ascending);
        check(map.descendingMap(), min, max, !ascending);

        // Recurse
        if (max - min < 2)
            return;
        var midPoint: Int = (min + max) / 2;

        // headMap - pick direction and endpoint inclusion randomly
        var incl: Boolean = rnd.nextBoolean();
        var hm: NavigableMap[Integer,Integer] = map.headMap(midPoint, incl);
        if (ascending) {
            if (rnd.nextBoolean())
                bashSubMap(hm, min, midPoint - (incl ? 0 : 1), true);
            else
                bashSubMap(hm.descendingMap(), min, midPoint - (incl ? 0 : 1), false);
        } else {
            if (rnd.nextBoolean())
                bashSubMap(hm, midPoint + (incl ? 0 : 1), max, false);
            else
                bashSubMap(hm.descendingMap(), midPoint + (incl ? 0 : 1), max, true);
        }

        // tailMap - pick direction and endpoint inclusion randomly
        incl = rnd.nextBoolean();
        var tm: NavigableMap[Integer,Integer] = map.tailMap(midPoint,incl);
        if (ascending) {
            if (rnd.nextBoolean())
                bashSubMap(tm, midPoint + (incl ? 0 : 1), max, true);
            else
                bashSubMap(tm.descendingMap(), midPoint + (incl ? 0 : 1), max, false);
        } else {
            if (rnd.nextBoolean()) {
                bashSubMap(tm, min, midPoint - (incl ? 0 : 1), false);
            } else {
                bashSubMap(tm.descendingMap(), min, midPoint - (incl ? 0 : 1), true);
            }
        }

        // subMap - pick direction and endpoint inclusion randomly
        var rangeSize: Int = max - min + 1;
        var endpoints: int[] = new int[2];
        endpoints(0) = min + rnd.nextInt(rangeSize);
        endpoints(1) = min + rnd.nextInt(rangeSize);
        Arrays.sort(endpoints);
        var lowIncl: Boolean = rnd.nextBoolean();
        var highIncl: Boolean = rnd.nextBoolean();
        if (ascending) {
            var sm: NavigableMap[Integer,Integer] = map.subMap(endpoints[0], lowIncl, endpoints[1], highIncl);
            if (rnd.nextBoolean())
                bashSubMap(sm, endpoints[0] + (lowIncl ? 0 : 1), endpoints[1] - (highIncl ? 0 : 1), true);
            else
                bashSubMap(sm.descendingMap(), endpoints[0] + (lowIncl ? 0 : 1), endpoints[1] - (highIncl ? 0 : 1), false);
        } else {
            var sm: NavigableMap[Integer,Integer] = map.subMap(endpoints[1], highIncl, endpoints[0], lowIncl);
            if (rnd.nextBoolean())
                bashSubMap(sm, endpoints[0] + (lowIncl ? 0 : 1), endpoints[1] - (highIncl ? 0 : 1), false);
            else
                bashSubMap(sm.descendingMap(), endpoints[0] + (lowIncl ? 0 : 1), endpoints[1] - (highIncl ? 0 : 1), true);
        }
    }
    */

    /**
     * min and max are both inclusive.  If max < min, interval is empty.
     
    def check(map: NavigableMap[Integer, Integer], final var min: Int, final max: Int, final boolean ascending) : void {
       class ReferenceSet {
            def lower(key: Int) : Int {
                return ascending ? lowerAscending(key) : higherAscending(key);
            }
            def floor(key: Int) : Int{
                return ascending ? floorAscending(key) : ceilingAscending(key);
            }
            def ceiling(key: Int) : Int{
                return ascending ? ceilingAscending(key) : floorAscending(key);
            }
            def higher(key: Int) : Int{
                return ascending ? higherAscending(key) : lowerAscending(key);
            }
            def first() : Int {
                return ascending ? firstAscending() : lastAscending();
            }
            def last() : Int {
                return ascending ? lastAscending() : firstAscending();
            }
            def lowerAscending(key: Int) : Int {
                return floorAscending(key - 1);
            }
            def floorAscending(key: Int) : Int{
                if (key < min)
                    return -1;
                else if (key > max)
                    key = max;

                // BitSet should support this! Test would run much faster
                while (key >= min) {
                    if (bs.get(key))
                        return(key);
                    key--;
                }
                return -1;
            }
            def ceilingAscending(key: Int) : Int {
                if (key < min)
                    key = min;
                else if (key > max)
                    return -1;
                var result: Int = bs.nextSetBit(key);
                return result > max ? -1 : result;
            }
            def higherAscending(key: Int) Int{
                return ceilingAscending(key + 1);
            }
            private def firstAscending() : Int{
                var result: Int = ceilingAscending(min);
                return result > max ? -1 : result;
            }
            private def lastAscending() : Int {
                var result: Int = floorAscending(max);
                return result < min ? -1 : result;
            }
        }
        var rs: ReferenceSet! = new ReferenceSet();

        // Test contents using containsKey
        var size: Int = 0;
        for (var i: Int = min; i <= max; i++) {
            var bsContainsI: Boolean = bs.get(i);
            test.assertEquals(bsContainsI, map.containsKey(i));
            if (bsContainsI)
                size++;
        }
        test.assertEquals(map.size(), size);

        // Test contents using contains keySet iterator
        var size2: Int = 0;
        var previousKey: Int = -1;
        for ((var key: Int) : map.keySet()) {
            test.assertTrue(bs.get(key));
            size2++;
            test.assertTrue(previousKey < 0 || (ascending ? key - previousKey > 0 : key - previousKey < 0));
            previousKey = key;
        }
        test.assertEquals(size2, size);

        // Test navigation ops
        for (var key int = min - 1; key <= max + 1; key++) {
            test.assertEq(map.lowerKey(key), rs.lower(key));
            test.assertEq(map.floorKey(key), rs.floor(key));
            test.assertEq(map.higherKey(key), rs.higher(key));
            test.assertEq(map.ceilingKey(key), rs.ceiling(key));
        }

        // Test extrema
        if (map.size() != 0) {
            test.assertEq(map.firstKey(), rs.first());
            test.assertEq(map.lastKey(), rs.last());
        } else {
            test.assertEq(rs.first(), -1);
            test.assertEq(rs.last(),  -1);
            try {
                map.firstKey();
                shouldThrow();
            } catch (success: NoSuchElementException) {}
            try {
                map.lastKey();
                shouldThrow();
            } catch (success: NoSuchElementException) {}
        }
    } */

    /*
    static def test.assertEq(i: Integer, j: Int) : void {
        if (i == null)
            test.assertEquals(j, -1);
        else
            test.assertEquals(i as Int, j);
    } */

    /*
    static def eq(i: Integer, j: Int) : Boolean {
        return i == null ? j == -1 : i == j;
    } */
}
