#ifndef __DISTRIBUTEDRAIL_H
#define __DISTRIBUTEDRAIL_H

#include <x10rt.h>

#define X10_LANG_OBJECT_H_NODEPS
#include <x10/lang/Object.h>
#undef X10_LANG_OBJECT_H_NODEPS
#define X10_LANG_SETTABLE_H_NODEPS
#include <x10/lang/Settable.h>
#undef X10_LANG_SETTABLE_H_NODEPS
#define X10_LANG_ITERABLE_H_NODEPS
#include <x10/lang/Iterable.h>
#undef X10_LANG_ITERABLE_H_NODEPS
#define X10_LANG_PLACELOCALHANDLE_STRUCT_H_NODEPS
#include <x10/lang/PlaceLocalHandle.struct_h>
#undef X10_LANG_PLACELOCALHANDLE_STRUCT_H_NODEPS
#define X10_LANG_PLACE_STRUCT_H_NODEPS
#include <x10/lang/Place.struct_h>
#undef X10_LANG_PLACE_STRUCT_H_NODEPS
#define X10_LANG_PLACELOCALHANDLE_STRUCT_H_NODEPS
#include <x10/lang/PlaceLocalHandle.struct_h>
#undef X10_LANG_PLACELOCALHANDLE_STRUCT_H_NODEPS
#define X10_LANG_INT_STRUCT_H_NODEPS
#include <x10/lang/Int.struct_h>
#undef X10_LANG_INT_STRUCT_H_NODEPS
#define X10_LANG_PLACELOCALHANDLE_STRUCT_H_NODEPS
#include <x10/lang/PlaceLocalHandle.struct_h>
#undef X10_LANG_PLACELOCALHANDLE_STRUCT_H_NODEPS
namespace x10 { namespace lang { 
class Int;
} } 
#include <x10/lang/Int.struct_h>
namespace x10 { namespace lang { 
template<class FMGL(T)> class PlaceLocalHandle;
} } 
#include <x10/lang/PlaceLocalHandle.struct_h>
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
class Place;
} } 
#include <x10/lang/Place.struct_h>
namespace x10 { namespace lang { 
template<class FMGL(T)> class PlaceLocalHandle;
} } 
#include <x10/lang/PlaceLocalHandle.struct_h>
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class HashMap;
} } 
namespace x10 { namespace lang { 
class Activity;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class ValRail;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class PlaceLocalHandle;
} } 
#include <x10/lang/PlaceLocalHandle.struct_h>
namespace x10 { namespace lang { 
template<class FMGL(T)> class Cell;
} } 
namespace x10 { namespace lang { 
class Boolean;
} } 
#include <x10/lang/Boolean.struct_h>
namespace x10 { namespace lang { 
template<class FMGL(T)> class PlaceLocalHandle;
} } 
#include <x10/lang/PlaceLocalHandle.struct_h>
namespace x10 { namespace lang { 
class Dist;
} } 
namespace x10 { namespace lang { 
template<class FMGL(U)> class Fun_0_0;
} } 
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class HashMap;
} } 
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class HashMap;
} } 
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class HashMap;
} } 
namespace x10 { namespace lang { 
template<class FMGL(U)> class Fun_0_0;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class ValRail;
} } 
namespace x10 { namespace lang { 
template<class FMGL(U)> class Fun_0_0;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
class Runtime;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(U)> class Fun_0_1;
} } 
namespace x10 { namespace lang { 
template<class FMGL(U)> class Fun_0_0;
} } 
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class HashMap;
} } 
namespace x10 { namespace lang { 
template<class FMGL(U)> class Fun_0_0;
} } 
namespace x10 { namespace lang { 
template<class FMGL(U)> class Fun_0_0;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class ValRail;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class Iterator;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(U)> class Fun_0_1;
} } 
namespace x10 { namespace lang { 
class ClassCastException;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(Z2), class FMGL(U)> class Fun_0_2;
} } 
namespace x10 { namespace util { 
template<class FMGL(Key), class FMGL(Val)> class Map__Entry;
} } 
namespace x10 { namespace util { 
template<class FMGL(K), class FMGL(V)> class Map;
} } 
namespace x10 { namespace lang { 
class Throwable;
} } 
namespace x10 { namespace lang { 
class VoidFun_0_0;
} } 
namespace x10 { namespace lang { 
template<class FMGL(U)> class Fun_0_0;
} } 
namespace x10 { namespace util { 
template<class FMGL(T), class FMGL(U)> class Pair;
} } 
#include <x10/util/Pair.struct_h>
namespace x10 { namespace util { 
template<class FMGL(Key), class FMGL(Val)> class Map__Entry;
} } 
template<class FMGL(T)> class DistributedRail;
template <> class DistributedRail<void>;
template<class FMGL(T)> class DistributedRail : public x10::lang::Object 
 {
    public:
    RTT_H_DECLS_CLASS
    
    static x10aux::itable_entry _itables[4];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    static typename x10::lang::Settable<x10_int, FMGL(T)>::template itable<DistributedRail<FMGL(T)> > _itable_0;
    
    static x10::lang::Any::itable<DistributedRail<FMGL(T)> > _itable_1;
    
    static typename x10::lang::Iterable<FMGL(T)>::template itable<DistributedRail<FMGL(T)> > _itable_2;
    
    void _instance_init();
    
    x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > >
      FMGL(data);
    
    x10::lang::Place
      FMGL(firstPlace);
    
    x10::lang::PlaceLocalHandle<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >
      FMGL(localRails);
    
    x10aux::ref<x10::lang::ValRail<FMGL(T) > >
      FMGL(original);
    
    x10_int
      FMGL(original_len);
    
    x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Cell<x10_boolean> > >
      FMGL(done);
    
    void _constructor(
      x10_int len,
      x10aux::ref<x10::lang::ValRail<FMGL(T) > > init);
    
    static x10aux::ref<DistributedRail<FMGL(T)> > _make(
             x10_int len,
             x10aux::ref<x10::lang::ValRail<FMGL(T) > > init);
    
    void _constructor(
      x10_int len,
      x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > init);
    
    static x10aux::ref<DistributedRail<FMGL(T)> > _make(
             x10_int len,
             x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > init);
    
    virtual x10aux::ref<x10::lang::Rail<FMGL(T) > >
      apply(
      );
    virtual x10aux::ref<x10::lang::Rail<FMGL(T) > >
      get(
      );
    virtual void
      drop(
      );
    virtual FMGL(T)
      apply(
      x10_int i);
    virtual FMGL(T)
      set(
      FMGL(T) v,
      x10_int i);
    virtual x10aux::ref<x10::lang::Iterator<FMGL(T)> >
      iterator(
      );
    void
      reduceLocal(
      x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op);
    void
      reduceGlobal(
      x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op);
    void
      bcastLocal(
      x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op);
    virtual void
      collectiveReduce(
      x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op);
    
    // Serialization
    public: static const x10aux::serialization_id_t _serialization_id;
    
    public: static void _serialize(x10aux::ref<DistributedRail<FMGL(T)> > this_,
                                   x10aux::serialization_buffer& buf);
    
    public: x10aux::serialization_id_t _get_serialization_id() {
         return _serialization_id;
    }
    
    public: void _serialize_body(x10aux::serialization_buffer& buf);
    
    public: template<class __T> static x10aux::ref<__T> _deserializer(x10aux::deserialization_buffer& buf);
    
    public: template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer& buf);
    
    public: void _deserialize_body(x10aux::deserialization_buffer& buf);
    
};
template <> class DistributedRail<void> : public x10::lang::Object
{
    public:
    static x10aux::RuntimeType rtt;
    static const x10aux::RuntimeType* getRTT() { return & rtt; }
    template<class FMGL(S)>
    static x10aux::ref<x10::lang::ValRail<FMGL(S) > >
      __implicit_convert(
      x10aux::ref<DistributedRail<FMGL(S)> > x);
    
    template<class FMGL(T)>
    static FMGL(T)
      placeCastHack(
      FMGL(T) x);
    
    
};
#endif // DISTRIBUTEDRAIL_H

