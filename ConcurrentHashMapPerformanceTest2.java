import java.util.concurrent.*;
import java.util.*;
import java.lang.Integer;

public class ConcurrentHashMapPerformanceTest {

	static final int CEILING_VALUE = 1000;
	static final int NUM_OPERATIONS = 500000;

	public static ConcurrentHashMap<Integer, Integer> map;
	public static Random rand;
	public static Random rand2;
	public static Random rand3;

	public static void main(String[] args) {
		ConcurrentHashMapPerformanceTest test = new ConcurrentHashMapPerformanceTest();
		test.testConcurrency();
  	}
  
	public ConcurrentHashMapPerformanceTest() {
		map = new ConcurrentHashMap<Integer, Integer>(500);
		rand = new Random(System.nanoTime()+304729);
		rand2 = new Random(System.nanoTime()+652507);
		rand3 = new Random(System.nanoTime()+856733);
	}
	
	public void testConcurrency() {
		(new Thread(new putClass(map,rand))).start();
		(new Thread(new removeClass(map,rand2))).start();
		(new Thread(new replaceClass(map,rand3))).start();
	}
  
  	public class putClass implements Runnable {
		ConcurrentHashMap<Integer, Integer> map;
		Random rand;

		public putClass(ConcurrentHashMap<Integer, Integer> map, Random rand) {
			this.map = map;
			this.rand = rand;
		}

		public void run() {
			for(int k = 0; k < NUM_OPERATIONS; k++) {
				int write = Math.abs(rand.nextInt())%CEILING_VALUE;
				map.put(write, k); 
				//System.out.println("Now storing " + k + " into key " + write);
			}
		}
	}
	
	public class removeClass implements Runnable {
		ConcurrentHashMap<Integer, Integer> map;
		Random rand;

		public removeClass(ConcurrentHashMap<Integer, Integer> map, Random rand) {
			this.map = map;
			this.rand = rand;
		}

		public void run() {
			for(int k = 0; k < NUM_OPERATIONS; k++) {
				int remove = Math.abs(rand2.nextInt())%CEILING_VALUE;
				map.remove(remove);					
				//System.out.println("Now removing value with key " + remove);
			}
		}
	}

	public class replaceClass implements Runnable {
		ConcurrentHashMap<Integer, Integer> map;
		Random rand;

		public replaceClass(ConcurrentHashMap<Integer, Integer> map, Random rand) {
			this.map = map;
			this.rand = rand;
		}

		public void run() {
			for(int k = 0; k < NUM_OPERATIONS; k++) {
				int replace = Math.abs(rand3.nextInt())%CEILING_VALUE;
				map.replace(replace, k);					
				//System.out.println("Now replacing value with key " + replace + " with value " + k);
			}
		}
	}
}
