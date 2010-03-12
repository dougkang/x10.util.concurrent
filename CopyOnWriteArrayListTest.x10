import x10.io.Console;
import x10.util.concurrent.atomic.AtomicInteger;

class CopyOnWriteArrayListTest {
	public static def main(args:Rail[String]!):void {
		shared var tempObject:CopyOnWriteArrayList! = new CopyOnWriteArrayList();
		
		tempObject.add(new AtomicInteger(5));
		tempObject.add(0,new AtomicInteger(0));
		
		Console.OUT.println(tempObject);
		
		for(shared var j:Int = 0; j < 100000; j+=10) {
			val i:Int = j;
			 tempObject.add(0, new AtomicInteger(i+1));
			 tempObject.add(0, new AtomicInteger(i+2));
			 tempObject.remove(0);
			 tempObject.remove(tempObject.size()-1);
			 tempObject.set(tempObject.size()-1, new AtomicInteger(i+3));
			 
			 tempObject.add(0, new AtomicInteger(i+4));
			 tempObject.add(0, new AtomicInteger(i+5));
			 tempObject.remove(0);
			 tempObject.remove(tempObject.size()-1);
			 tempObject.set(tempObject.size()-1, new AtomicInteger(i+6));
			 
			 tempObject.add(0, new AtomicInteger(i+7));
			 tempObject.add(0, new AtomicInteger(i+8));
			 tempObject.remove(0);
			 tempObject.remove(tempObject.size()-1);
			 tempObject.set(tempObject.size()-1, new AtomicInteger(i+9));
		}
		

		Console.OUT.println(tempObject);
	}
}
