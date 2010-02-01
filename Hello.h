#ifndef __HELLO_H
#define __HELLO_H

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
namespace x10 { namespace io { 
class Console;
} } 
namespace x10 { namespace lang { 
class Boolean;
} } 
#include <x10/lang/Boolean.struct_h>
class Hello : public x10::lang::Object   {
    public:
    RTT_H_DECLS_CLASS
    
    void _instance_init();
    
    static void main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > id__0);
    virtual x10_boolean myMethod();
    void _constructor();
    
    static x10aux::ref<Hello> _make();
    
    
    // Serialization
    public: static const x10aux::serialization_id_t _serialization_id;
    
    public: virtual x10aux::serialization_id_t _get_serialization_id() {
         return _serialization_id;
    }
    
    public: virtual void _serialize_body(x10aux::serialization_buffer& buf);
    
    public: template<class __T> static x10aux::ref<__T> _deserializer(x10aux::deserialization_buffer& buf);
    
    public: void _deserialize_body(x10aux::deserialization_buffer& buf);
    
};
#endif // HELLO_H

class Hello;

#ifndef HELLO_H_NODEPS
#define HELLO_H_NODEPS
#include <x10/lang/Object.h>
#include <x10/lang/Rail.h>
#include <x10/lang/String.h>
#include <x10/io/Console.h>
#include <x10/lang/Boolean.h>
#ifndef HELLO_H_GENERICS
#define HELLO_H_GENERICS
template<class __T> x10aux::ref<__T> Hello::_deserializer(x10aux::deserialization_buffer& buf) {
    x10aux::ref<Hello> this_ = new (x10aux::alloc_remote<Hello>()) Hello();
    buf.record_reference(this_);
    this_->_deserialize_body(buf);
    return this_;
}

#endif // HELLO_H_GENERICS
#endif // __HELLO_H_NODEPS
