#include <x10/lang/Closure.h>
#include <x10/lang/VoidFun_0_0.h>
class HelloWorld__closure__0 : public x10::lang::Closure {
    public:
    
    static x10::lang::VoidFun_0_0::itable<HelloWorld__closure__0> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    void apply() {
        
        //#line 13 "/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10"
        x10aux::nullCheck(x10::io::Console::FMGL(OUT__get)())->x10::io::Printer::println(
          x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("Hello World from place ") +
          x10aux::safe_to_string(x10::lang::Runtime::here()->
                                   FMGL(id))));
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<HelloWorld__closure__0> this_ = new (x10aux::alloc<HelloWorld__closure__0>()) HelloWorld__closure__0(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    HelloWorld__closure__0(x10aux::SERIALIZATION_MARKER) { }
    
    HelloWorld__closure__0() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10:12-14");
    }

};

x10::lang::VoidFun_0_0::itable<HelloWorld__closure__0>HelloWorld__closure__0::_itable(&HelloWorld__closure__0::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &HelloWorld__closure__0::toString, &Closure::typeName);x10aux::itable_entry HelloWorld__closure__0::_itables[2] = {x10aux::itable_entry(&x10::lang::VoidFun_0_0::rtt, &HelloWorld__closure__0::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t HelloWorld__closure__0::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(HelloWorld__closure__0::_deserialize<x10::lang::Object>);


extern "C" { const char* LNMAP__HelloWorld_inc = "N{\"HelloWorld.inc\"} F{0:\"/home/jim/Desktop/X10/bin/ConcurrentHashMap.x10\",} L{19->0:14,15->0:13,} M{}"; }
