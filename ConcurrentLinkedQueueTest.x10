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

    /**
     * Create a queue of given size containing consecutive
     * Integers 0 ... n.
     
    private static def populatedQueue(n:int):ConcurrentLinkedQueue {
        var q:ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        test.assertTrue(q.isEmpty());
        for (var i:int = 0; i < n; ++i)
            test.assertTrue(q.offer(new Integer(i)));
        test.assertFalse(q.isEmpty());
        test.assertEquals(n, q.size());
        return q;
    } */

    /**
     * new queue is empty
    
    public def testConstructor1():void {
        test.assertEquals(0, new ConcurrentLinkedQueue().size());
    } */

    /**
     *  Initializing from null Collection throws NPE
     
    public def testConstructor3():void {
        try {
            var q:ConcurrentLinkedQueue! = new ConcurrentLinkedQueue((Collection)null);
            shouldThrow();
        } catch (NullPointerException success) {}
    } */

    /**
     * Initializing from Collection of null elements throws NPE

    public def testConstructor4():void {
        try {
            var ints:Integer()! = new Integer(SIZE);
            ConcurrentLinkedQueue q = new ConcurrentLinkedQueue(Arrays.asList(ints));
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * Initializing from Collection with some null elements throws NPE
     
    public def testConstructor5():void {
        try {
            var ints:Integer()! = new Integer(SIZE);
            for (var i:int = 0; i < SIZE-1; ++i)
                ints(i) = new Integer(i);
            var q:ConcurrentLinkedQueue!  = new ConcurrentLinkedQueue(Arrays.asList(ints));
            shouldThrow();
        } catch (success:NullPointerException) {}
    } */

    /**
     * Queue contains all elements of collection used to initialize
     
    public def testConstructor6():void {
        var ints:Rail[Integer]!  = new Integer(SIZE);
        for (var i:int = 0; i < SIZE; ++i)
            ints(i) = new Integer(i);
        var q:ConcurrentLinkedQueue! = new ConcurrentLinkedQueue(Arrays.asList(ints));
        for (var i:int = 0; i < SIZE; ++i)
            test.assertEquals(ints(i), q.poll());
    } */
   
    /**
     * isEmpty is true before add, false after
     
    public def testEmpty():void {
        var q:ConcurrentLinkedQueue! = new ConcurrentLinkedQueue();
        test.assertTrue(q.isEmpty());
        q.add("one");
        test.assertFalse(q.isEmpty());
        q.add("two");
        q.remove();
        q.remove();
        test.assertTrue(q.isEmpty());
    } */
 
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
}
