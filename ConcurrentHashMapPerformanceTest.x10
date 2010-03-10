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
import x10.util.*;
 
/**
 * ConcurrentHashMap that should perform normal hashmap functions atomically.
 * Does a performance test
 */
 
class ConcurrentHashMapPerformanceTest {
 
	static CEILING_VALUE:Int = 1000;
	static NUM_OPERATIONS:Int = 500000;
	var map:ConcurrentHashMap[Int, Int]!;
	var rand: Random;
	var rand2: Random;
	var rand3: Random;

	public def this() {
		map = new ConcurrentHashMap[Int, Int](500);
		rand = new Random(System.nanoTime()+304729);
		rand2 = new Random(System.nanoTime()+652507);
		rand3 = new Random(System.nanoTime()+856733);
	}

	public static def main(args:Rail[String]!):void {
		var test: ConcurrentHashMapPerformanceTest! = new ConcurrentHashMapPerformanceTest();
		test.testConcurrency();
	}

	public def testConcurrency() {

		finish {
			try {
				for(shared var i: Int = 0; i < NUM_OPERATIONS; i++) {
					val k: Int = i;
					async {
						val write:Int = Math.abs(rand.nextInt())%CEILING_VALUE;
						map.put(write, k); 
						//Console.OUT.println("Now storing " + k + " into key " + write);
					}
				}

				for(shared var i: Int = 0; i < NUM_OPERATIONS; i++) {
					val k: Int = i;
					async {
						val remove:Int = Math.abs(rand2.nextInt())%CEILING_VALUE;
						map.remove(remove);					
						//Console.OUT.println("Now removing value with key " + remove);
					}
				}

				for(shared var i: Int = 0; i < NUM_OPERATIONS; i++) {
					val k: Int = i;
					async {
						val replace:Int = Math.abs(rand3.nextInt())%CEILING_VALUE;
						map.replace(replace, k);					
						//Console.OUT.println("Now replacing value with key " + replace + " with value " + k);
					}
				}
			} catch (e: NullPointerException) {
				//e.printStackTrace();
				Console.OUT.println("caught nullpointerexception");
			}
		}
		//Console.OUT.println("DONE");
	}
}
