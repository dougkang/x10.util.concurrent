#ifndef __CONCURRENTHASHMAP_H
#define __CONCURRENTHASHMAP_H

#include <x10rt.h>

#define X10_LANG_OBJECT_H_NODEPS
#include <x10/lang/Object.h>
#undef X10_LANG_OBJECT_H_NODEPS
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class HashMap;
} } 
namespace x10 { namespace lang { 
class String;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
class Runtime;
} } 
namespace x10 { namespace io { 
class Console;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class Box;
} } 
class ConcurrentHashMap : public x10::lang::Object   {
    public:
    RTT_H_DECLS_CLASS
    
    void _instance_init();
    
    x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::String>, x10aux::ref<x10::lang::String> > >
      FMGL(hMap);
    
    static void main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > args);
    void _constructor();
    
    static x10aux::ref<ConcurrentHashMap> _make();
    
    virtual void put(x10aux::ref<x10::lang::String> keyStr, x10aux::ref<x10::lang::String> valStr);
    virtual x10aux::ref<x10::lang::String> get(x10aux::ref<x10::lang::String> keyStr);
    
    // Serialization
    public: static const x10aux::serialization_id_t _serialization_id;
    
    public: virtual x10aux::serialization_id_t _get_serialization_id() {
         return _serialization_id;
    }
    
    public: virtual void _serialize_body(x10aux::serialization_buffer& buf);
    
    public: template<class __T> static x10aux::ref<__T> _deserializer(x10aux::deserialization_buffer& buf);
    
    public: void _deserialize_body(x10aux::deserialization_buffer& buf);
    
};
#endif // CONCURRENTHASHMAP_H

class ConcurrentHashMap;

#ifndef CONCURRENTHASHMAP_H_NODEPS
#define CONCURRENTHASHMAP_H_NODEPS
#include <x10/lang/Object.h>
#include <x10/util/HashMap.h>
#include <x10/lang/String.h>
#include <x10/lang/Rail.h>
#include <x10/lang/Runtime.h>
#include <x10/io/Console.h>
#include <x10/lang/Box.h>
#ifndef CONCURRENTHASHMAP_H_GENERICS
#define CONCURRENTHASHMAP_H_GENERICS
template<class __T> x10aux::ref<__T> ConcurrentHashMap::_deserializer(x10aux::deserialization_buffer& buf) {
    x10aux::ref<ConcurrentHashMap> this_ = new (x10aux::alloc_remote<ConcurrentHashMap>()) ConcurrentHashMap();
    buf.record_reference(this_);
    this_->_deserialize_body(buf);
    return this_;
}

#endif // CONCURRENTHASHMAP_H_GENERICS
#endif // __CONCURRENTHASHMAP_H_NODEPS
