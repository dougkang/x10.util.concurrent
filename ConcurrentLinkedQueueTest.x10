import x10.io.Console;
import x10.util.*;
import x10.util.concurrent.*;

public class ConcurrentLinkedQueueTest {

    var test:Test;

    public static def main(args:Rail[String]) {
  	  Console.OUT.println("Testing Add");
  	  testAdd();
  	  Console.OUT.println("Testing Remove");
  	  testRemove();
  	  Console.OUT.println("Testing Size");
  	  testSize();
  	  Console.OUT.println("Testing Peek and Poll");
  	  testPeekAndPoll();
  	  Console.OUT.println("Testing Concurrency");
  	  testConcurrency();
    }

    public static def output(q:ConcurrentLinkedQueue[int]!) {
  	  val size:int = q.size();
  	  qArray:Rail[Object]! = q.toArray();
  	  for (var i:int = 0; i < size; i++) {
  		  Console.OUT.print("[" + qArray(i) + "]");
  	  }
  	  Console.OUT.println();
    }
    
    public static def testAdd() {
  	  q:ConcurrentLinkedQueue[int]! = new ConcurrentLinkedQueue[int]();
  	  for (var i:int = 0; i < 10; i++) {
  		  output(q);
  		  q.add(i);
  	  }
    }
    
    public static def testRemove() {
  	  q:ConcurrentLinkedQueue[int]! = new ConcurrentLinkedQueue[int]();
  	  for (var i:int = 0; i < 10; i++) {
  		  q.add(i);
  	  }
  	  output(q);
  	  for (var i:int = 0; i < 10; i++) {
  		  q.remove(i);
  		  output(q);
  	  }
  	  Console.OUT.println("Remove from empty Queue");
  	  output(q);
    }
    
    public static def testSize() {
  	  q:ConcurrentLinkedQueue[int]! = new ConcurrentLinkedQueue[int]();
  	  for (var i:int = 0; i < 10; i++) {
  		  q.add(i);
  		  Console.OUT.println("Size: " + q.size());
  	  }
    }
    
    public static def testPeekAndPoll() {
  	  q:ConcurrentLinkedQueue[int]! = new ConcurrentLinkedQueue[int]();
  	  for (var i:int = 0; i < 10; i++) {
  		  q.add(i);
  	  }
  	  output(q);
  	  for (var i:int = 0; i < 11; i++) {
  		  Console.OUT.println("Peek: " + q.peek());
  		  Console.OUT.println("Poll: " + q.poll());
  	  }
    }
    
    public static def testConcurrency() {
    }

    /**
     * Create a queue of given size containing consecutive
     * Integers 0 ... n.
     
    private static def populatedQueue(n: Int) : ConcurrentLinkedQueue {
        var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        test.assertTrue(q.isEmpty());
        for (var i: Int = 0; i < n; ++i)
            test.assertTrue(q.offer(new Integer(i)));
        test.assertFalse(q.isEmpty());
        test.assertEquals(n, q.size());
        return q;
    } */

    /**
     * new queue is empty
    
    public def testConstructor1() : void {
        test.assertEquals(0, new ConcurrentLinkedQueue().size());
    } */

    /**
     *  Initializing from null Collection throws NPE
     
    public def testConstructor3() : void {
        try {
            var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue(null as Collection);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * Initializing from Collection of null elements throws NPE

    public def testConstructor4() : void {
        try {
            var ints: Integer()! = new Integer(SIZE);
            var q: ConcurrentLinkedQueue = new ConcurrentLinkedQueue(Arrays.asList(ints));
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * Initializing from Collection with some null elements throws NPE
     
    public def testConstructor5() : void {
        try {
            var ints: Integer()! = new Integer(SIZE);
            for (var i: Int = 0; i < SIZE-1; ++i)
                ints(i) = new Integer(i);
            var q: ConcurrentLinkedQueue!  = new ConcurrentLinkedQueue(Arrays.asList(ints));
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * Queue contains all elements of collection used to initialize
     
    public def testConstructor6() : void {
        var ints: Rail[Integer]!  = new Integer(SIZE);
        for (var i: Int = 0; i < SIZE; ++i)
            ints(i) = new Integer(i);
        var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue(Arrays.asList(ints));
        for (var i: Int = 0; i < SIZE; ++i)
            test.assertEquals(ints(i), q.poll());
    } */
   
    /**
     * isEmpty is true before add, false after
     
    public def testEmpty() : void {
        var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        test.assertTrue(q.isEmpty());
        q.add("one");
        test.assertFalse(q.isEmpty());
        q.add("two");
        q.remove();
        q.remove();
        test.assertTrue(q.isEmpty());
    } */

