#include <ConcurrentHashMap.h>


#include "ConcurrentHashMap.inc"

void ConcurrentHashMap::_instance_init() {
    _I_("Doing initialisation for class: ConcurrentHashMap");
    
}


//#line 10 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"

//#line 12 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
#include <x10/lang/Runtime.h>
#include <x10aux/bootstrap.h>
extern "C" { int main(int ac, char **av) { return x10aux::template_main<x10::lang::Runtime,ConcurrentHashMap>(ac,av); } }

void ConcurrentHashMap::main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > args) {
    
    //#line 13 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::ref<ConcurrentHashMap> CHMObject = ConcurrentHashMap::_make();
    
    //#line 14 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::ref<x10::lang::String> valStr = x10::lang::String::Lit("Jim");
    
    //#line 15 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::ref<x10::lang::String> keyStr = x10::lang::String::Lit("1");
    
    //#line 16 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::nullCheck(CHMObject)->put(keyStr, valStr);
    
    //#line 17 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::ref<x10::lang::String> retVal = x10aux::nullCheck(CHMObject)->get(
                                              keyStr);
    
    //#line 18 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::nullCheck(x10::io::Console::FMGL(OUT__get)())->x10::io::Printer::println(
      x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(retVal));
}

//#line 21 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
void ConcurrentHashMap::_constructor() {
    this->x10::lang::Object::_constructor();
    
    //#line 22 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    ((x10aux::ref<ConcurrentHashMap>)this)->FMGL(hMap) = x10::util::HashMap<x10aux::ref<x10::lang::String>, x10aux::ref<x10::lang::String> >::_make();
    
}
x10aux::ref<ConcurrentHashMap> ConcurrentHashMap::_make() {
    x10aux::ref<ConcurrentHashMap> this_ = new (x10aux::alloc<ConcurrentHashMap>()) ConcurrentHashMap();
    this_->_constructor();
    return this_;
}



//#line 25 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
void ConcurrentHashMap::put(x10aux::ref<x10::lang::String> keyStr,
                            x10aux::ref<x10::lang::String> valStr) {
    
    //#line 26 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    try {
    try {
        
        //#line 26 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
        x10::lang::Runtime::lock();
        {
            
            //#line 26 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
            x10aux::nullCheck(((x10aux::ref<ConcurrentHashMap>)this)->
                                FMGL(hMap))->put(keyStr, valStr);
        }
    }
    catch (x10aux::__ref& __ref__2) {
        throw;
    }
    } catch (...) {
        {
            
            //#line 26 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
            x10::lang::Runtime::release();
        }
        throw;
    }
    {
        
        //#line 26 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
        x10::lang::Runtime::release();
    }
}

//#line 29 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
x10aux::ref<x10::lang::String> ConcurrentHashMap::get(x10aux::ref<x10::lang::String> keyStr) {
    
    //#line 30 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    x10aux::ref<x10::lang::Box<x10aux::ref<x10::lang::String> > > retVal =
      x10aux::nullCheck(((x10aux::ref<ConcurrentHashMap>)this)->
                          FMGL(hMap))->get(
        keyStr);
    
    //#line 31 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
    return x10aux::nullCheck(retVal)->x10::lang::Box<x10aux::ref<x10::lang::String> >::value();
    
}
const x10aux::serialization_id_t ConcurrentHashMap::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(ConcurrentHashMap::_deserializer<x10::lang::Object>);

void ConcurrentHashMap::_serialize_body(x10aux::serialization_buffer& buf) {
    x10::lang::Object::_serialize_body(buf);
    
}

void ConcurrentHashMap::_deserialize_body(x10aux::deserialization_buffer& buf) {
    x10::lang::Object::_deserialize_body(buf);
    
}

x10aux::RuntimeType ConcurrentHashMap::rtt;
void ConcurrentHashMap::_initRTT() {
    rtt.canonical = &rtt;
    const x10aux::RuntimeType* parents[1] = { x10aux::getRTT<x10::lang::Object>()};
    rtt.init(&rtt, "ConcurrentHashMap", 1, parents, 0, NULL, NULL);
}

extern "C" { const char* LNMAP__ConcurrentHashMap_cc = "N{\"ConcurrentHashMap.cc\"} F{0:\"/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10\",1:\"ConcurrentHashMap\",2:\"main\",3:\"x10.lang.Void\",4:\"x10.lang.Rail[x10.lang.String]\",5:\"void\",6:\"x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > >\",7:\"this\",8:\"\",9:\"_constructor\",10:\"put\",11:\"x10.lang.String\",12:\"x10aux::ref<x10::lang::String>\",13:\"get\",} L{71->0:26,67->0:26,13->0:10,73->0:26,74->0:26,15->0:12,83->0:26,22->0:13,82->0:26,25->0:14,94->0:29,89->0:26,28->0:15,31->0:16,91->0:27,90->0:26,34->0:17,103->0:31,38->0:18,97->0:30,43->0:21,40->0:19,47->0:22,105->0:32,59->0:25,63->0:26,} M{5 1.10(12,12)->3 1.10(11,11);12 1.13(12)->11 1.13(11);5 1.9()->8 1.7();5 1.2(6)->3 1.2(4);}"; }
