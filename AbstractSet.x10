// package statement?

import x10.util.*;

public abstract class AbstractSet[T] extends AbstractCollection[T] implements Set[T] {

	protected def this() { }
	public def equals(o: Object) : Boolean {
		if (o == this)
			return true;
		
		if (! (o instanceof Set))
			return false;
		var c: Collection! = o as Collection;
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
	public def hashCode() : Int {
		var h: Int = 0;
		var i: Iterator[T] = iterator();
		while(i.hashNext()) {
			var obj: Object! = i.next() as Object;
			if(obj != null)
				h += obj.hashCode();
		}
		return h;
	}
	public def removeAll(c: Collection[T]) : Boolean {
		var modified : Boolean = false;
		
		if (size() > c.size()) {
			for (var i: Iterator[T] = c.iterator(); i.hasNext(); )
				modified |= remove(i.next());
		} else {
			for ( var i: Iterator[T] = iterator(); i.hasNext(); ) {
				if (c.contains(i.next())) {
					i.remove();
					modified = true;
				}
			}
		}
		return modified;
	}
}