template<class FMGL(T)>
class DistributedRail;

#ifndef DISTRIBUTEDRAIL_H_NODEPS
#define DISTRIBUTEDRAIL_H_NODEPS
#include <x10/lang/Object.h>
#include <x10/lang/Settable.h>
#include <x10/lang/Iterable.h>
#include <x10/lang/Int.h>
#include <x10/lang/PlaceLocalHandle.h>
#include <x10/lang/Rail.h>
#include <x10/lang/Place.h>
#include <x10/lang/PlaceLocalHandle.h>
#include <x10/util/HashMap.h>
#include <x10/lang/Activity.h>
#include <x10/lang/ValRail.h>
#include <x10/lang/PlaceLocalHandle.h>
#include <x10/lang/Cell.h>
#include <x10/lang/Boolean.h>
#include <x10/lang/PlaceLocalHandle.h>
#include <x10/lang/Dist.h>
#include <x10/lang/Fun_0_0.h>
#include <x10/util/HashMap.h>
#include <x10/util/HashMap.h>
#include <x10/util/HashMap.h>
#include <x10/lang/Fun_0_0.h>
#include <x10/lang/ValRail.h>
#include <x10/lang/Fun_0_0.h>
#include <x10/lang/Rail.h>
#include <x10/lang/Runtime.h>
#include <x10/lang/Fun_0_1.h>
#include <x10/lang/Fun_0_0.h>
#include <x10/util/HashMap.h>
#include <x10/lang/Fun_0_0.h>
#include <x10/lang/Fun_0_0.h>
#include <x10/lang/ValRail.h>
#include <x10/lang/Iterator.h>
#include <x10/lang/Fun_0_1.h>
#include <x10/lang/ClassCastException.h>
#include <x10/lang/Fun_0_2.h>
#include <x10/util/Map__Entry.h>
#include <x10/util/Map.h>
#include <x10/lang/Throwable.h>
#include <x10/lang/VoidFun_0_0.h>
#include <x10/lang/Fun_0_0.h>
#include <x10/util/Pair.h>
#include <x10/util/Map__Entry.h>
#ifndef DISTRIBUTEDRAIL__CLOSURE__7_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__7_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__7 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> >::template itable <DistributedRail__closure__7<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> apply() {
        
        //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10::util::Pair_methods<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int>::_make(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::apply(handle),
                                                                                                ((x10_int)0));
        
    }
    
    // captured environment
    x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > handle;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->handle);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__7<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__7<FMGL(T) > >()) DistributedRail__closure__7<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->handle = buf.read<x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >();
        return this_;
    }
    
    DistributedRail__closure__7(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__7(x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > handle) {
        this->handle = handle;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> > >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> > >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:102");
    }

};

