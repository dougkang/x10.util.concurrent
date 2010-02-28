// package statement?

import x10.util.*;

public abstract class AbstractSet[T] extends AbstractCollection[T] implements Set[T] {

	protected def this() { }
	public def equals(o: Object) : Boolean {
		if (o == this)
			return true;
		
		if (! (o instanceof Set))
			return false;
		var c: Collection[T]! = o as Collection[T];
		if (c.size() != size())
			return false;
		try {
			return containsAll(c);
		} catch (unused: ClassCastException) {
			return false;
		} catch (unused: NullPointerException) {
			return false;
		}
	}
	/*public global safe def hashCode() : Int {
		var h: Int = 0;
		var i: Iterator[T]! = iterator();
		while(i.hasNext()) {
			var obj: Object = i.next() as Object;
			if(obj != null)
				h += obj.hashCode();
		}
		return h;
	}*/
	/* this optional operation is unsupported because the iterator method does not implement the remove method */

	public def removeAll(c: Collection[T]!) : Boolean {
		throw new UnsupportedOperationException();
	}
}
