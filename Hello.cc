#include <Hello.h>


#include "Hello.inc"

void Hello::_instance_init() {
    _I_("Doing initialisation for class: Hello");
    
}


//#line 10 "/home/jim/Desktop/X10/bin/Hello.x10"
#include <x10/lang/Runtime.h>
#include <x10aux/bootstrap.h>
extern "C" { int main(int ac, char **av) { return x10aux::template_main<x10::lang::Runtime,Hello>(ac,av); } }

void Hello::main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > id__0) {
    
    //#line 11 "/home/jim/Desktop/X10/bin/Hello.x10"
    x10aux::nullCheck(x10::io::Console::FMGL(OUT__get)())->x10::io::Printer::println(
      x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("Hello, X10 world!")));
    
    //#line 12 "/home/jim/Desktop/X10/bin/Hello.x10"
    x10aux::ref<Hello> h = Hello::_make();
    
    //#line 13 "/home/jim/Desktop/X10/bin/Hello.x10"
    x10_boolean myBool = x10aux::nullCheck(h)->myMethod();
    
    //#line 14 "/home/jim/Desktop/X10/bin/Hello.x10"
    x10aux::nullCheck(x10::io::Console::FMGL(OUT__get)())->x10::io::Printer::println(
      x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("The answer is: ") +
      x10aux::safe_to_string(myBool)));
}

//#line 16 "/home/jim/Desktop/X10/bin/Hello.x10"
x10_boolean Hello::myMethod() {
    
    //#line 17 "/home/jim/Desktop/X10/bin/Hello.x10"
    return true;
    
}

//#line 9 "/home/jim/Desktop/X10/bin/Hello.x10"
void Hello::_constructor() {
    this->x10::lang::Object::_constructor();
    
}
x10aux::ref<Hello> Hello::_make() {
    x10aux::ref<Hello> this_ = new (x10aux::alloc<Hello>()) Hello();
    this_->_constructor();
    return this_;
}


const x10aux::serialization_id_t Hello::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(Hello::_deserializer<x10::lang::Object>);

void Hello::_serialize_body(x10aux::serialization_buffer& buf) {
    x10::lang::Object::_serialize_body(buf);
    
}

void Hello::_deserialize_body(x10aux::deserialization_buffer& buf) {
    x10::lang::Object::_deserialize_body(buf);
    
}

x10aux::RuntimeType Hello::rtt;
void Hello::_initRTT() {
    rtt.canonical = &rtt;
    const x10aux::RuntimeType* parents[1] = { x10aux::getRTT<x10::lang::Object>()};
    rtt.init(&rtt, "Hello", 1, parents, 0, NULL, NULL);
}

extern "C" { const char* LNMAP__Hello_cc = "N{\"Hello.cc\"} F{0:\"/home/jim/Desktop/X10/bin/Hello.x10\",1:\"Hello\",2:\"main\",3:\"x10.lang.Void\",4:\"x10.lang.Rail[x10.lang.String]\",5:\"void\",6:\"x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > >\",7:\"myMethod\",8:\"x10.lang.Boolean{_self3644==true}\",9:\"x10_boolean\",10:\"this\",11:\"\",12:\"_constructor\",} L{33->0:15,39->0:17,20->0:11,36->0:16,24->0:12,27->0:13,41->0:18,13->0:10,44->0:9,30->0:14,} M{5 1.2(6)->3 1.2(4);5 1.12()->11 1.10();9 1.7()->8 1.7();}"; }