template<class FMGL(T)> typename x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> >::template itable <DistributedRail__closure__7<FMGL(T) > >DistributedRail__closure__7<FMGL(T) >::_itable(&DistributedRail__closure__7<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__7<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__7<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> >::rtt, &DistributedRail__closure__7<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__7<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__7<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__7_CLOSURE
#ifndef DISTRIBUTEDRAIL__CLOSURE__6_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__6_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/VoidFun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__6 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::VoidFun_0_0::template itable <DistributedRail__closure__6<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    void apply() {
        
        //#line 94 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<FMGL(T) > > master = x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::apply(data_);
        
        //#line 95 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        try {
        try {
            
            //#line 95 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::lock();
            {
                
                //#line 95 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                {
                    x10_int i;
                    for (
                         //#line 95 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                         i = ((x10_int)0); ((i) < (x10aux::nullCheck(master)->
                                                     FMGL(length))); 
                                                                     //#line 95 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                                                     i +=
                                                                       ((x10_int)1))
                    {
                        
                        //#line 96 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        (*master)[i] = (((x10::lang::Reference*)(((x10aux::ref<x10::lang::Reference>)x10aux::placeCheck(x10aux::nullCheck(op))).operator->()))->*(x10aux::findITable<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> >(((x10aux::ref<x10::lang::Reference>)op)->_getITables())->apply))(
                          (*master)[i],
                          (*local)[i]);
                    }
                }
                
            }
        }
        catch (x10aux::__ref& __ref__9) {
            throw;
        }
        } catch (...) {
            {
                
                //#line 95 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10::lang::Runtime::release();
            }
            throw;
        }
        {
            
            //#line 95 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::release();
        }
    }
    
    // captured environment
    x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > data_;
    x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op;
    x10aux::ref<x10::lang::ValRail<FMGL(T) > > local;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->data_);
        buf.write(this->op);
        buf.write(this->local);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__6<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__6<FMGL(T) > >()) DistributedRail__closure__6<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->data_ = buf.read<x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >();
        this_->op = buf.read<x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > >();
        this_->local = buf.read<x10aux::ref<x10::lang::ValRail<FMGL(T) > > >();
        return this_;
    }
    
    DistributedRail__closure__6(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__6(x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > data_, x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op, x10aux::ref<x10::lang::ValRail<FMGL(T) > > local) {
        this->data_ = data_;
        this->op = op;
        this->local = local;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:93-98");
    }

};

template<class FMGL(T)> typename x10::lang::VoidFun_0_0::template itable <DistributedRail__closure__6<FMGL(T) > >DistributedRail__closure__6<FMGL(T) >::_itable(&DistributedRail__closure__6<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__6<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__6<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::VoidFun_0_0::rtt, &DistributedRail__closure__6<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__6<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__6<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__6_CLOSURE
#ifndef DISTRIBUTEDRAIL__CLOSURE__5_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__5_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__5 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::template itable <DistributedRail__closure__5<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10aux::ref<x10::lang::Rail<FMGL(T) > > apply() {
        
        //#line 38 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10::lang::Rail<FMGL(T) >::make(len, x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > >(vr));
        
    }
    
    // captured environment
    x10_int len;
    x10aux::ref<x10::lang::ValRail<FMGL(T) > > vr;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->len);
        buf.write(this->vr);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__5<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__5<FMGL(T) > >()) DistributedRail__closure__5<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->len = buf.read<x10_int>();
        this_->vr = buf.read<x10aux::ref<x10::lang::ValRail<FMGL(T) > > >();
        return this_;
    }
    
    DistributedRail__closure__5(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__5(x10_int len, x10aux::ref<x10::lang::ValRail<FMGL(T) > > vr) {
        this->len = len;
        this->vr = vr;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:38");
    }

};

template<class FMGL(T)> typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::template itable <DistributedRail__closure__5<FMGL(T) > >DistributedRail__closure__5<FMGL(T) >::_itable(&DistributedRail__closure__5<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__5<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__5<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::rtt, &DistributedRail__closure__5<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__5<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__5<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__5_CLOSURE
#ifndef DISTRIBUTEDRAIL__CLOSURE__4_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__4_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__4 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > >::template itable <DistributedRail__closure__4<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10aux::ref<x10::lang::Cell<x10_boolean> > apply() {
        
        //#line 26 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10::lang::Cell<x10_boolean>::_make(false);
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__4<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__4<FMGL(T) > >()) DistributedRail__closure__4<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    DistributedRail__closure__4(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__4() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:26");
    }

};

template<class FMGL(T)> typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > >::template itable <DistributedRail__closure__4<FMGL(T) > >DistributedRail__closure__4<FMGL(T) >::_itable(&DistributedRail__closure__4<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__4<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__4<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > >::rtt, &DistributedRail__closure__4<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__4<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__4<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__4_CLOSURE
#ifndef DISTRIBUTEDRAIL__CLOSURE__3_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__3_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__3 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::template itable <DistributedRail__closure__3<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > apply() {
        
        //#line 22 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > >::_make();
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__3<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__3<FMGL(T) > >()) DistributedRail__closure__3<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    DistributedRail__closure__3(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__3() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:22");
    }

};

template<class FMGL(T)> typename x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::template itable <DistributedRail__closure__3<FMGL(T) > >DistributedRail__closure__3<FMGL(T) >::_itable(&DistributedRail__closure__3<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__3<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__3<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::rtt, &DistributedRail__closure__3<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__3<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__3<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__3_CLOSURE
#ifndef DISTRIBUTEDRAIL__CLOSURE__2_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__2_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__2 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::template itable <DistributedRail__closure__2<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10aux::ref<x10::lang::Rail<FMGL(T) > > apply() {
        
        //#line 30 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10::lang::Rail<FMGL(T) >::make(len, x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > >(vr));
        
    }
    
    // captured environment
    x10_int len;
    x10aux::ref<x10::lang::ValRail<FMGL(T) > > vr;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->len);
        buf.write(this->vr);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__2<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__2<FMGL(T) > >()) DistributedRail__closure__2<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->len = buf.read<x10_int>();
        this_->vr = buf.read<x10aux::ref<x10::lang::ValRail<FMGL(T) > > >();
        return this_;
    }
    
    DistributedRail__closure__2(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__2(x10_int len, x10aux::ref<x10::lang::ValRail<FMGL(T) > > vr) {
        this->len = len;
        this->vr = vr;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:30");
    }

};

template<class FMGL(T)> typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::template itable <DistributedRail__closure__2<FMGL(T) > >DistributedRail__closure__2<FMGL(T) >::_itable(&DistributedRail__closure__2<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__2<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__2<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::rtt, &DistributedRail__closure__2<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__2<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__2<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__2_CLOSURE
#ifndef DISTRIBUTEDRAIL__CLOSURE__1_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__1_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__1 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > >::template itable <DistributedRail__closure__1<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10aux::ref<x10::lang::Cell<x10_boolean> > apply() {
        
        //#line 26 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10::lang::Cell<x10_boolean>::_make(false);
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__1<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__1<FMGL(T) > >()) DistributedRail__closure__1<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    DistributedRail__closure__1(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__1() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:26");
    }

};

