public class ConcurrentLinkedQueueTest {
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
}