#include <HelloWorld.h>


#include "HelloWorld.inc"

void HelloWorld::_instance_init() {
    _I_("Doing initialisation for class: HelloWorld");
    
}


//#line 11 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
#include <x10/lang/Runtime.h>
#include <x10aux/bootstrap.h>
extern "C" { int main(int ac, char **av) { return x10aux::template_main<x10::lang::Runtime,HelloWorld>(ac,av); } }

void HelloWorld::main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > args) {
    
    //#line 12 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10::lang::Runtime::runAt(x10::lang::Place_methods::next(x10::lang::Runtime::here()),
                              x10aux::class_cast_unchecked<x10aux::ref<x10::lang::VoidFun_0_0> >(x10aux::ref<x10::lang::VoidFun_0_0>(x10aux::ref<HelloWorld__closure__0>(new (x10aux::alloc<x10::lang::VoidFun_0_0>(sizeof(HelloWorld__closure__0)))HelloWorld__closure__0()))));
}

//#line 17 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
void HelloWorld::run() {
    
    //#line 18 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Integer>, x10aux::ref<x10::lang::Integer> > > hMap =
      x10::util::HashMap<x10aux::ref<x10::lang::Integer>, x10aux::ref<x10::lang::Integer> >::_make();
    
}

//#line 9 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
void HelloWorld::_constructor() {
    this->x10::lang::Object::_constructor();
    
}
x10aux::ref<HelloWorld> HelloWorld::_make() {
    x10aux::ref<HelloWorld> this_ = new (x10aux::alloc<HelloWorld>()) HelloWorld();
    this_->_constructor();
    return this_;
}


const x10aux::serialization_id_t HelloWorld::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(HelloWorld::_deserializer<x10::lang::Object>);

void HelloWorld::_serialize_body(x10aux::serialization_buffer& buf) {
    x10::lang::Object::_serialize_body(buf);
    
}

void HelloWorld::_deserialize_body(x10aux::deserialization_buffer& buf) {
    x10::lang::Object::_deserialize_body(buf);
    
}

x10aux::RuntimeType HelloWorld::rtt;
void HelloWorld::_initRTT() {
    rtt.canonical = &rtt;
    const x10aux::RuntimeType* parents[1] = { x10aux::getRTT<x10::lang::Object>()};
    rtt.init(&rtt, "HelloWorld", 1, parents, 0, NULL, NULL);
}

extern "C" { const char* LNMAP__HelloWorld_cc = "N{\"HelloWorld.cc\"} F{0:\"/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10\",1:\"HelloWorld\",2:\"main\",3:\"x10.lang.Void\",4:\"x10.lang.Rail[x10.lang.String]\",5:\"void\",6:\"x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > >\",7:\"run\",8:\"this\",9:\"\",10:\"_constructor\",} L{34->0:9,20->0:12,22->0:15,25->0:17,28->0:18,13->0:11,31->0:19,} M{5 1.2(6)->3 1.2(4);5 1.7()->3 1.7();5 1.10()->9 1.8();}"; }