template<class FMGL(T)> typename x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > >::template itable <DistributedRail__closure__1<FMGL(T) > >DistributedRail__closure__1<FMGL(T) >::_itable(&DistributedRail__closure__1<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__1<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__1<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > >::rtt, &DistributedRail__closure__1<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__1<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__1<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__1_CLOSURE
#ifndef DISTRIBUTEDRAIL__CLOSURE__0_CLOSURE
#define DISTRIBUTEDRAIL__CLOSURE__0_CLOSURE
#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_0.h>
template<class FMGL(T)> class DistributedRail__closure__0 : public x10::lang::Closure {
    public:
    
    static typename x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::template itable <DistributedRail__closure__0<FMGL(T) > > _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > apply() {
        
        //#line 22 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > >::_make();
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<DistributedRail__closure__0<FMGL(T) > > this_ = new (x10aux::alloc<DistributedRail__closure__0<FMGL(T) > >()) DistributedRail__closure__0<FMGL(T) >(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    DistributedRail__closure__0(x10aux::SERIALIZATION_MARKER) { }
    
    DistributedRail__closure__0() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:22");
    }

};

template<class FMGL(T)> typename x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::template itable <DistributedRail__closure__0<FMGL(T) > >DistributedRail__closure__0<FMGL(T) >::_itable(&DistributedRail__closure__0<FMGL(T) >::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &DistributedRail__closure__0<FMGL(T) >::toString, &Closure::typeName);template<class FMGL(T)>
x10aux::itable_entry DistributedRail__closure__0<FMGL(T) >::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::rtt, &DistributedRail__closure__0<FMGL(T) >::_itable),x10aux::itable_entry(NULL, NULL)};
template<class FMGL(T)>
const x10aux::serialization_id_t DistributedRail__closure__0<FMGL(T) >::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail__closure__0<FMGL(T) >::template _deserialize<x10::lang::Object>);

#endif // DISTRIBUTEDRAIL__CLOSURE__0_CLOSURE
#ifndef DISTRIBUTEDRAIL_H_GENERICS
#define DISTRIBUTEDRAIL_H_GENERICS
template<class FMGL(T)> template<class __T> x10aux::ref<__T> DistributedRail<FMGL(T)>::_deserializer(x10aux::deserialization_buffer& buf) {
    x10aux::ref<DistributedRail<FMGL(T)> > this_ = new (x10aux::alloc_remote<DistributedRail<FMGL(T)> >()) DistributedRail<FMGL(T)>();
    buf.record_reference(this_);
    this_->_deserialize_body(buf);
    return this_;
}

template<class FMGL(T)> template<class __T> x10aux::ref<__T> DistributedRail<FMGL(T)>::_deserialize(x10aux::deserialization_buffer& buf) {
    x10::lang::Object::_reference_state rr = x10::lang::Object::_deserialize_reference_state(buf);
    x10aux::ref<DistributedRail<FMGL(T)> > this_;
    if (rr.ref != 0) {
        this_ = DistributedRail<FMGL(T)>::template _deserializer<DistributedRail<FMGL(T)> >(buf);
    }
    return x10::lang::Object::_finalize_reference<__T>(this_, rr);
}

#endif // DISTRIBUTEDRAIL_H_GENERICS
#ifndef DISTRIBUTEDRAIL_H_IMPLEMENTATION
#define DISTRIBUTEDRAIL_H_IMPLEMENTATION
#include <DistributedRail.h>


#include "DistributedRail.inc"

template<class FMGL(T)> typename x10::lang::Settable<x10_int, FMGL(T)>::template itable<DistributedRail<FMGL(T)> >  DistributedRail<FMGL(T)>::_itable_0(&DistributedRail<FMGL(T)>::at, &DistributedRail<FMGL(T)>::at, &DistributedRail<FMGL(T)>::equals, &DistributedRail<FMGL(T)>::hashCode, &DistributedRail<FMGL(T)>::home, &DistributedRail<FMGL(T)>::set, &DistributedRail<FMGL(T)>::toString, &DistributedRail<FMGL(T)>::typeName);
template<class FMGL(T)> x10::lang::Any::itable<DistributedRail<FMGL(T)> >  DistributedRail<FMGL(T)>::_itable_1(&DistributedRail<FMGL(T)>::at, &DistributedRail<FMGL(T)>::at, &DistributedRail<FMGL(T)>::equals, &DistributedRail<FMGL(T)>::hashCode, &DistributedRail<FMGL(T)>::home, &DistributedRail<FMGL(T)>::toString, &DistributedRail<FMGL(T)>::typeName);
template<class FMGL(T)> typename x10::lang::Iterable<FMGL(T)>::template itable<DistributedRail<FMGL(T)> >  DistributedRail<FMGL(T)>::_itable_2(&DistributedRail<FMGL(T)>::at, &DistributedRail<FMGL(T)>::at, &DistributedRail<FMGL(T)>::equals, &DistributedRail<FMGL(T)>::hashCode, &DistributedRail<FMGL(T)>::home, &DistributedRail<FMGL(T)>::iterator, &DistributedRail<FMGL(T)>::toString, &DistributedRail<FMGL(T)>::typeName);
template<class FMGL(T)> x10aux::itable_entry DistributedRail<FMGL(T)>::_itables[4] = {x10aux::itable_entry(x10aux::getRTT<x10::lang::Settable<x10_int, FMGL(T)> >(), &_itable_0), x10aux::itable_entry(x10aux::getRTT<x10::lang::Any>(), &_itable_1), x10aux::itable_entry(x10aux::getRTT<x10::lang::Iterable<FMGL(T)> >(), &_itable_2), x10aux::itable_entry(NULL, (void*)x10aux::getRTT<DistributedRail<FMGL(T)> >())};
template<class FMGL(T)> void DistributedRail<FMGL(T)>::_instance_init() {
    _I_("Doing initialisation for class: DistributedRail<FMGL(T)>");
    
}


