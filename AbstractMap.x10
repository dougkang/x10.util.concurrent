import x10.util.*;
import x10.util.Map.Entry;

public abstract class AbstractMap[K,V] implements Map[K,V] {
	/**
     	 * Sole constructor.  (For invocation by subclass constructors, typically
     	 * implicit.)
     	 */
    	protected def this() {
    	}
	
	// Query Operations

    	/**
     	 * <p>This implementation returns <tt>entries().size()</tt>.
     	 */
    	public def size() : Int {
        	return entries().size();
    	}

	/**
     	 * <p>This implementation returns <tt>size() == 0</tt>.
     	 */
    	public def isEmpty() : Boolean {
        	return size() == 0;
    	}

	/**	
	 * <p>This implementation iterates over <tt>entries()</tt> searching
     	 * for an entry with the specified value.  If such an entry is found,
     	 * <tt>true</tt> is returned.  If the iteration terminates without
     	 * finding such an entry, <tt>false</tt> is returned.  Note that this
     	 * implementation requires linear time in the size of the map.
     	 *
     	 * @throws ClassCastException   {@inheritDoc}
     	 * @throws NullPointerException {@inheritDoc}
     	 */
    	public def containsValue(value: Object) : Boolean {
        	val i: Iterator[Entry[K,V]]! = entries().iterator();
        	if (value == null) {
            		while (i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (e.getValue() == null)
                    			return true;
            		}
        	} else {
            		while (i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (value.equals(e.getValue()))
                    			return true;
            		}
        	}
        	return false;
   	 }
	
	/**
     	 * <p>This implementation iterates over <tt>entrySet()</tt> searching
     	 * for an entry with the specified key.  If such an entry is found,
     	 * <tt>true</tt> is returned.  If the iteration terminates without
     	 * finding such an entry, <tt>false</tt> is returned.  Note that this
     	 * implementation requires linear time in the size of the map; many
     	 * implementations will override this method.
     	 *
     	 * @throws ClassCastException   {@inheritDoc}
     	 * @throws NullPointerException {@inheritDoc}
     	 */
    	public def containsKey(key: Object) : Boolean {
        	var i: Iterator[Map.Entry[K,V]]! = entries().iterator();
        	if (key == null) {
           		while (i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (e.getKey() == null)
                    			return true;
            		}
        	} else {
            		while (i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (key.equals(e.getKey()))
                    			return true;
            		}
        	}
        	return false;
    	}

	/**
     	 * <p>This implementation iterates over <tt>entries()</tt> searching
     	 * for an entry with the specified key.  If such an entry is found,
     	 * the entry's value is returned.  If the iteration terminates without
     	 * finding such an entry, <tt>null</tt> is returned.  Note that this
     	 * implementation requires linear time in the size of the map; many
     	 * implementations will override this method.
     	 *
     	 * @throws ClassCastException            {@inheritDoc}
     	 * @throws NullPointerException          {@inheritDoc}
     	 */
    	 public safe def get(key: Object) : Box[V] {
        	var i: Iterator[Entry[K,V]]! = entries().iterator();
		var value: Box[V] = null;
        	if (key == null) {
            		while (i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (e.getKey() == null)
                    			value = e.getValue();
            		}
        	} else {
            		while (i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (key.equals(e.getKey()))
                    			value = e.getValue();
            		}
        	}
        	return value;
    	}

	public def put(key: K, value: V) : Box[V] {
        	throw new UnsupportedOperationException();
    	}

	public def remove(key: Object) : Box[V] {
        	var i: Iterator[Entry[K,V]]! = entries().iterator();
        	var correctEntry: Entry[K,V]! = null;
        	if (key == null) {
            		while (correctEntry==null && i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (e.getKey()==null)
                    			correctEntry = e;
            		}
        	} else {
            		while (correctEntry==null && i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		if (key.equals(e.getKey()))
                    			correctEntry = e;
            		}
        	}

        	var oldValue: Box[V] = null;
        	if (correctEntry != null) {
            		oldValue = correctEntry.getValue();
            		//i.remove(); FIX
        	}
        	return oldValue;
    	}

