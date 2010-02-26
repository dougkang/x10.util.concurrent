import x10.util.*;
import x10.util.concurrent.*;
import x10.io.*;

public def class ConcurrentSkipListMapTest {

	var test:Test;

    /**
     * Create a map from Integers 1-5 to Strings "A"-"E".
     */
    private def static map5() : ConcurrentSkipListMap[String, String] {
        var map: ConcurrentSkipListMap[String, String]! = new ConcurrentSkipListMap[String, String]();
        test.test.assertTrue(map.isEmpty());
        map.put("one", "A");
        map.put("five", "E");
        map.put("three", "C");
        map.put("two", "B");
        map.put("four", "D");
        test.test.assertFalse(map.isEmpty());
        test.test.assertEquals(5, map.size());
        return map;
    }

    /**
     *  clear removes all pairs
     
    public def testClear() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        map.clear();
        test.assertEquals(map.size(), 0);
    } */

    /**
     *
     
    public def testConstructFromSorted() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        var map2: ConcurrentSkipListMap[String, String]! = new ConcurrentSkipListMap[String, String](map);
        test.assertEquals(map, map2);
    } */

    /**
     *  Maps with same contents are equal
     
    public def testEquals() : void {
        var map1: ConcurrentSkipListMap[String, String]! = map5();
        ConcurrentSkipListMap map2 = map5();
        test.test.assertEquals(map1, map2);
        test.test.assertEquals(map2, map1);
        map1.clear();
        test.assertFalse(map1.equals(map2));
        test.assertFalse(map2.equals(map1));
    } */

    /**
     *  containsKey returns true for contained key
     
    public def testContainsKey() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(map.containsKey(one));
        test.assertFalse(map.containsKey(zero));
    } */

    /**
     *  containsValue returns true for held values
     
    public def testContainsValue() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(map.containsValue("A"));
        test.assertFalse(map.containsValue("Z"));
    } */

    /**
     *  get returns the correct element at the given key,
     *  or null if not present
     
    public def testGet() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.get(one) as String);
        var empty: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
        test.assertNull(empty.get(one));
    } */

    /**
     *  isEmpty is true of empty map and false for non-empty
     
    public def testIsEmpty() : void {
        var empty: ConcurrentSkipListMap! = new ConcurrentSkipListMap();
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertTrue(empty.isEmpty());
        test.assertFalse(map.isEmpty());
    } */

    /**
     *   firstKey returns first key
     
    public def testFirstKey() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals(one, map.firstKey());
    } */

    /**
     *   lastKey returns last key
     
    public def testLastKey() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals(five, map.lastKey());
    } */


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
        var last: Int! = i.next() as Int;
        test.assertEquals(last, one);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Int = i.next() as Int;
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
        var last: Int! = i.next() as Int;
        test.assertEquals(last, five);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Int = i.next() as Int;
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
        var last: Int! = i.next() as Int;
        test.assertEquals(last, five);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Int = i.next() as Int;
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
        var last: Int! = i.next() as Int;
        test.assertEquals(last, one);
        var count: Int = 1;
        while (i.hasNext()) {
            var k: Int = i.next() as Int;
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
     
    public def testPutIfAbsent() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        map.putIfAbsent("six", "Z");
        test.assertTrue(map.containsKey("six"));
    } */

    /**
     *   putIfAbsent does not add the pair if the key is already present
     
    public def testPutIfAbsent2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.putIfAbsent("one", "Z"));
    } */

    /**
     *   replace fails when the given key is not present
     
    public def testReplace() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertNull(map.replace("six", "Z"));
        test.assertFalse(map.containsKey("six"));
    } */

    /**
     *   replace succeeds if the key is already present
     
    public def testReplace2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertNotNull(map.replace("one", "Z"));
        test.assertEquals("Z", map.get("one"));
    } */


    /**
     * replace value fails when the given key not mapped to expected value
     
    public def testReplaceValue() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.get("one"));
        test.assertFalse(map.replace("one", "Z", "Z"));
        test.assertEquals("A", map.get("one"));
    } */

    /**
     * replace value succeeds when the given key mapped to expected value
     
    public def testReplaceValue2() : void {
        var map: ConcurrentSkipListMap[String, String]! = map5();
        test.assertEquals("A", map.get("one"));
        test.assertTrue(map.replace("one", "A", "Z"));
        test.assertEquals("Z", map.get("one"));
    } */
}