//#line 20 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 21 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 22 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 23 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 24 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 26 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 28 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> void DistributedRail<FMGL(T)>::_constructor(x10_int len,
                                                                    x10aux::ref<x10::lang::ValRail<FMGL(T) > > init)
{
    this->x10::lang::Object::_constructor();
    
    //#line 22 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(localRails) =
      x10::lang::PlaceLocalHandle_methods<void>::make<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >(
        x10::lang::Dist::makeUnique(),
        x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > > >(x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(x10aux::ref<DistributedRail__closure__0<FMGL(T) > >(new (x10aux::alloc<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(sizeof(DistributedRail__closure__0<FMGL(T)>)))DistributedRail__closure__0<FMGL(T)>()))));
    
    //#line 26 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(done) =
      x10::lang::PlaceLocalHandle_methods<void>::make<x10aux::ref<x10::lang::Cell<x10_boolean> > >(
        x10::lang::Dist::makeUnique(),
        x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > > >(x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(x10aux::ref<DistributedRail__closure__1<FMGL(T) > >(new (x10aux::alloc<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(sizeof(DistributedRail__closure__1<FMGL(T)>)))DistributedRail__closure__1<FMGL(T)>()))));
    
    //#line 29 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10aux::ref<x10::lang::ValRail<FMGL(T) > > vr =
      x10::lang::ValRail<FMGL(T) >::make(len, x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > >(init));
    
    //#line 30 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(data) =
      x10::lang::PlaceLocalHandle_methods<void>::make<x10aux::ref<x10::lang::Rail<FMGL(T) > > >(
        x10::lang::Dist::makeUnique(),
        x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >(x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(x10aux::ref<DistributedRail__closure__2<FMGL(T) > >(new (x10aux::alloc<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(sizeof(DistributedRail__closure__2<FMGL(T)>)))DistributedRail__closure__2<FMGL(T)>(len, vr)))));
    
    //#line 31 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(firstPlace) =
      x10::lang::Runtime::here();
    
    //#line 32 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(original) =
      vr;
    
    //#line 33 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(original_len) =
      len;
    
}
template<class FMGL(T)>
x10aux::ref<DistributedRail<FMGL(T)> > DistributedRail<FMGL(T)>::_make(
  x10_int len,
  x10aux::ref<x10::lang::ValRail<FMGL(T) > > init)
{
    x10aux::ref<DistributedRail<FMGL(T)> > this_ = new (x10aux::alloc<DistributedRail<FMGL(T)> >()) DistributedRail<FMGL(T)>();
    this_->_constructor(len,
    init);
    return this_;
}



//#line 36 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> void DistributedRail<FMGL(T)>::_constructor(
                          x10_int len,
                          x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > init)
{
    this->x10::lang::Object::_constructor();
    
    //#line 22 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(localRails) =
      x10::lang::PlaceLocalHandle_methods<void>::make<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >(
        x10::lang::Dist::makeUnique(),
        x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > > >(x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(x10aux::ref<DistributedRail__closure__3<FMGL(T) > >(new (x10aux::alloc<x10::lang::Fun_0_0<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(sizeof(DistributedRail__closure__3<FMGL(T)>)))DistributedRail__closure__3<FMGL(T)>()))));
    
    //#line 26 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(done) =
      x10::lang::PlaceLocalHandle_methods<void>::make<x10aux::ref<x10::lang::Cell<x10_boolean> > >(
        x10::lang::Dist::makeUnique(),
        x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > > >(x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(x10aux::ref<DistributedRail__closure__4<FMGL(T) > >(new (x10aux::alloc<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Cell<x10_boolean> > > >(sizeof(DistributedRail__closure__4<FMGL(T)>)))DistributedRail__closure__4<FMGL(T)>()))));
    
    //#line 37 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10aux::ref<x10::lang::ValRail<FMGL(T) > > vr =
      x10::lang::ValRail<FMGL(T) >::make(len, init);
    
    //#line 38 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(data) =
      x10::lang::PlaceLocalHandle_methods<void>::make<x10aux::ref<x10::lang::Rail<FMGL(T) > > >(
        x10::lang::Dist::makeUnique(),
        x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >(x10aux::ref<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(x10aux::ref<DistributedRail__closure__5<FMGL(T) > >(new (x10aux::alloc<x10::lang::Fun_0_0<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(sizeof(DistributedRail__closure__5<FMGL(T)>)))DistributedRail__closure__5<FMGL(T)>(len, vr)))));
    
    //#line 39 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(firstPlace) =
      x10::lang::Runtime::here();
    
    //#line 40 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(original) =
      vr;
    
    //#line 41 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
      FMGL(original_len) =
      len;
    
}
template<class FMGL(T)>
x10aux::ref<DistributedRail<FMGL(T)> > DistributedRail<FMGL(T)>::_make(
  x10_int len,
  x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > init)
{
    x10aux::ref<DistributedRail<FMGL(T)> > this_ = new (x10aux::alloc<DistributedRail<FMGL(T)> >()) DistributedRail<FMGL(T)>();
    this_->_constructor(len,
    init);
    return this_;
}