    /**
     * size changes when elements added and removed
     
    public def testSize() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertEquals(SIZE-i, q.size());
            q.remove();
        }
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertEquals(i, q.size());
            q.add(new Integer(i));
        }
    } */

    /**
     * offer(null) throws NPE
     
    public def testOfferNull() : void {
        try {
            var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
            q.offer(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * add(null) throws NPE
     
    public def testAddNull() : void {
        try {
            var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
            q.add(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * Offer returns true
     
    public def testOffer() : void {
        var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        test.assertTrue(q.offer("zero"));
        test.assertTrue(q.offer("one"));
    } */

    /**
     * add returns true
     
    public def testAdd() : void {
        var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertEquals(i, q.size());
            test.assertTrue(q.add(new Integer(i)));
        }
    } */

    /**
     * addAll(null) throws NPE
     
    public def testAddAll1() : void {
        try {
            var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
            q.addAll(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * addAll(this) throws IAE
     
    public def testAddAllSelf() : void {
        try {
            var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
            q.addAll(q);
            shouldThrow();
        } catch (success: IllegalArgumentException) {}
    } */

    /**
     * addAll of a collection with null elements throws NPE
     
    public def testAddAll2() : void {
        try {
            var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
            var ints: Rail[Integer]! = new Integer[SIZE];
            q.addAll(Arrays.asList(ints));
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     *  addAll of a collection with any null elements throws NPE after
     * possibly adding some elements
     
    public def testAddAll3() : void {
        try {
            var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
            var ints: Rail[Integer]! = new Integer[SIZE];
            for (var i: Int = 0; i < SIZE-1; ++i)
                ints(i) = new Integer(i);
            q.addAll(Arrays.asList(ints));
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * Queue contains all elements, in traversal order, of successful addAll
     
    public def testAddAll5() : void {
        var empty: Rail[Integer]! = new Integer[0];
        var ints: Rail[Integer]! = new Integer[SIZE];
        for (var i: Int = 0; i < SIZE; ++i)
            ints(i) = new Integer(i);
        var q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        test.assertFalse(q.addAll(Arrays.asList(empty)));
        test.assertTrue(q.addAll(Arrays.asList(ints)));
        for (var i: Int = 0; i < SIZE; ++i)
            test.assertEquals(ints(i), q.poll());
    } */

    /**
     * poll succeeds unless empty
     
    public def testPoll() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertEquals(i, q.poll());
        }
        test.assertNull(q.poll());
    } */

    /**
     * peek returns next element, or null if empty
     
    public def testPeek() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertEquals(i, q.peek());
            test.assertEquals(i, q.poll());
            test.assertTrue(q.peek() == null || !q.peek().equals(i));
        }
        test.assertNull(q.peek());
    } */

    /**
     * element returns next element, or throws NSEE if empty
     
    public def testElement() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertEquals(i, q.element());
            test.assertEquals(i, q.poll());
        }
        try {
            q.element();
            shouldThrow();
        } catch (success: NoSuchElementException) {}
    } */

    /**
     *  remove removes next element, or throws NSEE if empty
     
    public def testRemove() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertEquals(i, q.remove());
        }
        try {
            q.remove();
            shouldThrow();
        } catch (success: NoSuchElementException) {}
    } */

    /**
     * remove(x) removes x and returns true if present
     
    public def testRemoveElement() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 1; i < SIZE; i+=2) {
            test.assertTrue(q.remove(new Integer(i)));
        }
        for (var i: Int = 0; i < SIZE; i+=2) {
            test.assertTrue(q.remove(new Integer(i)));
            test.assertFalse(q.remove(new Integer(i+1)));
        }
        test.assertTrue(q.isEmpty());
    } */

    /**
     * contains(x) reports true when elements added but not yet removed
     
    public def testContains() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertTrue(q.contains(new Integer(i)));
            q.poll();
            test.assertFalse(q.contains(new Integer(i)));
        }
    } */

    /**
     * clear removes all elements
     
    public def testClear() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        q.clear();
        test.assertTrue(q.isEmpty());
        test.assertEquals(0, q.size());
        q.add("one");
        test.assertFalse(q.isEmpty());
        q.clear();
        test.assertTrue(q.isEmpty());
    } */

    /**
     * containsAll(c) is true when c contains a subset of elements
     
    public def testContainsAll() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        var p: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertTrue(q.containsAll(p));
            test.assertFalse(p.containsAll(q));
            p.add(new Integer(i));
        }
        test.assertTrue(p.containsAll(q));
    } */

