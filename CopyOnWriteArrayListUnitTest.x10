/*
 * Written by Doug Lea with assistance from members of JCP JSR-166
 * Expert Group and released to the public domain, as explained at
 * http://creativecommons.org/licenses/publicdomain
 * Other contributors include Andrew Wright, Jeffrey Hayes,
 * Pat Fisher, Mike Judd.
 */

//import junit.framework.*;
import x10.util.*;
import x10.util.concurrent.*;
import x10.util.concurrent.atomic.AtomicInteger;

public class CopyOnWriteArrayListUnitTest {

	SIZE:Int = 7;
	
	static val zero:AtomicInteger = new AtomicInteger(0);
	static val one:AtomicInteger = new AtomicInteger(1);
	static val two:AtomicInteger = new AtomicInteger(2);
	

    public static def main(args:Rail[String]!) : void {
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
		
		Console.OUT.println("\n\nUNIT TESTS\n----------\n\n");
		
		a:CopyOnWriteArrayListUnitTest! = new CopyOnWriteArrayListUnitTest();
		
		a.testConstructor();
		Console.OUT.println("testConstructor Success!");
		a.testConstructor2();
		Console.OUT.println("testConstructor2 Success!");
		a.testAddIfAbsent();
		Console.OUT.println("testAddIfAbsent Success!");
		a.testAddIfAbsent2();
		Console.OUT.println("testAddIfAbsent2 Success!");
		a.testClear();
		Console.OUT.println("testClear Success!");
		a.testContains();
		Console.OUT.println("testContains Success!");
		a.testAddIndex();
		Console.OUT.println("testAddIndex Success!");
		a.testEquals();
		Console.OUT.println("testEquals Success!");
		a.testGet();
		Console.OUT.println("testGet Success!");
		a.testIsEmpty();
		Console.OUT.println("testIsEmpty Success!");
		a.testRemove();
		Console.OUT.println("testRemove Success!");
	}		


    static def populatedArray(n: Int) : CopyOnWriteArrayList {
        var a: CopyOnWriteArrayList! = new CopyOnWriteArrayList();
        if(!a.isEmpty()) Console.OUT.println("populatedArray failed");
        a.add(zero);
        a.add(one);
        a.add(two);
        for (var i: Int = 3; i < n; ++i)
            a.add(new AtomicInteger(i));
            
        if(a.isEmpty()) Console.OUT.println("populatedArray failed");
        if(a.size() != n) Console.OUT.println("populatedArray failed");
        return a;
    }
    
    	//returns a Rail of size n filled with nulls
		//takes in a ValRail and returns a ValRailBuilder with all the
	//elements from the VailRail added to it
	private def getNullRail(n:Int):Rail[AtomicInteger] {
		var temp:RailBuilder[AtomicInteger]! = new RailBuilder[AtomicInteger](0);
		for(var i:Int = 0; i < n; i++) {
			temp.add(null);
		}
		return temp.result();
	}


    /**
     * a new list is empty
     */
    public def testConstructor() : void {
        var a: CopyOnWriteArrayList! = new CopyOnWriteArrayList();
        if(!a.isEmpty()) Console.OUT.println("testConstructor failed");
    }

    /**
     * new list contains all elements of initializing array
     */
    public def testConstructor2() : void {
        var ints: Rail[AtomicInteger]! = getNullRail(SIZE);
        for (var i: Int = 0; i < SIZE-1; ++i)
            ints(i) = new AtomicInteger(i);
        a:CopyOnWriteArrayList! = new CopyOnWriteArrayList(ints);
        for (var i: Int = 0; i < SIZE; ++i)
        	if(ints(i) != a.get(i))
        		Console.OUT.println("testConstructor2 failed");
    }
    
    /**
     *   addIfAbsent will not add the element if it already exists in the list
     */
    public def testAddIfAbsent() : void {
        var full: CopyOnWriteArrayList! = (populatedArray(SIZE)) as CopyOnWriteArrayList!;
        full.addIfAbsent(one);
        if(full.size() != SIZE) Console.OUT.println("testAddIfAbsent failed");
    }