//#line 44 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 46 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> x10aux::ref<x10::lang::Rail<FMGL(T) > >
  DistributedRail<FMGL(T)>::apply(
  ) {
    
    //#line 47 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10aux::ref<x10::lang::Activity> a = x10::lang::Runtime::activity();
    
    //#line 48 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10aux::ref<x10::lang::Rail<FMGL(T) > > r =
      x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                                                                                    FMGL(localRails)))->getOrElse(
        a,
        x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Rail<FMGL(T) > > >(x10aux::null));
    
    //#line 49 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    if ((x10aux::struct_equals(r, x10aux::null)))
    {
        
        //#line 50 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<FMGL(T) > > r_ =
          x10::lang::Rail<FMGL(T) >::make(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                            FMGL(original_len), x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, FMGL(T)> > >(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                                                    FMGL(original)));
        
        //#line 51 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                                                                                      FMGL(localRails)))->put(
          a,
          r_);
        
        //#line 52 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return r_;
        
    }
    
    //#line 54 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return r;
    
}

//#line 57 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> x10aux::ref<x10::lang::Rail<FMGL(T) > >
  DistributedRail<FMGL(T)>::get(
  ) {
    
    //#line 57 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                  FMGL(data));
    
}

//#line 59 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> void DistributedRail<FMGL(T)>::drop(
  ) {
    
    //#line 59 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                                                                                  FMGL(localRails)))->remove(
      x10::lang::Runtime::activity());
}

//#line 61 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> FMGL(T) DistributedRail<FMGL(T)>::apply(
  x10_int i) {
    
    //#line 61 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return (*((x10aux::ref<DistributedRail<FMGL(T)> >)this)->DistributedRail<FMGL(T)>::apply())[i];
    
}

//#line 63 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> FMGL(T) DistributedRail<FMGL(T)>::set(
  FMGL(T) v,
  x10_int i) {
    
    //#line 63 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return (*((x10aux::ref<DistributedRail<FMGL(T)> >)this)->DistributedRail<FMGL(T)>::apply())[i] = v;
    
}

//#line 65 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> x10aux::ref<x10::lang::Iterator<FMGL(T)> >
  DistributedRail<FMGL(T)>::iterator(
  ) {
    
    //#line 65 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return (((x10aux::ref<DistributedRail<FMGL(T)> >)this)->DistributedRail<FMGL(T)>::apply())->iterator();
    
}

//#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"

//#line 71 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> void DistributedRail<FMGL(T)>::reduceLocal(
  x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op) {
    
    //#line 72 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10aux::ref<x10::lang::Rail<FMGL(T) > > master =
      x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                             FMGL(data));
    
    //#line 73 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10_boolean first = true;
    
    //#line 74 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    {
        x10aux::ref<x10::lang::Reference> __ie = x10aux::ref<x10::lang::Iterator<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >((__extension__ ({ x10aux::ref<x10::lang::Reference> _ = x10aux::nullCheck(x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                                                                                                                                                                                                                                                                                                                                                             FMGL(localRails)))->entries());
        (((x10::lang::Reference*)(_.operator->()))->*(x10aux::findITable<x10::lang::Iterable<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(_->_getITables())->iterator))(); })));
        typename x10::lang::Iterator<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::template itable<x10::lang::Reference> *__ie_itable = x10aux::findITable<x10::lang::Iterator<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(__ie->_getITables());
        for (;
               (((x10::lang::Reference*)(__ie.operator->()))->*(__ie_itable->hasNext))();
               ) {
            x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > e;
            e = (((x10::lang::Reference*)(__ie.operator->()))->*(__ie_itable->next))();
            {
                
                //#line 75 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::ref<x10::lang::Rail<FMGL(T) > > r =
                  (__extension__ ({ x10aux::ref<x10::lang::Reference> _ = x10aux::nullCheck(DistributedRail<void>::placeCastHack<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >(
                                                                                              e));
                  (((x10::lang::Reference*)(_.operator->()))->*(x10aux::findITable<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(_->_getITables())->getValue))(); }));
                
                //#line 76 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                if (first)
                {
                    
                    //#line 77 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    try {
                    try {
                        
                        //#line 77 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10::lang::Runtime::startFinish();
                        {
                            
                            //#line 77 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            (r)->copyTo(((x10_int)0),master,((x10_int)0),x10aux::nullCheck(r)->
                                                                           FMGL(length));
                        }
                    }
                    catch (x10aux::__ref& __ref__7) {
                        x10aux::ref<x10::lang::Throwable>& __exc__ref__7 = (x10aux::ref<x10::lang::Throwable>&)__ref__7;
                        
                        //#line 77 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        if (x10aux::instanceof<x10aux::ref<x10::lang::Throwable> >(__exc__ref__7)) {
                            x10aux::ref<x10::lang::Throwable> __desugarer__var__1__ =
                              static_cast<x10aux::ref<x10::lang::Throwable> >(__exc__ref__7);
                            {
                                
                                //#line 77 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10::lang::Runtime::pushException(
                                  __desugarer__var__1__);
                            }
                        } else
                        throw;
                    }
                    } catch (...) {
                        {
                            
                            //#line 77 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            x10::lang::Runtime::stopFinish();
                        }
                        throw;
                    }
                    {
                        
                        //#line 77 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10::lang::Runtime::stopFinish();
                    }
                    
                    //#line 78 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    first =
                      false;
                }
                else
                {
                    
                    //#line 80 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    {
                        x10_int i;
                        for (
                             //#line 80 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                             i =
                               ((x10_int)0);
                             ((i) < (x10aux::nullCheck(master)->
                                       FMGL(length)));
                             
                             //#line 80 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                             i +=
                               ((x10_int)1))
                        {
                            
                            //#line 81 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            (*master)[i] = (((x10::lang::Reference*)(((x10aux::ref<x10::lang::Reference>)x10aux::placeCheck(x10aux::nullCheck(op))).operator->()))->*(x10aux::findITable<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> >(((x10aux::ref<x10::lang::Reference>)op)->_getITables())->apply))(
                              (*master)[i],
                              (*r)[i]);
                        }
                    }
                    
                }
                
            }
        }
    }
    
}

