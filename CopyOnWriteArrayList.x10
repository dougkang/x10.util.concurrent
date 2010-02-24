import x10.io.Console;
import x10.util.ValRailBuilder;
import x10.lang.ValRail;

class CopyOnWriteArrayList {
	//this is the current copy of the array
	//a copy is made on every call that modifies
	//the array
	private var mainArray:ValRail[Object];
	
	//---------------------------------------------------------------------
	//Private helper methods
	//---------------------------------------------------------------------
	
	//takes in a ValRail and returns a duplicate copy
	private proto def copyOf(var old:ValRail[Object]):ValRail[Object] {
		var temp:ValRailBuilder[Object]! = new ValRailBuilder[Object](0);
		for(var i:Int = 0; i < old.length; i++) {
			temp.add(old(i));
		}
		return temp.result();
	}

	//takes in a ValRail and returns a ValRailBuilder with all the
	//elements from the VailRail added to it
	private def getBuilder(var old:ValRail[Object]):ValRailBuilder[Object] {
		var temp:ValRailBuilder[Object]! = new ValRailBuilder[Object](0);
		for(var i:Int = 0; i < old.length; i++) {
			temp.add(old(i));
		}
		return temp;
	}
	
	//returns a Rail of size n filled with nulls
		//takes in a ValRail and returns a ValRailBuilder with all the
	//elements from the VailRail added to it
	private def getNullRail(n:Int):Rail[Object] {
		var temp:ValRailBuilder[Object]! = new ValRailBuilder[Object](0);
		for(var i:Int = 0; i < n; i++) {
			temp.add(null);
		}
		return temp.result();
	}

	//sets the passed in array to the mainArray
	private proto def setArray(var a:ValRail[Object]):void {
		mainArray = a;
	}
	
	//returns the main array
	private def getArray():ValRail[Object] {
		return mainArray;
	}

	//---------------------------------------------------------------------
	//Constructors
	//---------------------------------------------------------------------
	
	//contructs an empty CopyOnWriteArrayList
	def this() {
		var temp:ValRailBuilder[Object]! = new ValRailBuilder[Object](0);
		setArray(temp.result());
	}

	//ignoring the second constructor because it uses
	//Collections and we don't want to worry about that right not
	
	//contructs a CopyOnWriteArrayList with the passed
	//in ValRail
	def this(toCopyIn:ValRail[Object]) {
		setArray(copyOf(toCopyIn));
	}

	//---------------------------------------------------------------------
	//Public methods
	//---------------------------------------------------------------------
	
	//returns the current size of the array
	def size():Int {
		return getArray().length;
	}
	
	//returns true if the array is empty, false otherwise
	def isEmpty():Boolean {
		return size()==0;
	}
	
	//returns true if the two objects passed in are equal
	//returns false otherwise
	static def eq(o1:Object, o2:Object):Boolean {
		return (o1==null?o2==null:o1.equals(o2));
	}
	
	//returns the first index of the array where the element is found
	//that is after or equal to the index value passed in and is before
	//fence, if it is not found, return -1
	static def indexOf(o:Object, elements:ValRail[Object], index:Int, fence:Int):Int {
       if (o == null) {
           for (var i:Int = index; i < fence; i++)
               if (elements(i) == null)
                   return i;
       } else {
           for (var i:Int = index; i < fence; i++)
               if (o.equals(elements(i)))
                   return i;
       }
       return -1;
   }
   
   	//returns the first index of the array where the element is found
	//that is after or equal to the index value passed in
	//if it is not found, return -1
	static def lastIndexOf(o:Object, elements:ValRail[Object], index:Int):Int {
       if (o == null) {
           for (var i:Int = index; i >= 0; i--)
               if (elements(i) == null)
                   return i;
       } else {
           for (var i:Int = index; i >= 0; i--)
               if (o.equals(elements(i)))
                   return i;
       }
       return -1;
   }
   
   //returns true if the object is contained in this class's mainArray
   //returns false otherwise
   def contains (o:Object):Boolean {
       elements:ValRail[Object]  = getArray();
       return indexOf(o, elements, 0, elements.length) >= 0;
   }
   
   //returns the index of the object in this classe's mainArray
   def indexOf(o:Object):Int {
       elements:ValRail[Object] = getArray();
       return indexOf(o, elements, 0, elements.length);
   }
   
   //returns the first index of the Object that is
   //greater than or equal to index
   def indexOf(e:Object, index:Int):Int {
       elements:ValRail[Object] = getArray();
       return indexOf(e, elements, index, elements.length);
   }
   
