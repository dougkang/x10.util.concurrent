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

	public def put(key: K, value: V) : Box[V] {
        	throw new UnsupportedOperationException();
    	}

    	public def clear() : void {
        	entries().clear();
    	}
	
	transient volatile var keySet: Set[K]        = null;
    	transient volatile var values: Collection[V] = null;

	public abstract def entries(): Set[Map.Entry[K,V]];

	public def iterator() : Iterator[Map.Entry[K,V]] { return entries().iterator(); }

	public def values(): Collection[V] {
		/*if (values == null)
           		values = new AbstractMap_AbstractCollection_1[K,V](this); 
		return values;*/
		var vs: Collection[V]! = new HashSet[V]();
		var it: Iterator[Map.Entry[K, V]]! = iterator();
		while (it.hasNext()) {
			var cur: Map.Entry[K, V]! = it.next();
			vs.add(cur.getValue());
		}
		return vs;
    	}

	public def keySet(): Set[K] {
		/*if (keySet == null)
           		keySet = new AbstractMap_AbstractSet_1[K](this); 
		return keySet;*/
		var whole:Set[K]! = new HashSet[K]();
		var it: Iterator[Map.Entry[K,V]]! = iterator();
		while (it.hasNext()) {
			var cur: Map.Entry[K,V]! = it.next();
			whole.add(cur.getKey());
		}
		return whole;
    	}


	/* Cannot get this to work... so used replacement code that is "less fancy" - see above

	static class AbstractMap_AbstractCollection_1[K,V] extends AbstractCollection[V] {
		val container:AbstractMap[K,V]!;

            	def this(outerThis:AbstractMap[K,V]) { container = outerThis; }

           	public def iterator() : Iterator[V] {
                	return new AbstractCollection_Iterator_1[V](this);
                }

           	public def size() : Int {
                   	return container.size();
               	}

              	public def isEmpty() : Boolean {
              		return container.isEmpty();
              	}

                public def clear() : void {
             		container.clear();
       		}

                public def clone() : AbstractCollection[V] {
                        throw new UnsupportedOperationException();
                }

		public def add(V):Boolean {
                        throw new UnsupportedOperationException();
                }

		public def remove(V):Boolean {
                        throw new UnsupportedOperationException();
                }

                public def contains(v:V) : Boolean {
                        throw new UnsupportedOperationException();
                }
    	}


	static class AbstractCollection_Iterator_1[V] implements Iterator[V] {
		val container: AbstractCollection[V]!;
		def this(outerThis: AbstractCollection[V]) { this.container = outerThis; }
		public def hasNext() : Boolean { return container.iterator().hasNext(); }
		public def next() : V { return container.iterator().next(); }
	}	

	
	static class AbstractMap_AbstractSet_1[K,V] extends AbstractSet[K] {
		val container:AbstractMap[K,V]!;

            	def this(outerThis:AbstractMap[K,V]) { container = outerThis; }

           	public def iterator() : Iterator[K] {
                	return new AbstractSet_Iterator_1[K](this); /*{
                       		private var i: Iterator[Entry[K,V]]! = container.entries().iterator();

                        		public def hasNext() : Boolean {
                            			return i.hasNext();
                        		}

                        		public def next() : K {
                            			return i.next().getKey();
                        		}

                    		};
                }

           	public def size() : Int {
                   	return container.size();
               	}

              	public def isEmpty() : Boolean {
              		return container.isEmpty();
              	}

                public def clear() : void {
             		container.clear();
       		}

                public def clone() : AbstractSet[K] {
                        throw new UnsupportedOperationException();
                }

		public def add(K):Boolean {
                        throw new UnsupportedOperationException();
                }

		public def remove(K):Boolean {
                        throw new UnsupportedOperationException();
                }

                public def contains(k:K) : Boolean {
                        throw new UnsupportedOperationException();
                }
    	}

	static class AbstractSet_Iterator_1[K] implements Iterator[K] {
		val container: AbstractSet[K]!;
		def this(outerThis: AbstractSet[K]) { this.container = outerThis; }
		public def hasNext() : Boolean { return container.iterator().hasNext(); }
		public def next() : K { return container.iterator().next(); }
	}*/


	public static class SimpleImmutableEntry[K,V] implements Map.Entry[K,V]
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