//#line 87 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> void DistributedRail<FMGL(T)>::reduceGlobal(
  x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op) {
    
    //#line 88 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    if ((!x10aux::struct_equals(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                  FMGL(firstPlace),
                                x10::lang::Runtime::here())))
    {
        
        //#line 89 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<FMGL(T) > > local_ =
          x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                 FMGL(data));
        {
            
            //#line 91 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10aux::ref<x10::lang::ValRail<FMGL(T) > > local =
              x10::lang::ValRail<FMGL(T) >::make(local_);
            
            //#line 92 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > data_ =
              ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                FMGL(data);
            
            //#line 93 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::runAt(
              ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                FMGL(firstPlace),
              x10aux::class_cast_unchecked<x10aux::ref<x10::lang::VoidFun_0_0> >(x10aux::ref<x10::lang::VoidFun_0_0>(x10aux::ref<DistributedRail__closure__6<FMGL(T) > >(new (x10aux::alloc<x10::lang::VoidFun_0_0>(sizeof(DistributedRail__closure__6<FMGL(T)>)))DistributedRail__closure__6<FMGL(T)>(data_, op, local)))));
        }
        
        //#line 101 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > handle =
          ((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
            FMGL(data);
        
        //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        try {
        try {
            
            //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::startFinish();
            {
                
                //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                (local_)->copyFrom(((x10_int)0),((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                  FMGL(firstPlace),x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> > > >(x10aux::ref<x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> > >(x10aux::ref<DistributedRail__closure__7<FMGL(T) > >(new (x10aux::alloc<x10::lang::Fun_0_0<x10::util::Pair<x10aux::ref<x10::lang::Rail<FMGL(T) > >, x10_int> > >(sizeof(DistributedRail__closure__7<FMGL(T)>)))DistributedRail__closure__7<FMGL(T)>(handle)))),x10aux::nullCheck(local_)->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            FMGL(length));
            }
        }
        catch (x10aux::__ref& __ref__10) {
            x10aux::ref<x10::lang::Throwable>& __exc__ref__10 = (x10aux::ref<x10::lang::Throwable>&)__ref__10;
            
            //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            if (x10aux::instanceof<x10aux::ref<x10::lang::Throwable> >(__exc__ref__10)) {
                x10aux::ref<x10::lang::Throwable> __desugarer__var__2__ =
                  static_cast<x10aux::ref<x10::lang::Throwable> >(__exc__ref__10);
                {
                    
                    //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::pushException(
                      __desugarer__var__2__);
                }
            } else
            throw;
        }
        } catch (...) {
            {
                
                //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10::lang::Runtime::stopFinish();
            }
            throw;
        }
        {
            
            //#line 102 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::stopFinish();
        }
    }
    else
    {
     
    }
    
}

//#line 108 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> void DistributedRail<FMGL(T)>::bcastLocal(
  x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op) {
    
    //#line 109 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10aux::ref<x10::lang::Rail<FMGL(T) > > master =
      x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Rail<FMGL(T) > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                             FMGL(data));
    
    //#line 110 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    {
        x10aux::ref<x10::lang::Reference> __ie = x10aux::ref<x10::lang::Iterator<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >((__extension__ ({ x10aux::ref<x10::lang::Reference> _ = x10aux::nullCheck(x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                                                                                                                                                                                                                                                                                                                                                             FMGL(localRails)))->entries());
        (((x10::lang::Reference*)(_.operator->()))->*(x10aux::findITable<x10::lang::Iterable<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(_->_getITables())->iterator))(); })));
        typename x10::lang::Iterator<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >::template itable<x10::lang::Reference> *__ie_itable = x10aux::findITable<x10::lang::Iterator<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >(__ie->_getITables());
        for (;
               (((x10::lang::Reference*)(__ie.operator->()))->*(__ie_itable->hasNext))();
               ) {
            x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > e;
            e = (((x10::lang::Reference*)(__ie.operator->()))->*(__ie_itable->next))();
            {
                
                //#line 111 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::ref<x10::lang::Rail<FMGL(T) > > r =
                  (__extension__ ({ x10aux::ref<x10::lang::Reference> _ = x10aux::nullCheck(DistributedRail<void>::placeCastHack<x10aux::ref<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > >(
                                                                                              e));
                  (((x10::lang::Reference*)(_.operator->()))->*(x10aux::findITable<x10::util::Map__Entry<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > >(_->_getITables())->getValue))(); }));
                
                //#line 112 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                try {
                try {
                    
                    //#line 112 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::startFinish();
                    {
                        
                        //#line 112 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        (r)->copyFrom(((x10_int)0),master,((x10_int)0),x10aux::nullCheck(r)->
                                                                         FMGL(length));
                    }
                }
                catch (x10aux::__ref& __ref__12) {
                    x10aux::ref<x10::lang::Throwable>& __exc__ref__12 = (x10aux::ref<x10::lang::Throwable>&)__ref__12;
                    
                    //#line 112 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    if (x10aux::instanceof<x10aux::ref<x10::lang::Throwable> >(__exc__ref__12)) {
                        x10aux::ref<x10::lang::Throwable> __desugarer__var__3__ =
                          static_cast<x10aux::ref<x10::lang::Throwable> >(__exc__ref__12);
                        {
                            
                            //#line 112 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            x10::lang::Runtime::pushException(
                              __desugarer__var__3__);
                        }
                    } else
                    throw;
                }
                } catch (...) {
                    {
                        
                        //#line 112 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10::lang::Runtime::stopFinish();
                    }
                    throw;
                }
                {
                    
                    //#line 112 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::stopFinish();
                }
            }
        }
    }
    
}