    /**
     * retainAll(c) retains only those elements of c and reports true if change
     
    public def testRetainAll() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        var p: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        for (var i: Int = 0; i < SIZE; ++i) {
            var changed: Boolean = q.retainAll(p);
            if (i == 0)
                test.assertFalse(changed);
            else
                test.assertTrue(changed);

            test.assertTrue(q.containsAll(p));
            test.assertEquals(SIZE-i, q.size());
            p.remove();
        }
    } */

    /**
     * removeAll(c) removes only those elements of c and reports true if changed
     
    public def testRemoveAll() : void {
        for (var i: Int = 1; i < SIZE; ++i) {
            var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
            var p: ConcurrentLinkedQueue! = populatedQueue(i);
            test.assertTrue(q.removeAll(p));
            test.assertEquals(SIZE-i, q.size());
            for (var j: Int = 0; j < i; ++j) {
                var I: Integer = p.remove() as Integer;
                test.assertFalse(q.contains(I));
            }
        }
    } */

    /**
     * toArray contains all elements
     
    public def testToArray() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        var o: Rail[Object]! = q.toArray();
        Arrays.sort(o);
        for (var i: Int = 0; i < o.length; i++)
            test.assertEquals(o(i), q.poll());
    } */

    /**
     *  toArray(a) contains all elements
     
    public def testToArray2() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        var ints: Rail[Integer]!  = new Integer[SIZE];
        ints = q.toArray(ints) as Rail[Integer];
        Arrays.sort(ints);
        for (var i: Int = 0; i < ints.length; i++)
            test.assertEquals(ints(i), q.poll());
    } */

    /**
     * toArray(null) throws NPE
     
    public def testToArray_BadArg() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        try {
            var o: Rail[Object] = q.toArray(null);
            shouldThrow();
        } catch (success: NullPointerException) {}
    } */

    /**
     * toArray with incompatible array type throws ArrayStoreException
     
    public def testToArray1_BadArg() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        try {
            var o: Rail[Object] = q.toArray(new String[10]);
            shouldThrow();
        } catch (success: ArrayStoreException) {}
    } */

    /**
     *  iterator iterates through all elements
     
    public def testIterator() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        var i: Int = 0;
        var it: Iterator! = q.iterator();
        while (it.hasNext()) {
            test.assertTrue(q.contains(it.next()));
            ++i;
        }
        test.assertEquals(i, SIZE);
    } */

    /**
     * iterator ordering is FIFO
     
    public def testIteratorOrdering() : void {
        val q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        q.add("one");
        q.add("two");
        q.add("three");

        var k: Int = 0;
        for (var it: Iterator! = q.iterator(); it.hasNext();) {
            test.assertEquals(++k, it.next());
        }

        test.assertEquals(3, k);
    } */

    /**
     * Modifications do not cause iterators to fail
     
    public def testWeaklyConsistentIteration () : void {
        val q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        q.add("one");
        q.add("two");
        q.add("three");

        for (Iterator it = q.iterator(); it.hasNext();) {
            q.remove();
            it.next();
        }

        test.assertEquals("queue should be empty again", 0, q.size());
    } */

    /**
     * iterator.remove removes current element
     
    public def testIteratorRemove () : void {
        val q: ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        q.add("one");
        q.add("two");
        q.add("three");
        var it: Iterator! = q.iterator();
        it.next();
        it.remove();
        it = q.iterator();
        test.assertSame(it.next(), "two");
        test.assertSame(it.next(), "three");
        test.assertFalse(it.hasNext());
    } */

    /**
     * toString contains toStrings of elements
     
    public def testToString() : void {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        var s: String = q.toString();
        for (var i: Int = 0; i < SIZE; ++i) {
            test.assertTrue(s.indexOf(String.valueOf(i)) >= 0);
        }
    } */

    /**
     * A deserialized serialized queue has same elements in same order
     
    public def testSerialization() : void throws Exception {
        var q: ConcurrentLinkedQueue! = populatedQueue(SIZE);
        var bout: ByteArrayOutputStream = new ByteArrayOutputStream(10000);
        var out: ObjectOutputStream! = new ObjectOutputStream(new BufferedOutputStream(bout));
        out.writeObject(q);
        out.close();

        var bin: ByteArrayInputStream = new ByteArrayInputStream(bout.toByteArray());
        var in: ObjectInputStream! = new ObjectInputStream(new BufferedInputStream(bin));
        var r: ConcurrentLinkedQueue! = in.readObject() as ConcurrentLinkedQueue;
        test.assertEquals(q.size(), r.size());
        while (!q.isEmpty())
            test.assertEquals(q.remove(), r.remove());
    } */
}

