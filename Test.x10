import x10.lang.Error;

/** Test
  * A minimal unit test framework
 **/
class Test {
  static public def assertEquals[X](lhs:X, rhs:X):void {
    var boxLHS:Object;
    var boxRHS:Object;
    if (lhs instanceof Object) { // lhs and rhs are objects
      boxLHS = lhs as Object;
      boxRHS = rhs as Object;
    } else {  // lhs and rhs are structs
      boxLHS = new Box[X](lhs);
      boxRHS = new Box[X](rhs);
    }
    if (!boxLHS.equals(boxRHS)) {
      throw new Error("Assertion failure: Expected " 
        + lhs.toString() + " and " + rhs.toString() + " to be equal.");
    }    
  }

  static public def assertTrue(expr:Boolean):void {
    if (!expr) {
      throw new Error("Assertion failure: Expected expression to be true.");
    }
  }

  static public def assertFalse(expr:Boolean):void {
    if (expr) {
      throw new Error("Assertion failure: Expected expression to be false.");
    }
  }

  static public def assertNull(obj:Object) {
    if (obj != null) {
      throw new Error("Assertion failure: Expected " + obj.toString()
        + " to be null.");
    }
  }
}
