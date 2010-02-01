#ifndef __HELLOWORLD_H
#define __HELLOWORLD_H

#include <x10rt.h>

#define X10_LANG_OBJECT_H_NODEPS
#include <x10/lang/Object.h>
#undef X10_LANG_OBJECT_H_NODEPS
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
class String;
} } 
namespace x10 { namespace lang { 
class Runtime;
} } 
namespace x10 { namespace lang { 
class VoidFun_0_0;
} } 
namespace x10 { namespace io { 
class Console;
} } 
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class HashMap;
} } 
namespace x10 { namespace lang { 
class Integer;
} } 
class HelloWorld : public x10::lang::Object   {
    public:
    RTT_H_DECLS_CLASS
    
    void _instance_init();
    
    static void main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > args);
    void run();
    void _constructor();
    
    static x10aux::ref<HelloWorld> _make();
    
    
    // Serialization
    public: static const x10aux::serialization_id_t _serialization_id;
    
    public: virtual x10aux::serialization_id_t _get_serialization_id() {
         return _serialization_id;
    }
    
    public: virtual void _serialize_body(x10aux::serialization_buffer& buf);
    
    public: template<class __T> static x10aux::ref<__T> _deserializer(x10aux::deserialization_buffer& buf);
    
    public: void _deserialize_body(x10aux::deserialization_buffer& buf);
    
};
#endif // HELLOWORLD_H

class HelloWorld;

#ifndef HELLOWORLD_H_NODEPS
#define HELLOWORLD_H_NODEPS
#include <x10/lang/Object.h>
#include <x10/lang/Rail.h>
#include <x10/lang/String.h>
#include <x10/lang/Runtime.h>
#include <x10/lang/VoidFun_0_0.h>
#include <x10/io/Console.h>
#include <x10/util/HashMap.h>
#include <x10/lang/Integer.h>
#ifndef HELLOWORLD_H_GENERICS
#define HELLOWORLD_H_GENERICS
template<class __T> x10aux::ref<__T> HelloWorld::_deserializer(x10aux::deserialization_buffer& buf) {
    x10aux::ref<HelloWorld> this_ = new (x10aux::alloc_remote<HelloWorld>()) HelloWorld();
    buf.record_reference(this_);
    this_->_deserialize_body(buf);
    return this_;
}

#endif // HELLOWORLD_H_GENERICS
#endif // __HELLOWORLD_H_NODEPS