	public def putAll(m: Map[K, V]!) : void {
        	for (e: Map.Entry[K, V]! in m.entries())
            		put(e.getKey(), e.getValue());
    	}

    	public def clear() : void {
        	entries().clear();
    	}
	
	transient volatile var keySet: Set[K]        = null;
    	transient volatile var values: Collection[V] = null;

	public def keySet() : Set[K] {
        	if (keySet == null) {
            		keySet = new AbstractSet[K]() {
                		public def iterator() : Iterator[K] {
                    			return new Iterator[K]() {
                        			private var i: Iterator[Entry[K,V]]! = entries().iterator();

                        			public def hasNext() : Boolean {
                            				return i.hasNext();
                        			}

                        			public def next() : K {
                            				return i.next().getKey();
                        			}

                        			public def remove() : void {
                            				//i.remove(); // FIX :) 
                        			}
                    			};
                		}

                		public def size() : Int {
                    			return AbstractMap.this.size();
                		}

                		public def isEmpty() : Boolean {
                    			return AbstractMap.this.isEmpty();
                		}

                		public def clear() : void {
                    			AbstractMap.this.clear();
                		}

                		public def contains(k: Object) : Boolean {
                   			return AbstractMap.this.containsKey(k);
                		}
            		};
        	}
        	return keySet;
    	}

	public def values(): Collection[V] {
        	if (values == null) {
           		values = new AbstractCollection[V]() {
                		public def iterator() : Iterator[V] {
                    			return new Iterator[V]() {
                        			private var i: Iterator[Entry[K,V]]! = entrySet().iterator();

                        			public def hasNext() : Boolean {
                            				return i.hasNext();
                        			}

                        			public def next() : V {
                            				return i.next().getValue();
                        			}

                        			public def remove() : void {
                            				//i.remove(); FIX
                        			}
                    			};
                		}

                		public def size() : Int {
                    			return AbstractMap.this.size();
                		}

                		public def isEmpty() : Boolean {
                    			return AbstractMap.this.isEmpty();
                		}

                		public def clear() : void {
                    			AbstractMap.this.clear();
                		}

                		public def contains(v: Object) : Boolean {
                    			return AbstractMap.this.containsValue(v);
                		}
            		};
        	}
        	return values;
    	}

	public abstract def entrySet(): Set[Entry[K,V]];

	public def equals(o: Object) : Boolean {
        	if (o == this)
            		return true;

        	if (!(o instanceof Map[K,V]))
            		return false;
        	var m: Map[K,V]! = o as Map[K,V];
        	if (m.size() != size())
            		return false;

        	try {
            		var i: Iterator[Entry[K,V]]! = entries().iterator();
            		while (i.hasNext()) {
                		var e: Entry[K,V]! = i.next();
                		var key: Box[K] = e.getKey();
                		var value: Box[V] = e.getValue();
                		if (value == null) {
                    			if (!(m.get(key.value())==null && m.containsKey(key.value())))
                        			return false;
                			} else {
                    				if (!value.equals(m.get(key.value())))
                        				return false;
                			}
            			}
        		} catch (unused: ClassCastException) {
            			return false;
        		} catch (unused: NullPointerException) {
            			return false;
        		}

        	return true;
    	}

	public def hashCode() : Int {
        	var h: Int = 0;
        	var i: Iterator[Entry[K,V]]! = entries().iterator();
        	while (i.hasNext())
            		h += i.next().hashCode();
        	return h;
    	}

	public def toString() : String {
        	var i: Iterator[Entry[K,V]]! = entries().iterator();
        	if (! i.hasNext())
            		return "{}";

        	var sb: StringBuilder = new StringBuilder();
        	sb.add('{');
        	for (;;) {
            		var e: Entry[K,V]! = i.next();
            		var key: Box[K] = e.getKey();
            		var value: Box[V] = e.getValue();
            		sb.add(key == this ? "(this Map)" : key);
            		sb.add('=');
            		sb.add(value == this ? "(this Map)" : value);
            		if (! i.hasNext())
                		return sb.add('}').toString();
            		sb.add(", ");
        	}
    	}