//#line 117 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
template<class FMGL(T)> void DistributedRail<FMGL(T)>::collectiveReduce(
  x10aux::ref<x10::lang::Fun_0_2<FMGL(T), FMGL(T), FMGL(T)> > op) {
    
    //#line 118 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    x10_boolean i_won = false;
    
    //#line 119 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    try {
    try {
        
        //#line 119 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10::lang::Runtime::lock();
        {
            
            //#line 120 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            if (!(x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Cell<x10_boolean> > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                              FMGL(done)))->
                    FMGL(value))) {
                
                //#line 121 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                i_won = true;
                
                //#line 122 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Cell<x10_boolean> > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                            FMGL(done)))->
                  FMGL(value) = true;
            }
            
        }
    }
    catch (x10aux::__ref& __ref__14) {
        throw;
    }
    } catch (...) {
        {
            
            //#line 119 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::release();
        }
        throw;
    }
    {
        
        //#line 119 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10::lang::Runtime::release();
    }
    
    //#line 126 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    if (i_won) {
        
        //#line 128 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::nullCheck(((x10aux::ref<DistributedRail<FMGL(T)> >)this))->DistributedRail<FMGL(T)>::reduceLocal(
          op);
        
        //#line 130 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::nullCheck(((x10aux::ref<DistributedRail<FMGL(T)> >)this))->DistributedRail<FMGL(T)>::reduceGlobal(
          op);
        
        //#line 131 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::nullCheck(((x10aux::ref<DistributedRail<FMGL(T)> >)this))->DistributedRail<FMGL(T)>::bcastLocal(
          op);
        
        //#line 132 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::nullCheck(x10::lang::PlaceLocalHandle_methods<x10aux::ref<x10::lang::Cell<x10_boolean> > >::apply(((x10aux::ref<DistributedRail<FMGL(T)> >)this)->
                                                                                                                    FMGL(done)))->
          FMGL(value) = false;
    } else {
     
    }
    
}
template<class FMGL(T)> const x10aux::serialization_id_t DistributedRail<FMGL(T)>::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(DistributedRail<FMGL(T)>::template _deserializer<x10::lang::Object>);

template<class FMGL(T)> void DistributedRail<FMGL(T)>::_serialize(x10aux::ref<DistributedRail<FMGL(T)> > this_,
                                                                  x10aux::serialization_buffer& buf) {
    _serialize_reference(this_, buf);
    if (this_ != x10aux::null) {
        this_->_serialize_body(buf);
    }
}

template<class FMGL(T)> void DistributedRail<FMGL(T)>::_serialize_body(x10aux::serialization_buffer& buf) {
    x10::lang::Object::_serialize_body(buf);
    buf.write(this->FMGL(data));
    buf.write(this->FMGL(firstPlace));
    buf.write(this->FMGL(localRails));
    buf.write(this->FMGL(original));
    buf.write(this->FMGL(original_len));
    buf.write(this->FMGL(done));
    
}

template<class FMGL(T)> void DistributedRail<FMGL(T)>::_deserialize_body(x10aux::deserialization_buffer& buf) {
    x10::lang::Object::_deserialize_body(buf);
    FMGL(data) = buf.read<x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Rail<FMGL(T) > > > >();
    FMGL(firstPlace) = buf.read<x10::lang::Place>();
    FMGL(localRails) = buf.read<x10::lang::PlaceLocalHandle<x10aux::ref<x10::util::HashMap<x10aux::ref<x10::lang::Activity>, x10aux::ref<x10::lang::Rail<FMGL(T) > > > > > >();
    FMGL(original) = buf.read<x10aux::ref<x10::lang::ValRail<FMGL(T) > > >();
    FMGL(original_len) = buf.read<x10_int>();
    FMGL(done) = buf.read<x10::lang::PlaceLocalHandle<x10aux::ref<x10::lang::Cell<x10_boolean> > > >();
}

template<class FMGL(T)> x10aux::RuntimeType DistributedRail<FMGL(T)>::rtt;
template<class FMGL(T)> void DistributedRail<FMGL(T)>::_initRTT() {
    rtt.canonical = &rtt;
    const x10aux::RuntimeType* parents[3] = { x10aux::getRTT<x10::lang::Object>(), x10aux::getRTT<x10::lang::Settable<x10_int, FMGL(T)> >(), x10aux::getRTT<x10::lang::Iterable<FMGL(T)> >()};
    const x10aux::RuntimeType* params[1] = { x10aux::getRTT<FMGL(T)>()};
    x10aux::RuntimeType::Variance variances[1] = { x10aux::RuntimeType::invariant};
    const x10aux::RuntimeType *canonical = x10aux::getRTT<DistributedRail<void> >();
    const char *name = 
        x10aux::alloc_printf("DistributedRail[%s]", params[0]->name()
                             );
    rtt.init(canonical, name, 3, parents, 1, params, variances);
}
template<class FMGL(S)> x10aux::ref<x10::lang::ValRail<FMGL(S) > >
  DistributedRail<void>::__implicit_convert(x10aux::ref<DistributedRail<FMGL(S)> > x)
{
    
    //#line 44 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return x10::lang::ValRail<FMGL(S) >::make(x10aux::nullCheck(x)->DistributedRail<FMGL(S)>::apply());
    
}
template<class FMGL(T)>
FMGL(T)
  DistributedRail<void>::placeCastHack(FMGL(T) x)
{
    
    //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return (__extension__ ({
        FMGL(T) __desugarer__var__0__ =
          x;
        
        //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        FMGL(T) __var15__;
        
        //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        goto __ret16; __ret16: 
        //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        do
        {
        {
            
            //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            if (!((x10aux::ref<x10::lang::Reference>((__desugarer__var__0__)))->location == (x10::lang::Runtime::here())->FMGL(id)))
            {
                
                //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::throwException(x10aux::nullCheck(x10::lang::ClassCastException::_make(x10::lang::String::Lit("T{_self56504.home==here}"))));
            }
            
            //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            __var15__ =
              __desugarer__var__0__;
            
            //#line 69 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            goto __ret16_end_;
            
        }
        goto __ret16_next_; __ret16_next_: ;
        }
        while (false);
        goto __ret16_end_; __ret16_end_: ;
        __var15__;
    }))
    ;
    
}
#endif // DISTRIBUTEDRAIL_H_IMPLEMENTATION
#endif // __DISTRIBUTEDRAIL_H_NODEPS
