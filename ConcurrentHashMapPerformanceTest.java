import java.util.concurrent.*;
import java.util.*;
import java.lang.Integer;

public class ConcurrentHashMapPerformanceTest {

	static final int CEILING_VALUE = 1000;
	static final int NUM_OPERATIONS = 100000;

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
		for (int i = 0; i < NUM_OPERATIONS; i++) {
			(new Thread(new putClass(map,rand,i))).start();
		}
		for (int i = 0; i < NUM_OPERATIONS; i++) {
			(new Thread(new removeClass(map,rand2))).start();
		}
		for (int i = 0; i < NUM_OPERATIONS; i++) {
			(new Thread(new replaceClass(map,rand3,i))).start();
		}
	}
  
  	public class putClass implements Runnable {
		ConcurrentHashMap<Integer, Integer> map;
		Random rand;
		int value;

		public putClass(ConcurrentHashMap<Integer, Integer> map, Random rand, int value) {
			this.map = map;
			this.rand = rand;
			this.value = value;
		}

		public void run() {
			int write = Math.abs(rand.nextInt())%CEILING_VALUE;
			map.put(write, value); 
			//System.out.println("Now storing " + value + " into key " + write);
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
			int remove = Math.abs(rand2.nextInt())%CEILING_VALUE;
			map.remove(remove);					
			//System.out.println("Now removing value with key " + remove);
		}
	}

	public class replaceClass implements Runnable {
		ConcurrentHashMap<Integer, Integer> map;
		Random rand;
		int value;

		public replaceClass(ConcurrentHashMap<Integer, Integer> map, Random rand, int value) {
			this.map = map;
			this.rand = rand;
			this.value = value;
		}

		public void run() {
			int replace = Math.abs(rand3.nextInt())%CEILING_VALUE;
			map.replace(replace, value);					
			//System.out.println("Now replacing value with key " + replace + " with value " + value);
		}
	}
}
