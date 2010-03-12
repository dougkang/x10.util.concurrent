import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

class CopyOnWriteArrayListTest {
	public static void main(String[] args) {
		CopyOnWriteArrayList tempObject = new CopyOnWriteArrayList();
		
		tempObject.add(new AtomicInteger(5));
		tempObject.add(0,new AtomicInteger(0));
		
		System.out.println(tempObject);
		for(int j = 0; j < 100000; j+=10) {
			int i = j;
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

		System.out.println(tempObject);
	}
}
