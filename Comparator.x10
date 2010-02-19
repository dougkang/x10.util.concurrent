// (C) Copyright IBM Corporation 2006-2008.
// This file is part of X10 Language.

package x10.lang;

public interface Comparator[T] {
    def compare(that1:T, that2:T):int;
	def equals(that:T):Boolean;
}
