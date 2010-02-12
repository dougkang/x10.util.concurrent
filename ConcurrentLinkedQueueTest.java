import java.util.concurrent.ConcurrentLinkedQueue;

class ConcurrentLinkedQueueTest {
  public static void main(String[] args) {
	  System.out.println("Testing Add");
	  testAdd();
	  System.out.println("Testing Remove");
	  testRemove();
	  System.out.println("Testing Size");
	  testSize();
	  System.out.println("Testing Peek and Poll");
	  testPeekAndPoll();
	  System.out.println("Testing Concurrency");
	  testConcurrency();
  }
  
  public static void output(ConcurrentLinkedQueue<Integer> q) {
	  int size = q.size();
	  Object[] qArray = q.toArray(); 
	  for (int i = 0; i < size; i++) {
		  System.out.print("[" + qArray[i] + "]");
	  }
	  System.out.println();
  }
  
  public static void testAdd() {
	  ConcurrentLinkedQueue<Integer> q = new ConcurrentLinkedQueue<Integer>();
	  for (int i = 0; i < 10; i++) {
		  output(q);
		  q.add(i);
	  }
  }
  
  public static void testRemove() {
	  ConcurrentLinkedQueue<Integer> q = new ConcurrentLinkedQueue<Integer>();
	  for (int i = 0; i < 10; i++) {
		  q.add(i);
	  }
	  output(q);
	  for (int i = 0; i < 10; i++) {
		  q.remove(i);
		  output(q);
	  }
	  System.out.println("Remove from empty Queue");
	  output(q);
  }
  
  public static void testSize() {
	  ConcurrentLinkedQueue<Integer> q = new ConcurrentLinkedQueue<Integer>();
	  for (int i = 0; i < 10; i++) {
		  q.add(i);
		  System.out.println("Size: " + q.size());
	  }
  }
  
  public static void testPeekAndPoll() {
	  ConcurrentLinkedQueue<Integer> q = new ConcurrentLinkedQueue<Integer>();
	  for (int i = 0; i < 10; i++) {
		  q.add(i);
	  }
	  output(q);
	  for (int i = 0; i < 11; i++) {
		  System.out.println("Peek: " + q.peek());
		  System.out.println("Poll: " + q.poll());
	  }
  }
  
  public static void testConcurrency() {
  }
}