    /**
     *   addIfAbsent adds the element when it does not exist in the list
     */
    public def testAddIfAbsent2() : void {
        var full: CopyOnWriteArrayList! = (populatedArray(SIZE)) as CopyOnWriteArrayList!;
        at:AtomicInteger = new AtomicInteger(3);
        full.addIfAbsent(at);
        if(!full.contains(at)) Console.OUT.println("testAddIfAbsent2 faile");
    }

    /**
     *   clear removes all elements from the list
     */
    public def testClear() : void {
        var full: CopyOnWriteArrayList! = (populatedArray(SIZE)) as CopyOnWriteArrayList!;
        full.clear();
        if(0 != full.size()) Console.OUT.println("testClear failed");
    }

    /**
     *   contains is true for added elements
     */
    public def testContains() : void {
        var full: CopyOnWriteArrayList! = (populatedArray(3)) as CopyOnWriteArrayList!;
        if(!full.contains(one)) Console.OUT.println("testContains failed");
        if(full.contains(new AtomicInteger(5))) Console.OUT.println("testContains failed");
    }

    /**
     * adding at an index places it in the indicated index
     */
    public def testAddIndex() : void {
        var full: CopyOnWriteArrayList! = (populatedArray(3)) as CopyOnWriteArrayList!;
        m1:AtomicInteger = new AtomicInteger(19);
        full.add(0, m1);
        if(4 != full.size()) Console.OUT.println("testAddIndex failed");
        if(m1 != full.get(0)) Console.OUT.println("testAddIndex failed");
        if(!zero.equals(full.get(1))) Console.OUT.println("testAddIndex failed");

        m2:AtomicInteger = new AtomicInteger(20);
        full.add(2, m2);
        if(5 != full.size()) Console.OUT.println("testAddIndex failed");
        if(m2 != full.get(2)) Console.OUT.println("testAddIndex failed");
        if(!two.equals(full.get(4))) Console.OUT.println("testAddIndex failed");
    }

    /**
     * lists with same elements are equal and have same hashCode
     */
    public def testEquals() : void {
		var a: CopyOnWriteArrayList! = (populatedArray(3)) as CopyOnWriteArrayList!;
		var b: CopyOnWriteArrayList! = (populatedArray(3)) as CopyOnWriteArrayList!;
        if(a.hashCode() != b.hashCode()) Console.OUT.println("testEquals failed");
        m1:AtomicInteger = new AtomicInteger(19);
        a.add(m1);
        if(a.equals(b)) Console.OUT.println("testEquals failed");
        if(b.equals(a)) Console.OUT.println("testEquals failed");
        b.add(m1);
        if(a.hashCode() != b.hashCode()) Console.OUT.println("testEquals failed");
    }
    

    /**
     *   get returns the value at the given index
     */
    public def testGet() : void {
   		var full: CopyOnWriteArrayList! = (populatedArray(3)) as CopyOnWriteArrayList!;
   		if(full.get(0).equals(new AtomicInteger(0))) Console.OUT.println("testGet failed");
    }


    /**
     *   isEmpty returns true when empty, else false
     */
    public def testIsEmpty() :  void {
        var empty: CopyOnWriteArrayList! = new CopyOnWriteArrayList();
        var full: CopyOnWriteArrayList! = (populatedArray(SIZE)) as CopyOnWriteArrayList!;
        if(full.isEmpty()) Console.OUT.println("testIsEmpty failed");
        if(! empty.isEmpty()) Console.OUT.println("testIsEmpty failed");
    }

    /**
     *   remove  removes and returns the object at the given index
     */
    public def testRemove() : void {
        var full: CopyOnWriteArrayList! = (populatedArray(3)) as CopyOnWriteArrayList!;
        if(!full.remove(2).equals(two)) Console.OUT.println("testRemove failed");
		if(full.size() != 2) Console.OUT.println("testRemove failed");
    }

}