    	/**
     	 * Returns a shallow copy of this <tt>AbstractMap</tt> instance: the keys
     	 * and values themselves are not cloned.
     	 *
     	 * @return a shallow copy of this map
    	 */ 
    	protected def clone() : Object throws UnsupportedOperationException {
        	var result: AbstractMap[K,V]! = super.clone() as AbstractMap[K,V];
        	result.keySet = null;
        	result.values = null;
        	return result;
    	}

    	/**
     	 * Utility method for SimpleEntry and SimpleImmutableEntry.
     	 * Test for equality, checking for nulls.
     	 */
    	private static def eq(o1: Object, o2: Object) : Boolean {
        	return o1 == null ? o2 == null : o1.equals(o2);
    	}

	public static class SimpleEntry[K,V] implements Entry[K,V]
  	{

        	private global var key: Box[K];
        	private global var value: Box[V];

        	/**
         	 * Creates an entry representing a mapping from the specified
         	 * key to the specified value.
         	 *
         	 * @param key the key represented by this entry
         	 * @param value the value represented by this entry
         	 */
        	public def this(key: K, value: V) {
            		this.key   = key;
            		this.value = value;
        	}

        	/**
         	 * Creates an entry representing the same mapping as the
         	 * specified entry.
         	 *
         	 * @param entry the entry to copy
         	 */
        	public def this(entry: Entry[K, V]!) {
            		this.key   = entry.getKey();
            		this.value = entry.getValue();
        	}

        	/**
         	 * Returns the key corresponding to this entry.
         	 *
         	 * @return the key corresponding to this entry
         	 */
        	public def getKey() : K {
            		return key.value();
        	}

        	/**
         	 * Returns the value corresponding to this entry.
         	 *
         	 * @return the value corresponding to this entry
         	 */
        	public def getValue() : V {
            		return value.value();
        	}

        	/**
         	 * Replaces the value corresponding to this entry with the specified
         	 * value.
         	 *
         	 * @param value new value to be stored in this entry
         	 */
        	public def setValue(value: V) : void {
            		this.value = value;
        	}

        	/**
         	 * Compares the specified object with this entry for equality.
         	 * Returns {@code true} if the given object is also a map entry and
         	 * the two entries represent the same mapping.  More formally, two
         	 * entries {@code e1} and {@code e2} represent the same mapping
         	 * if<pre>
         	 *   (e1.getKey()==null ?
         	 *    e2.getKey()==null :
         	 *    e1.getKey().equals(e2.getKey()))
         	 *   &amp;&amp;
         	 *   (e1.getValue()==null ?
         	 *    e2.getValue()==null :
         	 *    e1.getValue().equals(e2.getValue()))</pre>
         	 * This ensures that the {@code equals} method works properly across
         	 * different implementations of the {@code Map.Entry} interface.
         	 *
         	 * @param o object to be compared for equality with this map entry
         	 * @return {@code true} if the specified object is equal to this map
         	 *         entry
         	 * @see    #hashCode
         	 */
        	public def equals(o: Object) : Boolean {
            		if (!(o instanceof Entry[K,V]))
                		return false;
            		var e: Map.Entry[K,V]! = o as Entry[K,V];
            		return (key == null ? e.getKey() == null : key.equals(e.getKey())) && 
				(value == null ? e.getValue() == null : value.equals(e.getValue()));
        	}

        	/**
         	 * Returns the hash code value for this map entry.  The hash code
         	 * of a map entry {@code e} is defined to be: <pre>
         	 *   (e.getKey()==null   ? 0 : e.getKey().hashCode()) ^
         	 *   (e.getValue()==null ? 0 : e.getValue().hashCode())</pre>
         	 * This ensures that {@code e1.equals(e2)} implies that
         	 * {@code e1.hashCode()==e2.hashCode()} for any two Entries
         	 * {@code e1} and {@code e2}, as required by the general
         	 * contract of {@link Object#hashCode}.
         	 *
         	 * @return the hash code value for this map entry
         	 * @see    #equals
         	 */
        	public global safe def hashCode() : Int {
            		return (key   == null ? 0 :   key.hashCode()) ^
                   		(value == null ? 0 : value.hashCode());
       		}