   //returns the last index of the object in this classe's mainArray
   def lastIndexOf(o:Object):Int {
       elements:ValRail[Object] = getArray();
       return lastIndexOf(o, elements, elements.length - 1);
   }
   
   //returns the last index of the object that is
   //before or equal to index
   def lastIndexOf(e:Object, index:Int):Int {
       elements:ValRail[Object] = getArray();
       return lastIndexOf(e, elements, index);
   }
   
   //skipping clone because there is no clone() method
   //for objects in x10

	//returns an array implementation of this class
	def toArray():ValRail[Object] {
		elements:ValRail[Object] = getArray();
		return copyOf(elements);
	}
	
	//returns an array implementation of this class
	//it is stored in the passed in value if it is
	//large enough, and in a newly created value if
	//it is not
	def toArray(a:Rail[Object]!):Rail[Object] {
       elements:ValRail[Object] = getArray();
       len:Int = elements.length;
       if (a.length < len)
           return copyOf(elements);
       else {
           System.copyTo(elements, 0, a, 0, len);
           if (a.length > len)
               a(len) = null;
           return a;
       }
   }
   
   //returns the element at the given index
   def get(index:Int):Object {
       return getArray()(index);
   }
   
   //replaces the element at the specified index
   //with the new one passed in
   def set(index:Int, element:Object):Object {
   	   var newElements:Rail[Object]!;
       atomic{ //(Should be here, but compiler complains about copyOf line)
           elements:ValRail[Object] = getArray();
           oldValue:Object = elements(index);

           if (oldValue != element) {
               len:Int = elements.length;
               newElements = copyOf(elements);
               newElements(index) = element;
               setArray(newElements);
           } else {
               // Not quite a no-op; ensures volatile write semantics
               setArray(elements);
           }
           return oldValue;
       }
   }
   
   def add(e:Object):Boolean {
     //final ReentrantLock lock = this.lock;
     //lock.lock();
     //try {
         elements:ValRail[Object] = getArray();
         len:Int = elements.length;
         newElements:ValRailBuilder[Object]! = getBuilder(elements);
         newElements.add(e);
         setArray(newElements.result());
         return true;
     //} finally {
     //    lock.unlock();
     //}
 }
 
 def add(index:Int, element:Object):Void {
       //final ReentrantLock lock = this.lock;
       //lock.lock();
       //try {
           elements:ValRail[Object] = getArray();
           len:Int = elements.length;
           if (index > len || index < 0){
	           Console.OUT.println("Index:"+index+", Size: "+len);
	           return;
	       } 
           
           var newElements:Rail[Object]! = getNullRail(len + 1);
           numMoved:Int = len - index;
           if (numMoved == 0) {
               System.copyTo(elements, 0, newElements, 0, len);
            }
           else {
               System.copyTo(elements, 0, newElements, 0, index);
               System.copyTo(elements, index, newElements, index + 1,
                                numMoved);
           }
           newElements(index) = element;
           setArray(newElements);
       //} finally {
       //    lock.unlock();
       //}
   }
   
   def remove(index:Int):Object {
       //final ReentrantLock lock = this.lock;
       //lock.lock();
       //try {
           elements:ValRail[Object] = getArray();
           len:Int = elements.length;
           oldValue:Object = elements(index);
           numMoved:Int = len - index - 1;
           
           var newElements:Rail[Object]! = getNullRail(len - 1);
           if (numMoved == 0)
               System.copyTo(elements, 0, newElements, 0, len - 1);
           else {
               System.copyTo(elements, 0, newElements, 0, index);
               System.copyTo(elements, index + 1, newElements, index, numMoved);
               setArray(newElements);
           }
           return oldValue;
       //} finally {
       //    lock.unlock();
       //}
   }
 
 	def remove(o:Object):Boolean {
       //final ReentrantLock lock = this.lock;
       //lock.lock();
       //try {
           elements:ValRail[Object] = getArray();
           len:Int = elements.length;
           if (len != 0) {
               // Copy while searching for element to remove
               // This wins in the normal case of element being present
               newlen:Int = len - 1;
               var newElements:Rail[Object]! = getNullRail(newlen);

               for (var i:Int = 0; i < newlen; ++i) {
                   if (eq(o, elements(i))) {
                       // found one;  copy remaining and exit
                       for (var k:Int = i + 1; k < len; ++k)
                           newElements(k-1) = elements(k);
                       setArray(newElements);
                       return true;
                   } else
                       newElements(i) = elements(i);
               }

               // special handling for last cell
               if (eq(o, elements(newlen))) {
                   setArray(newElements);
                   return true;
               }
           }
           return false;
       //} finally {
       //    lock.unlock();
       //}
   }
 
	
}
