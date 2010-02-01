#ifndef __KMEANSCUDA_H
#define __KMEANSCUDA_H

#include <x10rt.h>

#define X10_LANG_OBJECT_H_NODEPS
#include <x10/lang/Object.h>
#undef X10_LANG_OBJECT_H_NODEPS
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
class Float;
} } 
#include <x10/lang/Float.struct_h>
namespace x10 { namespace lang { 
class Runtime;
} } 
namespace x10 { namespace lang { 
class Int;
} } 
#include <x10/lang/Int.struct_h>
namespace x10 { namespace io { 
class Console;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class Box;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
class String;
} } 
namespace x10 { namespace util { 
class OptionsParser;
} } 
namespace x10 { namespace util { 
class Option;
} } 
#include <x10/util/Option.struct_h>
namespace x10 { namespace lang { 
class Boolean;
} } 
#include <x10/lang/Boolean.struct_h>
namespace x10 { namespace io { 
class File;
} } 
namespace x10 { namespace io { 
class FileReader;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(U)> class Fun_0_1;
} } 
namespace x10 { namespace io { 
template<class FMGL(T)> class Marshal;
} } 
namespace x10 { namespace lang { 
class Long;
} } 
#include <x10/lang/Long.struct_h>
namespace x10 { namespace lang { 
template<class FMGL(T)> class ValRail;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class ValRail;
} } 
template<class FMGL(T)> class DistributedRail;
template<class FMGL(T)> class DistributedRail;
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(U)> class Fun_0_1;
} } 
namespace x10 { namespace lang { 
class VoidFun_0_0;
} } 
namespace x10 { namespace lang { 
class Place;
} } 
#include <x10/lang/Place.struct_h>
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
template<class FMGL(T)> class Rail;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(U)> class Fun_0_1;
} } 
namespace x10 { namespace lang { 
class System;
} } 
namespace x10 { namespace compiler { 
class CUDAUtilities;
} } 
namespace x10 { namespace compiler { 
class CUDA;
} } 
namespace x10 { namespace lang { 
class Throwable;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(Z2), class FMGL(Z3), class FMGL(U)> class Fun_0_3;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(Z2), class FMGL(Z3), class FMGL(U)> class Fun_0_3;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(Z2), class FMGL(U)> class Fun_0_2;
} } 
namespace x10 { namespace lang { 
template<class FMGL(Z1), class FMGL(Z2), class FMGL(U)> class Fun_0_2;
} } 
namespace x10 { namespace lang { 
class Double;
} } 
#include <x10/lang/Double.struct_h>
class KMeansCUDA : public x10::lang::Object   {
    public:
    RTT_H_DECLS_CLASS
    
    void _instance_init();
    
    static void printClusters(x10aux::ref<x10::lang::Rail<x10_float > > clusters,
                              x10_int dims);
    static x10_int round_up(x10_int x, x10_int n);
    static void main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > args);
    void _constructor();
    
    static x10aux::ref<KMeansCUDA> _make();
    
    
    // Serialization
    public: static const x10aux::serialization_id_t _serialization_id;
    
    public: virtual x10aux::serialization_id_t _get_serialization_id() {
         return _serialization_id;
    }
    
    public: virtual void _serialize_body(x10aux::serialization_buffer& buf);
    
    public: template<class __T> static x10aux::ref<__T> _deserializer(x10aux::deserialization_buffer& buf);
    
    public: void _deserialize_body(x10aux::deserialization_buffer& buf);
    
};
#endif // KMEANSCUDA_H

class KMeansCUDA;

#ifndef KMEANSCUDA_H_NODEPS
#define KMEANSCUDA_H_NODEPS
#include <x10/lang/Object.h>
#include <x10/lang/Rail.h>
#include <x10/lang/Float.h>
#include <x10/lang/Runtime.h>
#include <x10/lang/Int.h>
#include <x10/io/Console.h>
#include <x10/lang/Box.h>
#include <x10/lang/Rail.h>
#include <x10/lang/String.h>
#include <x10/util/OptionsParser.h>
#include <x10/util/Option.h>
#include <x10/lang/Boolean.h>
#include <x10/io/File.h>
#include <x10/io/FileReader.h>
#include <x10/lang/Fun_0_1.h>
#include <x10/io/Marshal.h>
#include <x10/lang/Long.h>
#include <x10/lang/ValRail.h>
#include <x10/lang/ValRail.h>
#include <DistributedRail.h>
#include <DistributedRail.h>
#include <x10/lang/Fun_0_1.h>
#include <x10/lang/VoidFun_0_0.h>
#include <x10/lang/Place.h>
#include <x10/lang/Rail.h>
#include <x10/lang/Rail.h>
#include <x10/lang/Fun_0_1.h>
#include <x10/lang/System.h>
#include <x10/compiler/CUDAUtilities.h>
#include <x10/compiler/CUDA.h>
#include <x10/lang/Throwable.h>
#include <x10/lang/Fun_0_3.h>
#include <x10/lang/Fun_0_3.h>
#include <x10/lang/Fun_0_2.h>
#include <x10/lang/Fun_0_2.h>
#include <x10/lang/Double.h>
#ifndef KMEANSCUDA_H_GENERICS
#define KMEANSCUDA_H_GENERICS
template<class __T> x10aux::ref<__T> KMeansCUDA::_deserializer(x10aux::deserialization_buffer& buf) {
    x10aux::ref<KMeansCUDA> this_ = new (x10aux::alloc_remote<KMeansCUDA>()) KMeansCUDA();
    buf.record_reference(this_);
    this_->_deserialize_body(buf);
    return this_;
}

#endif // KMEANSCUDA_H_GENERICS
#endif // __KMEANSCUDA_H_NODEPS
