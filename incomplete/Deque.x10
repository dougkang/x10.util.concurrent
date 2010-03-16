package x10.util;

public interface Deque[E] extends Collection[E], Iterable[E], Queue[E] {
	def add(e: E): Boolean; //Inserts the specified element into the queue represented by this deque (in other words, at the tail of this deque) if it is possible to do so immediately without violating capacity restrictions, returning true upon success and throwing an IllegalStateException if no space is currently available.
	
	def addFirst(e: E): Void; //Inserts the specified element at the front of this deque if it is possible to do so immediately without violating capacity restrictions.
 	def addLast(e: E): Void;//Inserts the specified element at the end of this deque if it is possible to do so immediately without violating capacity restrictions.
 	def contains(o: Object): Boolean; //Returns true if this deque contains the specified element.
 	def descendingIterator(): Iterator[E]; //Returns an iterator over the elements in this deque in reverse sequential order.
 	def element(): E; //Retrieves, but does not remove, the head of the queue represented by this deque (in other words, the first element of this deque).
 	def getFirst(): E; //Retrieves, but does not remove, the first element of this deque.
 	def getLast(): E; //Retrieves, but does not remove, the last element of this deque.
 	def iterator(): Iterator[E];

 	def offer(e: E): Boolean;//Inserts the specified element into the queue represented by this deque (in other words, at the tail of this deque) if it is possible to do so immediately without violating capacity restrictions, returning true upon success and false if no space is currently available. 	
 	def offerFirst(e: E): Boolean; //Inserts the specified element at the front of this deque unless it would violate capacity restrictions.
 	def offerLast(e: E): Boolean; //Inserts the specified element at the end of this deque unless it would violate capacity restrictions.
 	def peek(): E;//Retrieves, but does not remove, the head of the queue represented by this deque (in other words, the first element of this deque), or returns null if this deque is empty.
 	def peekFirst(): E;//Retrieves, but does not remove, the first element of this deque, or returns null if this deque is empty.
 	def peekLast(): E;//Retrieves, but does not remove, the last element of this deque, or returns null if this deque is empty.
 	def poll(): E; //Retrieves and removes the head of the queue represented by this deque (in other words, the first element of this deque), or returns null if this deque is empty.
 	def pollFirst(): E; //Retrieves and removes the first element of this deque, or returns null if this deque is empty.
 	def pollLast(): E; //Retrieves and removes the last element of this deque, or returns null if this deque is empty.
 	def pop(): E; //Pops an element from the stack represented by this deque.
 	def push(e: E): Void; //Pushes an element onto the stack represented by this deque (in other words, at the head of this deque) if it is possible to do so immediately without violating capacity restrictions, returning true upon success and throwing an IllegalStateException if no space is currently available.
 	def remove(): E; //Retrieves and removes the head of the queue represented by this deque (in other words, the first element of this deque).
 	def remove(o: Object): Boolean; //Removes the first occurrence of the specified element from this deque.
 	def removeFirst(): E; //Retrieves and removes the first element of this deque.
 	def removeFirstOccurrence(o: Object): Boolean; //Removes the first occurrence of the specified element from this deque.
 	def removeLast(): E; //Retrieves and removes the last element of this deque.
 	def removeLastOccurrence(o: Object): Boolean; //Removes the last occurrence of the specified element from this deque.
 	def size(): Int;
}