        	/**
         	 * Returns a String representation of this map entry.  This
        	 * implementation returns the string representation of this
        	 * entry's key followed by the equals character ("<tt>=</tt>")
        	 * followed by the string representation of this entry's value.
        	 *
        	 * @return a String representation of this map entry
        	 */
        	public global safe def toString() : String {
            		return key + "=" + value;
        	}

    	}

	public class SimpleImmutableEntry[K,V] implements Map.Entry[K,V]
	{
		private global var key: Box[K];
		private global var value: Box[V];

		/**
		 * Creates an entry representing a mapping from the specified
		 * key to the specified value.
		 *
		 * @param key the key represented by this entry
		 * @param value the value represented by this entry
		 */
		public def this(key: K, value: V) {
		    this.key   = key;
		    this.value = value;
		}

		/**
		 * Creates an entry representing the same mapping as the
		 * specified entry.
		 *
		 * @param entry the entry to copy
		 */
		public def this(entry: Entry[K, V]!) {
			this.key   = entry.getKey();
			this.value = entry.getValue();
		}

		/**
		 * Returns the key corresponding to this entry.
		 *
		 * @return the key corresponding to this entry
		 */
		public def getKey(): K {
			if (key == null)
				return null as K;
		    	return key.value();
		}

		/**
		 * Returns the value corresponding to this entry.
		 *
		 * @return the value corresponding to this entry
		 */
		public def getValue(): V {
			if (value == null)
				return null as V;
		    	return value.value();
		}

		/**
		 * Replaces the value corresponding to this entry with the specified
		 * value (optional operation).  This implementation simply throws
		 * <tt>UnsupportedOperationException</tt>, as this class implements
		 * an <i>immutable</i> map entry.
		 *
		 * @param value new value to be stored in this entry
		 * @return (Does not return)
		 * @throws UnsupportedOperationException always
		 */
		public def setValue(value: V): void {
			throw new UnsupportedOperationException();
		}

		/**
		 * Compares the specified object with this entry for equality.
		 * Returns {@code true} if the given object is also a map entry and
		 * the two entries represent the same mapping.  More formally, two
		 * entries {@code e1} and {@code e2} represent the same mapping
		 * if<pre>
		 *   (e1.getKey()==null ?
		 *    e2.getKey()==null :
		 *    e1.getKey().equals(e2.getKey()))
		 *   &amp;&amp;
		 *   (e1.getValue()==null ?
		 *    e2.getValue()==null :
		 *    e1.getValue().equals(e2.getValue()))</pre>
		 * This ensures that the {@code equals} method works properly across
		 * different implementations of the {@code Map.Entry} interface.
		 *
		 * @param o object to be compared for equality with this map entry
		 * @return {@code true} if the specified object is equal to this map
		 *         entry
		 * @see    #hashCode
		 */
		public def equals(o: Object): Boolean {
			if (!(o instanceof Entry[K,V]))
		        	return false;
		    	var e: Entry[K,V]! = o as Entry[K,V]!;
		    	return (key == null ? e.getKey() == null : key.equals(e.getKey())) && 
				(value == null ? e.getValue() == null : value.equals(e.getValue()));
		}

		/**
		 * Returns the hash code value for this map entry.  The hash code
		 * of a map entry {@code e} is defined to be: <pre>
		 *   (e.getKey()==null   ? 0 : e.getKey().hashCode()) ^
		 *   (e.getValue()==null ? 0 : e.getValue().hashCode())</pre>
		 * This ensures that {@code e1.equals(e2)} implies that
		 * {@code e1.hashCode()==e2.hashCode()} for any two Entries
		 * {@code e1} and {@code e2}, as required by the general
		 * contract of {@link Object#hashCode}.
		 *
		 * @return the hash code value for this map entry
		 * @see    #equals
		 */
		public global safe def hashCode() : Int {
			return (key   == null ? 0 :   key.hashCode()) ^
		        	(value == null ? 0 : value.hashCode());
		}

		/**
		 * Returns a String representation of this map entry.  This
		 * implementation returns the string representation of this
		 * entry's key followed by the equals character ("<tt>=</tt>")
		 * followed by the string representation of this entry's value.
		 *
		 * @return a String representation of this map entry
		 */
		public global safe def toString() : String {
			return key + "=" + value;
		}
	}
}

