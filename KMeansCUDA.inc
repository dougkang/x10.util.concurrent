#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_2.h>
class KMeansCUDA__closure__10 : public x10::lang::Closure {
    public:
    
    static x10::lang::Fun_0_2<x10_int, x10_int, x10_int>::itable<KMeansCUDA__closure__10> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10_int apply(x10_int x, x10_int y) {
        
        //#line 284 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return ((x10_int) ((x) + (y)));
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__10> this_ = new (x10aux::alloc<KMeansCUDA__closure__10>()) KMeansCUDA__closure__10(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    KMeansCUDA__closure__10(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__10() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_2<x10_int, x10_int, x10_int> >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_2<x10_int, x10_int, x10_int> >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:284");
    }

};

x10::lang::Fun_0_2<x10_int, x10_int, x10_int>::itable<KMeansCUDA__closure__10>KMeansCUDA__closure__10::_itable(&KMeansCUDA__closure__10::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__10::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__10::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_2<x10_int, x10_int, x10_int>::rtt, &KMeansCUDA__closure__10::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__10::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__10::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_2.h>
class KMeansCUDA__closure__9 : public x10::lang::Closure {
    public:
    
    static x10::lang::Fun_0_2<x10_float, x10_float, x10_float>::itable<KMeansCUDA__closure__9> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10_float apply(x10_float x, x10_float y) {
        
        //#line 283 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return ((x) + (y));
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__9> this_ = new (x10aux::alloc<KMeansCUDA__closure__9>()) KMeansCUDA__closure__9(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    KMeansCUDA__closure__9(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__9() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_2<x10_float, x10_float, x10_float> >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_2<x10_float, x10_float, x10_float> >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:283");
    }

};

x10::lang::Fun_0_2<x10_float, x10_float, x10_float>::itable<KMeansCUDA__closure__9>KMeansCUDA__closure__9::_itable(&KMeansCUDA__closure__9::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__9::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__9::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_2<x10_float, x10_float, x10_float>::rtt, &KMeansCUDA__closure__9::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__9::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__9::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/VoidFun_0_0.h>
class KMeansCUDA__closure__8 : public x10::lang::Closure {
    public:
    
    static x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__8> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    void apply() {
        
        //#line 234 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int tid = ((x10_int) ((((x10_int) ((block) * (threads)))) + (thread)));
        
        //#line 235 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int tids = ((x10_int) ((blocks) * (threads)));
        
        //#line 236 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        {
            x10_int p;
            for (
                 //#line 236 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                 p = tid; ((p) < (num_local_points)); 
                                                      //#line 236 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                                      p += tids) {
                
                //#line 237 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10_int closest = ((x10_int)-1);
                
                //#line 238 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10_float closest_dist = x10aux::float_utils::fromIntBits(0x7f7fffff);
                {
                    x10_int min = ((x10_int)0);
                    x10_int max = ((x10_int) ((num_clusters) - (((x10_int)1))));
                    x10_int loopMax = (max - min + ((x10_int)1)) / ((x10_int)20) *
                    ((x10_int)20) +
                    min;
                    {
                        x10_int k;
                        for (k = min; k < loopMax; k += ((x10_int)20))
                        {
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var0;
                                    x10_int x10____var1;
                                    for (x10____var0 =
                                           ((x10_int)0),
                                           x10____var1 =
                                             ((x10_int)3);
                                         x10____var0 <=
                                         x10____var1;
                                         x10____var0++)
                                    {
                                        x10_int d =
                                          x10____var0;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)0)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)0);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var2;
                                    x10_int x10____var3;
                                    for (x10____var2 =
                                           ((x10_int)0),
                                           x10____var3 =
                                             ((x10_int)3);
                                         x10____var2 <=
                                         x10____var3;
                                         x10____var2++)
                                    {
                                        x10_int d =
                                          x10____var2;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)1)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)1);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var4;
                                    x10_int x10____var5;
                                    for (x10____var4 =
                                           ((x10_int)0),
                                           x10____var5 =
                                             ((x10_int)3);
                                         x10____var4 <=
                                         x10____var5;
                                         x10____var4++)
                                    {
                                        x10_int d =
                                          x10____var4;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)2)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)2);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var6;
                                    x10_int x10____var7;
                                    for (x10____var6 =
                                           ((x10_int)0),
                                           x10____var7 =
                                             ((x10_int)3);
                                         x10____var6 <=
                                         x10____var7;
                                         x10____var6++)
                                    {
                                        x10_int d =
                                          x10____var6;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)3)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)3);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var8;
                                    x10_int x10____var9;
                                    for (x10____var8 =
                                           ((x10_int)0),
                                           x10____var9 =
                                             ((x10_int)3);
                                         x10____var8 <=
                                         x10____var9;
                                         x10____var8++)
                                    {
                                        x10_int d =
                                          x10____var8;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)4)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)4);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var10;
                                    x10_int x10____var11;
                                    for (x10____var10 =
                                           ((x10_int)0),
                                           x10____var11 =
                                             ((x10_int)3);
                                         x10____var10 <=
                                         x10____var11;
                                         x10____var10++)
                                    {
                                        x10_int d =
                                          x10____var10;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)5)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)5);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var12;
                                    x10_int x10____var13;
                                    for (x10____var12 =
                                           ((x10_int)0),
                                           x10____var13 =
                                             ((x10_int)3);
                                         x10____var12 <=
                                         x10____var13;
                                         x10____var12++)
                                    {
                                        x10_int d =
                                          x10____var12;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)6)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)6);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var14;
                                    x10_int x10____var15;
                                    for (x10____var14 =
                                           ((x10_int)0),
                                           x10____var15 =
                                             ((x10_int)3);
                                         x10____var14 <=
                                         x10____var15;
                                         x10____var14++)
                                    {
                                        x10_int d =
                                          x10____var14;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)7)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)7);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var16;
                                    x10_int x10____var17;
                                    for (x10____var16 =
                                           ((x10_int)0),
                                           x10____var17 =
                                             ((x10_int)3);
                                         x10____var16 <=
                                         x10____var17;
                                         x10____var16++)
                                    {
                                        x10_int d =
                                          x10____var16;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)8)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)8);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var18;
                                    x10_int x10____var19;
                                    for (x10____var18 =
                                           ((x10_int)0),
                                           x10____var19 =
                                             ((x10_int)3);
                                         x10____var18 <=
                                         x10____var19;
                                         x10____var18++)
                                    {
                                        x10_int d =
                                          x10____var18;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)9)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)9);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var20;
                                    x10_int x10____var21;
                                    for (x10____var20 =
                                           ((x10_int)0),
                                           x10____var21 =
                                             ((x10_int)3);
                                         x10____var20 <=
                                         x10____var21;
                                         x10____var20++)
                                    {
                                        x10_int d =
                                          x10____var20;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)10)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)10);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var22;
                                    x10_int x10____var23;
                                    for (x10____var22 =
                                           ((x10_int)0),
                                           x10____var23 =
                                             ((x10_int)3);
                                         x10____var22 <=
                                         x10____var23;
                                         x10____var22++)
                                    {
                                        x10_int d =
                                          x10____var22;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)11)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)11);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var24;
                                    x10_int x10____var25;
                                    for (x10____var24 =
                                           ((x10_int)0),
                                           x10____var25 =
                                             ((x10_int)3);
                                         x10____var24 <=
                                         x10____var25;
                                         x10____var24++)
                                    {
                                        x10_int d =
                                          x10____var24;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)12)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)12);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var26;
                                    x10_int x10____var27;
                                    for (x10____var26 =
                                           ((x10_int)0),
                                           x10____var27 =
                                             ((x10_int)3);
                                         x10____var26 <=
                                         x10____var27;
                                         x10____var26++)
                                    {
                                        x10_int d =
                                          x10____var26;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)13)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)13);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var28;
                                    x10_int x10____var29;
                                    for (x10____var28 =
                                           ((x10_int)0),
                                           x10____var29 =
                                             ((x10_int)3);
                                         x10____var28 <=
                                         x10____var29;
                                         x10____var28++)
                                    {
                                        x10_int d =
                                          x10____var28;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)14)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)14);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var30;
                                    x10_int x10____var31;
                                    for (x10____var30 =
                                           ((x10_int)0),
                                           x10____var31 =
                                             ((x10_int)3);
                                         x10____var30 <=
                                         x10____var31;
                                         x10____var30++)
                                    {
                                        x10_int d =
                                          x10____var30;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)15)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)15);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var32;
                                    x10_int x10____var33;
                                    for (x10____var32 =
                                           ((x10_int)0),
                                           x10____var33 =
                                             ((x10_int)3);
                                         x10____var32 <=
                                         x10____var33;
                                         x10____var32++)
                                    {
                                        x10_int d =
                                          x10____var32;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)16)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)16);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var34;
                                    x10_int x10____var35;
                                    for (x10____var34 =
                                           ((x10_int)0),
                                           x10____var35 =
                                             ((x10_int)3);
                                         x10____var34 <=
                                         x10____var35;
                                         x10____var34++)
                                    {
                                        x10_int d =
                                          x10____var34;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)17)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)17);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var36;
                                    x10_int x10____var37;
                                    for (x10____var36 =
                                           ((x10_int)0),
                                           x10____var37 =
                                             ((x10_int)3);
                                         x10____var36 <=
                                         x10____var37;
                                         x10____var36++)
                                    {
                                        x10_int d =
                                          x10____var36;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)18)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)18);
                                }
                                
                            }
                            {
                                
                                //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10_float dist =
                                  ((x10_float) (((x10_int)0)));
                                
                                //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10_int x10____var38;
                                    x10_int x10____var39;
                                    for (x10____var38 =
                                           ((x10_int)0),
                                           x10____var39 =
                                             ((x10_int)3);
                                         x10____var38 <=
                                         x10____var39;
                                         x10____var38++)
                                    {
                                        x10_int d =
                                          x10____var38;
                                        {
                                            
                                            //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10_float tmp =
                                              (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k +
                                            ((x10_int)19)) * (((x10_int)4))))) + (d)))]));
                                            
                                            //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            dist +=
                                              ((tmp) * (tmp));
                                        }
                                    }
                                }
                                
                                //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                if (((dist) < (closest_dist)))
                                {
                                    
                                    //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest_dist =
                                      dist;
                                    
                                    //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                    closest =
                                      k +
                                    ((x10_int)19);
                                }
                                
                            }
                        }
                    }
                    {
                        x10_int k;
                        for (k = loopMax;
                             k <=
                             max;
                             k++) {
                            
                            //#line 241 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            x10_float dist =
                              ((x10_float) (((x10_int)0)));
                            
                            //#line 242 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            {
                                x10_int x10____var40;
                                x10_int x10____var41;
                                for (x10____var40 =
                                       ((x10_int)0),
                                       x10____var41 =
                                         ((x10_int)3);
                                     x10____var40 <=
                                     x10____var41;
                                     x10____var40++)
                                {
                                    x10_int d =
                                      x10____var40;
                                    {
                                        
                                        //#line 243 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                        x10_float tmp =
                                          (((*gpu_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))]) - ((*clustercache)[((x10_int) ((((x10_int) ((k) * (((x10_int)4))))) + (d)))]));
                                        
                                        //#line 245 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                        dist +=
                                          ((tmp) * (tmp));
                                    }
                                }
                            }
                            
                            //#line 248 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            if (((dist) < (closest_dist)))
                            {
                                
                                //#line 249 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                closest_dist =
                                  dist;
                                
                                //#line 250 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                closest =
                                  k;
                            }
                            
                        }
                    }
                    
                }
                
                //#line 253 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                (*gpu_nearest)[p] = closest;
            }
        }
        
    }
    
    // captured environment
    x10_int block;
    x10_int threads;
    x10_int thread;
    x10_int blocks;
    x10_int num_local_points;
    x10_int num_clusters;
    x10aux::ref<x10::lang::Rail<x10_float > > gpu_points;
    x10_int num_local_points_stride;
    x10aux::ref<x10::lang::Rail<x10_float > > clustercache;
    x10aux::ref<x10::lang::Rail<x10_int > > gpu_nearest;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->block);
        buf.write(this->threads);
        buf.write(this->thread);
        buf.write(this->blocks);
        buf.write(this->num_local_points);
        buf.write(this->num_clusters);
        buf.write(this->gpu_points);
        buf.write(this->num_local_points_stride);
        buf.write(this->clustercache);
        buf.write(this->gpu_nearest);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__8> this_ = new (x10aux::alloc<KMeansCUDA__closure__8>()) KMeansCUDA__closure__8(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->block = buf.read<x10_int>();
        this_->threads = buf.read<x10_int>();
        this_->thread = buf.read<x10_int>();
        this_->blocks = buf.read<x10_int>();
        this_->num_local_points = buf.read<x10_int>();
        this_->num_clusters = buf.read<x10_int>();
        this_->gpu_points = buf.read<x10aux::ref<x10::lang::Rail<x10_float > > >();
        this_->num_local_points_stride = buf.read<x10_int>();
        this_->clustercache = buf.read<x10aux::ref<x10::lang::Rail<x10_float > > >();
        this_->gpu_nearest = buf.read<x10aux::ref<x10::lang::Rail<x10_int > > >();
        return this_;
    }
    
    KMeansCUDA__closure__8(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__8(x10_int block, x10_int threads, x10_int thread, x10_int blocks, x10_int num_local_points, x10_int num_clusters, x10aux::ref<x10::lang::Rail<x10_float > > gpu_points, x10_int num_local_points_stride, x10aux::ref<x10::lang::Rail<x10_float > > clustercache, x10aux::ref<x10::lang::Rail<x10_int > > gpu_nearest) {
        this->block = block;
        this->threads = threads;
        this->thread = thread;
        this->blocks = blocks;
        this->num_local_points = num_local_points;
        this->num_clusters = num_clusters;
        this->gpu_points = gpu_points;
        this->num_local_points_stride = num_local_points_stride;
        this->clustercache = clustercache;
        this->gpu_nearest = gpu_nearest;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:233-255");
    }

};

x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__8>KMeansCUDA__closure__8::_itable(&KMeansCUDA__closure__8::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__8::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__8::_itables[2] = {x10aux::itable_entry(&x10::lang::VoidFun_0_0::rtt, &KMeansCUDA__closure__8::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__8::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__8::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/VoidFun_0_0.h>
class KMeansCUDA__closure__7 : public x10::lang::Closure {
    public:
    
    static x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__7> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    void apply() {
        
        //#line 229 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int blocks = x10::compiler::CUDAUtilities::autoBlocks();
        
        //#line 230 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int threads = x10::compiler::CUDAUtilities::autoThreads();
        
        //#line 231 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        {
            x10_int x10____var44;
            x10_int x10____var45;
            for (x10____var44 = ((x10_int)0), x10____var45 = ((x10_int) ((blocks) - (((x10_int)1))));
                 x10____var44 <=
                 x10____var45;
                 x10____var44++) {
                x10_int block = x10____var44;
                {
                    
                    //#line 232 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10aux::ref<x10::lang::Rail<x10_float > > clustercache =
                      x10::lang::Rail<x10_float >::make(((x10_int) ((num_clusters) * (((x10_int)4)))), x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_float> > >(clusters_copy));
                    
                    //#line 233 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    {
                        x10_int x10____var42;
                        x10_int x10____var43;
                        for (x10____var42 = ((x10_int)0), x10____var43 =
                                                            ((x10_int) ((threads) - (((x10_int)1))));
                             x10____var42 <=
                             x10____var43;
                             x10____var42++) {
                            x10_int thread = x10____var42;
                            {
                                
                                //#line 233 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                x10::lang::Runtime::runAsync(
                                  x10aux::class_cast_unchecked<x10aux::ref<x10::lang::VoidFun_0_0> >(x10aux::ref<x10::lang::VoidFun_0_0>(x10aux::ref<KMeansCUDA__closure__8>(new (x10aux::alloc<x10::lang::VoidFun_0_0>(sizeof(KMeansCUDA__closure__8)))KMeansCUDA__closure__8(block, threads, thread, blocks, num_local_points, num_clusters, gpu_points, num_local_points_stride, clustercache, gpu_nearest)))));
                            }
                        }
                    }
                    
                }
            }
        }
        
    }
    
    // captured environment
    x10_int num_clusters;
    x10aux::ref<x10::lang::ValRail<x10_float > > clusters_copy;
    x10_int num_local_points;
    x10aux::ref<x10::lang::Rail<x10_float > > gpu_points;
    x10_int num_local_points_stride;
    x10aux::ref<x10::lang::Rail<x10_int > > gpu_nearest;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->num_clusters);
        buf.write(this->clusters_copy);
        buf.write(this->num_local_points);
        buf.write(this->gpu_points);
        buf.write(this->num_local_points_stride);
        buf.write(this->gpu_nearest);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__7> this_ = new (x10aux::alloc<KMeansCUDA__closure__7>()) KMeansCUDA__closure__7(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->num_clusters = buf.read<x10_int>();
        this_->clusters_copy = buf.read<x10aux::ref<x10::lang::ValRail<x10_float > > >();
        this_->num_local_points = buf.read<x10_int>();
        this_->gpu_points = buf.read<x10aux::ref<x10::lang::Rail<x10_float > > >();
        this_->num_local_points_stride = buf.read<x10_int>();
        this_->gpu_nearest = buf.read<x10aux::ref<x10::lang::Rail<x10_int > > >();
        return this_;
    }
    
    KMeansCUDA__closure__7(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__7(x10_int num_clusters, x10aux::ref<x10::lang::ValRail<x10_float > > clusters_copy, x10_int num_local_points, x10aux::ref<x10::lang::Rail<x10_float > > gpu_points, x10_int num_local_points_stride, x10aux::ref<x10::lang::Rail<x10_int > > gpu_nearest) {
        this->num_clusters = num_clusters;
        this->clusters_copy = clusters_copy;
        this->num_local_points = num_local_points;
        this->gpu_points = gpu_points;
        this->num_local_points_stride = num_local_points_stride;
        this->gpu_nearest = gpu_nearest;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:228-257");
    }

};

x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__7>KMeansCUDA__closure__7::_itable(&KMeansCUDA__closure__7::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__7::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__7::_itables[2] = {x10aux::itable_entry(&x10::lang::VoidFun_0_0::rtt, &KMeansCUDA__closure__7::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__7::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__7::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_1.h>
class KMeansCUDA__closure__6 : public x10::lang::Closure {
    public:
    
    static x10::lang::Fun_0_1<x10_int, x10_int>::itable<KMeansCUDA__closure__6> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10_int apply(x10_int id__13) {
        
        //#line 216 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return ((x10_int)0);
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__6> this_ = new (x10aux::alloc<KMeansCUDA__closure__6>()) KMeansCUDA__closure__6(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    KMeansCUDA__closure__6(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__6() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_int> >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_int> >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:216");
    }

};

x10::lang::Fun_0_1<x10_int, x10_int>::itable<KMeansCUDA__closure__6>KMeansCUDA__closure__6::_itable(&KMeansCUDA__closure__6::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__6::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__6::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_1<x10_int, x10_int>::rtt, &KMeansCUDA__closure__6::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__6::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__6::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_1.h>
class KMeansCUDA__closure__5 : public x10::lang::Closure {
    public:
    
    static x10::lang::Fun_0_1<x10_int, x10_int>::itable<KMeansCUDA__closure__5> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10_int apply(x10_int id__12) {
        
        //#line 215 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return ((x10_int)0);
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__5> this_ = new (x10aux::alloc<KMeansCUDA__closure__5>()) KMeansCUDA__closure__5(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    KMeansCUDA__closure__5(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__5() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_int> >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_int> >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:215");
    }

};

x10::lang::Fun_0_1<x10_int, x10_int>::itable<KMeansCUDA__closure__5>KMeansCUDA__closure__5::_itable(&KMeansCUDA__closure__5::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__5::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__5::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_1<x10_int, x10_int>::rtt, &KMeansCUDA__closure__5::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__5::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__5::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_1.h>
class KMeansCUDA__closure__4 : public x10::lang::Closure {
    public:
    
    static x10::lang::Fun_0_1<x10_int, x10_float>::itable<KMeansCUDA__closure__4> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10_float apply(x10_int i) {
        
        //#line 208 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int d = ((x10_int) ((i) / (num_local_points_stride)));
        
        //#line 208 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int p = ((x10_int) ((i) % (num_local_points_stride)));
        
        //#line 209 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return ((p) < (num_local_points)) ? (x10_float)((*file_points)[((x10_int) ((((x10_int) ((((x10_int) ((((x10_int) ((p) + (offset)))) % (num_file_points)))) * (((x10_int)4))))) + (d)))])
          : (x10_float)(((x10_int)0));
        
    }
    
    // captured environment
    x10_int num_local_points_stride;
    x10_int num_local_points;
    x10aux::ref<x10::lang::ValRail<x10_float > > file_points;
    x10_int offset;
    x10_int num_file_points;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->num_local_points_stride);
        buf.write(this->num_local_points);
        buf.write(this->file_points);
        buf.write(this->offset);
        buf.write(this->num_file_points);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__4> this_ = new (x10aux::alloc<KMeansCUDA__closure__4>()) KMeansCUDA__closure__4(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->num_local_points_stride = buf.read<x10_int>();
        this_->num_local_points = buf.read<x10_int>();
        this_->file_points = buf.read<x10aux::ref<x10::lang::ValRail<x10_float > > >();
        this_->offset = buf.read<x10_int>();
        this_->num_file_points = buf.read<x10_int>();
        return this_;
    }
    
    KMeansCUDA__closure__4(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__4(x10_int num_local_points_stride, x10_int num_local_points, x10aux::ref<x10::lang::ValRail<x10_float > > file_points, x10_int offset, x10_int num_file_points) {
        this->num_local_points_stride = num_local_points_stride;
        this->num_local_points = num_local_points;
        this->file_points = file_points;
        this->offset = offset;
        this->num_file_points = num_file_points;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_float> >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_float> >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:207-210");
    }

};

x10::lang::Fun_0_1<x10_int, x10_float>::itable<KMeansCUDA__closure__4>KMeansCUDA__closure__4::_itable(&KMeansCUDA__closure__4::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__4::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__4::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_1<x10_int, x10_float>::rtt, &KMeansCUDA__closure__4::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__4::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__4::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/VoidFun_0_0.h>
class KMeansCUDA__closure__3 : public x10::lang::Closure {
    public:
    
    static x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__3> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    void apply() {
        
        //#line 202 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int num_local_points = ((x10_int) ((num_slice_points) / (x10::lang::Place_methods::
                                                                       FMGL(NUM_ACCELS__get)())));
        
        //#line 203 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int offset = ((x10_int) ((((x10_int) ((slice) * (num_slice_points)))) + (((x10_int) ((((x10_int) ((gpu->
                                                                                                                 FMGL(id)) - (x10aux::num_hosts)))) * (num_local_points))))));
        
        //#line 204 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        if (!(quiet)) {
            
            //#line 205 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10aux::nullCheck(x10::io::Console::FMGL(OUT__get)())->x10::io::Printer::println(
              x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10aux::safe_to_string(gpu) +
              x10::lang::String::Lit(" gets ") +
              x10aux::safe_to_string(offset) +
              x10::lang::String::Lit(" len ") +
              x10aux::safe_to_string(num_local_points)));
        }
        
        //#line 206 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int num_local_points_stride =
          KMeansCUDA::round_up(
            num_local_points,
            MEM_ALIGN);
        
        //#line 207 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_float> > init =
          x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_float> > >(x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_float> >(x10aux::ref<KMeansCUDA__closure__4>(new (x10aux::alloc<x10::lang::Fun_0_1<x10_int, x10_float> >(sizeof(KMeansCUDA__closure__4)))KMeansCUDA__closure__4(num_local_points_stride, num_local_points, file_points, offset, num_file_points))));
        
        //#line 213 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<x10_float > > host_points =
          x10::lang::Rail<x10_float >::make(((x10_int) ((num_local_points_stride) * (((x10_int)4)))), init);
        
        //#line 214 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<x10_float > > gpu_points =
          x10::lang::System::makeRemoteRail(gpu,((x10_int) ((num_local_points_stride) * (((x10_int)4)))),host_points);
        
        //#line 215 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<x10_int > > host_nearest =
          x10::lang::Rail<x10_int >::make(num_local_points, x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_int> > >(x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_int> >(x10aux::ref<KMeansCUDA__closure__5>(new (x10aux::alloc<x10::lang::Fun_0_1<x10_int, x10_int> >(sizeof(KMeansCUDA__closure__5)))KMeansCUDA__closure__5()))));
        
        //#line 216 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<x10_int > > gpu_nearest =
          x10::lang::System::makeRemoteRail(gpu,num_local_points,x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_int> > >(x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_int> >(x10aux::ref<KMeansCUDA__closure__6>(new (x10aux::alloc<x10::lang::Fun_0_1<x10_int, x10_int> >(sizeof(KMeansCUDA__closure__6)))KMeansCUDA__closure__6()))));
        
        //#line 220 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_long start_time = x10::lang::System::currentTimeMillis();
        
        //#line 222 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        goto main_loop; main_loop: 
        //#line 222 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        {
            x10_int iter;
            for (
                 //#line 222 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                 iter = ((x10_int)0); ((iter) < (iterations));
                 
                 //#line 222 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                 iter +=
                   ((x10_int)1)) {
            {
                
                //#line 224 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::ref<x10::lang::ValRail<x10_float > > clusters_copy =
                  DistributedRail<void>::__implicit_convert<x10_float >(
                    clusters);
                
                //#line 226 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10_long k_start_time = x10::lang::System::currentTimeMillis();
                
                //#line 228 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                try {
                try {
                    
                    //#line 228 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::startFinish();
                    {
                        
                        //#line 228 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10::lang::Runtime::runAsync(
                          gpu,
                          x10aux::class_cast_unchecked<x10aux::ref<x10::lang::VoidFun_0_0> >(x10aux::ref<x10::lang::VoidFun_0_0>(x10aux::ref<KMeansCUDA__closure__7>(new (x10aux::alloc<x10::lang::VoidFun_0_0>(sizeof(KMeansCUDA__closure__7)))KMeansCUDA__closure__7(num_clusters, clusters_copy, num_local_points, gpu_points, num_local_points_stride, gpu_nearest)))));
                    }
                }
                catch (x10aux::__ref& __ref__20) {
                    x10aux::ref<x10::lang::Throwable>& __exc__ref__20 = (x10aux::ref<x10::lang::Throwable>&)__ref__20;
                    
                    //#line 228 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    if (x10aux::instanceof<x10aux::ref<x10::lang::Throwable> >(__exc__ref__20)) {
                        x10aux::ref<x10::lang::Throwable> __desugarer__var__4__ =
                          static_cast<x10aux::ref<x10::lang::Throwable> >(__exc__ref__20);
                        {
                            
                            //#line 228 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            x10::lang::Runtime::pushException(
                              __desugarer__var__4__);
                        }
                    } else
                    throw;
                }
                } catch (...) {
                    {
                        
                        //#line 228 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10::lang::Runtime::stopFinish();
                    }
                    throw;
                }
                {
                    
                    //#line 228 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::stopFinish();
                }
                
                //#line 258 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::nullCheck(x10::io::Console::
                                    FMGL(OUT__get)())->x10::io::Printer::println(
                  x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("kernel: ") +
                  x10aux::safe_to_string(((x10_long) ((x10::lang::System::currentTimeMillis()) - (k_start_time))))));
                
                //#line 261 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                k_start_time = x10::lang::System::currentTimeMillis();
                
                //#line 262 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                try {
                try {
                    
                    //#line 262 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::startFinish();
                    {
                        
                        //#line 262 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        (host_nearest)->copyFrom(((x10_int)0),gpu_nearest,((x10_int)0),num_local_points);
                    }
                }
                catch (x10aux::__ref& __ref__21) {
                    x10aux::ref<x10::lang::Throwable>& __exc__ref__21 = (x10aux::ref<x10::lang::Throwable>&)__ref__21;
                    
                    //#line 262 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    if (x10aux::instanceof<x10aux::ref<x10::lang::Throwable> >(__exc__ref__21)) {
                        x10aux::ref<x10::lang::Throwable> __desugarer__var__5__ =
                          static_cast<x10aux::ref<x10::lang::Throwable> >(__exc__ref__21);
                        {
                            
                            //#line 262 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            x10::lang::Runtime::pushException(
                              __desugarer__var__5__);
                        }
                    } else
                    throw;
                }
                } catch (...) {
                    {
                        
                        //#line 262 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10::lang::Runtime::stopFinish();
                    }
                    throw;
                }
                {
                    
                    //#line 262 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::stopFinish();
                }
                
                //#line 263 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::nullCheck(x10::io::Console::
                                    FMGL(OUT__get)())->x10::io::Printer::println(
                  x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("dma: ") +
                  x10aux::safe_to_string(((x10_long) ((x10::lang::System::currentTimeMillis()) - (k_start_time))))));
                
                //#line 268 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::ref<x10::lang::Rail<x10_float > > host_clusters =
                  x10aux::nullCheck(clusters)->DistributedRail<x10_float>::apply();
                
                //#line 269 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::ref<x10::lang::Rail<x10_int > > host_cluster_counts =
                  x10aux::nullCheck(cluster_counts)->DistributedRail<x10_int>::apply();
                
                //#line 271 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                (host_clusters)->reset(((x10_float) (((x10_int)0))));
                
                //#line 272 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                (host_cluster_counts)->reset(((x10_int)0));
                
                //#line 274 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                k_start_time = x10::lang::System::currentTimeMillis();
                
                //#line 275 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                {
                    x10_int p;
                    for (
                         //#line 275 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                         p = ((x10_int)0);
                         ((p) < (num_local_points));
                         
                         //#line 275 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                         p +=
                           ((x10_int)1)) {
                        
                        //#line 276 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10_int closest =
                          (*host_nearest)[p];
                        
                        //#line 277 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        {
                            x10_int d;
                            for (
                                 //#line 277 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                 d = ((x10_int)0);
                                 ((d) < (((x10_int)4)));
                                 
                                 //#line 277 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                 d +=
                                   ((x10_int)1))
                            {
                                
                                //#line 278 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                (__extension__ ({
                                    x10aux::ref<x10::lang::Rail<x10_float > > x =
                                      host_clusters;
                                    x10_int y0 =
                                      ((x10_int) ((((x10_int) ((closest) * (((x10_int)4))))) + (d)));
                                    x10_float z =
                                      (*host_points)[((x10_int) ((p) + (((x10_int) ((d) * (num_local_points_stride))))))];
                                    (*x)[y0] = (((*x)[y0]) + (z));
                                }))
                                ;
                            }
                        }
                        
                        //#line 279 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        (__extension__ ({
                            x10aux::ref<x10::lang::Rail<x10_int > > x =
                              host_cluster_counts;
                            x10_int y0 =
                              closest;
                            x10_int z =
                              ((x10_int)1);
                            (*x)[y0] = ((x10_int) (((*x)[y0]) + (z)));
                        }))
                        ;
                    }
                }
                
                //#line 281 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::nullCheck(x10::io::Console::
                                    FMGL(OUT__get)())->x10::io::Printer::println(
                  x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("reaverage: ") +
                  x10aux::safe_to_string(((x10_long) ((x10::lang::System::currentTimeMillis()) - (k_start_time))))));
                
                //#line 283 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::nullCheck(clusters)->DistributedRail<x10_float>::collectiveReduce(
                  x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_2<x10_float, x10_float, x10_float> > >(x10aux::ref<x10::lang::Fun_0_2<x10_float, x10_float, x10_float> >(x10aux::ref<KMeansCUDA__closure__9>(new (x10aux::alloc<x10::lang::Fun_0_2<x10_float, x10_float, x10_float> >(sizeof(KMeansCUDA__closure__9)))KMeansCUDA__closure__9()))));
                
                //#line 284 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::nullCheck(cluster_counts)->DistributedRail<x10_int>::collectiveReduce(
                  x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_2<x10_int, x10_int, x10_int> > >(x10aux::ref<x10::lang::Fun_0_2<x10_int, x10_int, x10_int> >(x10aux::ref<KMeansCUDA__closure__10>(new (x10aux::alloc<x10::lang::Fun_0_2<x10_int, x10_int, x10_int> >(sizeof(KMeansCUDA__closure__10)))KMeansCUDA__closure__10()))));
                
                //#line 286 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                {
                    x10_int k;
                    for (
                         //#line 286 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                         k = ((x10_int)0);
                         ((k) < (num_clusters));
                         
                         //#line 286 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                         k +=
                           ((x10_int)1)) {
                        
                        //#line 287 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        {
                            x10_int d;
                            for (
                                 //#line 287 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                 d = ((x10_int)0);
                                 ((d) < (((x10_int)4)));
                                 
                                 //#line 287 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                 d +=
                                   ((x10_int)1))
                            {
                                
                                //#line 287 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                (__extension__ ({
                                    x10aux::ref<x10::lang::Rail<x10_float > > x =
                                      host_clusters;
                                    x10_int y0 =
                                      ((x10_int) ((((x10_int) ((k) * (((x10_int)4))))) + (d)));
                                    x10_float z =
                                      ((x10_float) ((*host_cluster_counts)[k]));
                                    (*x)[y0] = (((*x)[y0]) / (z));
                                }))
                                ;
                            }
                        }
                        
                    }
                }
                
                //#line 290 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                if ((x10aux::struct_equals(offset,
                                           ((x10_int)0))) &&
                    verbose) {
                    
                    //#line 291 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10aux::nullCheck(x10::io::Console::
                                        FMGL(OUT__get)())->x10::io::Printer::println(
                      x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("Iteration: ") +
                      x10aux::safe_to_string(iter)));
                    
                    //#line 292 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    KMeansCUDA::printClusters(
                      x10aux::nullCheck(clusters)->DistributedRail<x10_float>::apply(),
                      ((x10_int)4));
                }
                
                //#line 296 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                {
                    x10_int j;
                    for (
                         //#line 296 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                         j = ((x10_int)0);
                         ((j) < (((x10_int) ((num_clusters) * (((x10_int)4))))));
                         
                         //#line 296 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                         j +=
                           ((x10_int)1)) {
                        
                        //#line 297 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        if (true) {
                            
                            //#line 297 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                            goto main_loop_next_;
                        }
                        
                    }
                }
                
                //#line 300 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                break;
            }
            goto main_loop_next_; main_loop_next_: ;
            }
            goto main_loop_end_; main_loop_end_: ;
        }
        
        //#line 304 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        if ((x10aux::struct_equals(offset,
                                   ((x10_int)0))))
        {
            
            //#line 305 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10_long stop_time =
              x10::lang::System::currentTimeMillis();
            
            //#line 306 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            if (!(quiet))
            {
                
                //#line 306 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10aux::nullCheck(x10::io::Console::
                                    FMGL(OUT__get)())->print(
                  x10aux::safe_to_string(num_global_points) +
                  x10::lang::String::Lit(" ") +
                  x10aux::safe_to_string(num_clusters) +
                  x10::lang::String::Lit(" 4 "));
            }
            
            //#line 307 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10aux::nullCheck(x10::io::Console::
                                FMGL(OUT__get)())->x10::io::Printer::println(
              x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(((((x10_double) (((x10_long) ((stop_time) - (start_time)))))) / (1000.0))));
        }
        
    }
    
    // captured environment
    x10_int num_slice_points;
    x10_int slice;
    x10::lang::Place gpu;
    x10_boolean quiet;
    x10_int MEM_ALIGN;
    x10aux::ref<x10::lang::ValRail<x10_float > > file_points;
    x10_int num_file_points;
    x10_int iterations;
    x10aux::ref<DistributedRail<x10_float> > clusters;
    x10_int num_clusters;
    x10aux::ref<DistributedRail<x10_int> > cluster_counts;
    x10_boolean verbose;
    x10_int num_global_points;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->num_slice_points);
        buf.write(this->slice);
        buf.write(this->gpu);
        buf.write(this->quiet);
        buf.write(this->MEM_ALIGN);
        buf.write(this->file_points);
        buf.write(this->num_file_points);
        buf.write(this->iterations);
        buf.write(this->clusters);
        buf.write(this->num_clusters);
        buf.write(this->cluster_counts);
        buf.write(this->verbose);
        buf.write(this->num_global_points);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__3> this_ = new (x10aux::alloc<KMeansCUDA__closure__3>()) KMeansCUDA__closure__3(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->num_slice_points = buf.read<x10_int>();
        this_->slice = buf.read<x10_int>();
        this_->gpu = buf.read<x10::lang::Place>();
        this_->quiet = buf.read<x10_boolean>();
        this_->MEM_ALIGN = buf.read<x10_int>();
        this_->file_points = buf.read<x10aux::ref<x10::lang::ValRail<x10_float > > >();
        this_->num_file_points = buf.read<x10_int>();
        this_->iterations = buf.read<x10_int>();
        this_->clusters = buf.read<x10aux::ref<DistributedRail<x10_float> > >();
        this_->num_clusters = buf.read<x10_int>();
        this_->cluster_counts = buf.read<x10aux::ref<DistributedRail<x10_int> > >();
        this_->verbose = buf.read<x10_boolean>();
        this_->num_global_points = buf.read<x10_int>();
        return this_;
    }
    
    KMeansCUDA__closure__3(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__3(x10_int num_slice_points, x10_int slice, x10::lang::Place gpu, x10_boolean quiet, x10_int MEM_ALIGN, x10aux::ref<x10::lang::ValRail<x10_float > > file_points, x10_int num_file_points, x10_int iterations, x10aux::ref<DistributedRail<x10_float> > clusters, x10_int num_clusters, x10aux::ref<DistributedRail<x10_int> > cluster_counts, x10_boolean verbose, x10_int num_global_points) {
        this->num_slice_points = num_slice_points;
        this->slice = slice;
        this->gpu = gpu;
        this->quiet = quiet;
        this->MEM_ALIGN = MEM_ALIGN;
        this->file_points = file_points;
        this->num_file_points = num_file_points;
        this->iterations = iterations;
        this->clusters = clusters;
        this->num_clusters = num_clusters;
        this->cluster_counts = cluster_counts;
        this->verbose = verbose;
        this->num_global_points = num_global_points;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:199-310");
    }

};

x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__3>KMeansCUDA__closure__3::_itable(&KMeansCUDA__closure__3::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__3::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__3::_itables[2] = {x10aux::itable_entry(&x10::lang::VoidFun_0_0::rtt, &KMeansCUDA__closure__3::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__3::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__3::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/VoidFun_0_0.h>
class KMeansCUDA__closure__2 : public x10::lang::Closure {
    public:
    
    static x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__2> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    void apply() {
        
        //#line 195 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int num_slice_points = ((x10_int) ((num_global_points) / (num_slices)));
        
        //#line 197 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        {
            x10_int x10____var46;
            x10_int x10____var47;
            for (x10____var46 = ((x10_int)0), x10____var47 = ((x10_int) ((num_slices) - (((x10_int)1))));
                 x10____var46 <=
                 x10____var47;
                 x10____var46++) {
                x10_int slice = x10____var46;
                {
                    
                    //#line 199 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    {
                        x10aux::ref<x10::lang::Reference> __ih = (x10aux::nullCheck(x10::lang::Place_methods::
                                                                                      FMGL(places__get)()))->iterator();
                        x10::lang::Iterator<x10::lang::Place>::itable<x10::lang::Reference> *__ih_itable = x10aux::findITable<x10::lang::Iterator<x10::lang::Place> >(__ih->_getITables());
                        for (; (((x10::lang::Reference*)(__ih.operator->()))->*(__ih_itable->hasNext))();
                               ) {
                            x10::lang::Place h;
                            h = (((x10::lang::Reference*)(__ih.operator->()))->*(__ih_itable->next))();
                            {
                                
                                //#line 199 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                {
                                    x10aux::ref<x10::lang::Reference> __igpu = (x10aux::nullCheck(x10::lang::Place_methods::children(h)))->iterator();
                                    x10::lang::Iterator<x10::lang::Place>::itable<x10::lang::Reference> *__igpu_itable = x10aux::findITable<x10::lang::Iterator<x10::lang::Place> >(__igpu->_getITables());
                                    for (; (((x10::lang::Reference*)(__igpu.operator->()))->*(__igpu_itable->hasNext))();
                                           ) {
                                        x10::lang::Place gpu;
                                        gpu = (((x10::lang::Reference*)(__igpu.operator->()))->*(__igpu_itable->next))();
                                        {
                                            
                                            //#line 199 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                            x10::lang::Runtime::runAsync(
                                              h,
                                              x10aux::class_cast_unchecked<x10aux::ref<x10::lang::VoidFun_0_0> >(x10aux::ref<x10::lang::VoidFun_0_0>(x10aux::ref<KMeansCUDA__closure__3>(new (x10aux::alloc<x10::lang::VoidFun_0_0>(sizeof(KMeansCUDA__closure__3)))KMeansCUDA__closure__3(num_slice_points, slice, gpu, quiet, MEM_ALIGN, file_points, num_file_points, iterations, clusters, num_clusters, cluster_counts, verbose, num_global_points)))));
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }
            }
        }
        
    }
    
    // captured environment
    x10_int num_global_points;
    x10_int num_slices;
    x10_boolean quiet;
    x10_int MEM_ALIGN;
    x10aux::ref<x10::lang::ValRail<x10_float > > file_points;
    x10_int num_file_points;
    x10_int iterations;
    x10aux::ref<DistributedRail<x10_float> > clusters;
    x10_int num_clusters;
    x10aux::ref<DistributedRail<x10_int> > cluster_counts;
    x10_boolean verbose;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->num_global_points);
        buf.write(this->num_slices);
        buf.write(this->quiet);
        buf.write(this->MEM_ALIGN);
        buf.write(this->file_points);
        buf.write(this->num_file_points);
        buf.write(this->iterations);
        buf.write(this->clusters);
        buf.write(this->num_clusters);
        buf.write(this->cluster_counts);
        buf.write(this->verbose);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__2> this_ = new (x10aux::alloc<KMeansCUDA__closure__2>()) KMeansCUDA__closure__2(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->num_global_points = buf.read<x10_int>();
        this_->num_slices = buf.read<x10_int>();
        this_->quiet = buf.read<x10_boolean>();
        this_->MEM_ALIGN = buf.read<x10_int>();
        this_->file_points = buf.read<x10aux::ref<x10::lang::ValRail<x10_float > > >();
        this_->num_file_points = buf.read<x10_int>();
        this_->iterations = buf.read<x10_int>();
        this_->clusters = buf.read<x10aux::ref<DistributedRail<x10_float> > >();
        this_->num_clusters = buf.read<x10_int>();
        this_->cluster_counts = buf.read<x10aux::ref<DistributedRail<x10_int> > >();
        this_->verbose = buf.read<x10_boolean>();
        return this_;
    }
    
    KMeansCUDA__closure__2(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__2(x10_int num_global_points, x10_int num_slices, x10_boolean quiet, x10_int MEM_ALIGN, x10aux::ref<x10::lang::ValRail<x10_float > > file_points, x10_int num_file_points, x10_int iterations, x10aux::ref<DistributedRail<x10_float> > clusters, x10_int num_clusters, x10aux::ref<DistributedRail<x10_int> > cluster_counts, x10_boolean verbose) {
        this->num_global_points = num_global_points;
        this->num_slices = num_slices;
        this->quiet = quiet;
        this->MEM_ALIGN = MEM_ALIGN;
        this->file_points = file_points;
        this->num_file_points = num_file_points;
        this->iterations = iterations;
        this->clusters = clusters;
        this->num_clusters = num_clusters;
        this->cluster_counts = cluster_counts;
        this->verbose = verbose;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::VoidFun_0_0>(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:190-314");
    }

};

x10::lang::VoidFun_0_0::itable<KMeansCUDA__closure__2>KMeansCUDA__closure__2::_itable(&KMeansCUDA__closure__2::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__2::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__2::_itables[2] = {x10aux::itable_entry(&x10::lang::VoidFun_0_0::rtt, &KMeansCUDA__closure__2::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__2::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__2::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_1.h>
class KMeansCUDA__closure__1 : public x10::lang::Closure {
    public:
    
    static x10::lang::Fun_0_1<x10_int, x10_int>::itable<KMeansCUDA__closure__1> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10_int apply(x10_int id__10) {
        
        //#line 188 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return ((x10_int)0);
        
    }
    
    // captured environment
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__1> this_ = new (x10aux::alloc<KMeansCUDA__closure__1>()) KMeansCUDA__closure__1(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        return this_;
    }
    
    KMeansCUDA__closure__1(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__1() {
        
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_int> >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_int> >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:188");
    }

};

x10::lang::Fun_0_1<x10_int, x10_int>::itable<KMeansCUDA__closure__1>KMeansCUDA__closure__1::_itable(&KMeansCUDA__closure__1::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__1::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__1::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_1<x10_int, x10_int>::rtt, &KMeansCUDA__closure__1::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__1::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__1::_deserialize<x10::lang::Object>);

#include <x10/lang/Closure.h>
#include <x10/lang/Fun_0_1.h>
class KMeansCUDA__closure__0 : public x10::lang::Closure {
    public:
    
    static x10::lang::Fun_0_1<x10_int, x10_float>::itable<KMeansCUDA__closure__0> _itable;
    static x10aux::itable_entry _itables[2];
    
    virtual x10aux::itable_entry* _getITables() { return _itables; }
    
    // closure body
    x10_float apply(x10_int id__9) {
        
        //#line 180 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        return x10aux::float_utils::fromIntBits(x10aux::int_utils::reverseBytes(x10aux::nullCheck(x10::io::Marshal<void>::
                                                                                                    FMGL(INT__get)())->read(
                                                                                  x10aux::class_cast_unchecked<x10aux::ref<x10::io::Reader> >(fr))));
        
    }
    
    // captured environment
    x10aux::ref<x10::io::FileReader> fr;
    
    x10aux::serialization_id_t _get_serialization_id() {
        return _serialization_id;
    }
    
    void _serialize_body(x10aux::serialization_buffer &buf) {
        buf.write(this->fr);
    }
    
    template<class __T> static x10aux::ref<__T> _deserialize(x10aux::deserialization_buffer &buf) {
        x10aux::ref<KMeansCUDA__closure__0> this_ = new (x10aux::alloc<KMeansCUDA__closure__0>()) KMeansCUDA__closure__0(x10aux::SERIALIZATION_MARKER());
        buf.record_reference(this_); // TODO: avoid; closure
        this_->fr = buf.read<x10aux::ref<x10::io::FileReader> >();
        return this_;
    }
    
    KMeansCUDA__closure__0(x10aux::SERIALIZATION_MARKER) { }
    
    KMeansCUDA__closure__0(x10aux::ref<x10::io::FileReader> fr) {
        this->fr = fr;
    }
    
    static const x10aux::serialization_id_t _serialization_id;
    
    static const x10aux::RuntimeType* getRTT() { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_float> >(); }
    virtual const x10aux::RuntimeType *_type() const { return x10aux::getRTT<x10::lang::Fun_0_1<x10_int, x10_float> >(); }
    
    x10aux::ref<x10::lang::String> toString() {
        return x10::lang::String::Lit("/home/jim/Desktop/X10/bin/KMeansCUDA.x10:180");
    }

};

x10::lang::Fun_0_1<x10_int, x10_float>::itable<KMeansCUDA__closure__0>KMeansCUDA__closure__0::_itable(&KMeansCUDA__closure__0::apply, &Reference::at, &Reference::at, &Reference::equals, &Closure::hashCode, &Reference::home, &KMeansCUDA__closure__0::toString, &Closure::typeName);x10aux::itable_entry KMeansCUDA__closure__0::_itables[2] = {x10aux::itable_entry(&x10::lang::Fun_0_1<x10_int, x10_float>::rtt, &KMeansCUDA__closure__0::_itable),x10aux::itable_entry(NULL, NULL)};
const x10aux::serialization_id_t KMeansCUDA__closure__0::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA__closure__0::_deserialize<x10::lang::Object>);


extern "C" { const char* LNMAP__KMeansCUDA_inc = "N{\"KMeansCUDA.inc\"} F{0:\"/home/jim/Desktop/X10/bin/KMeansCUDA.x10\",} L{557->0:243,15->0:284,17->0:284,19->0:203,18->0:235,564->0:246,21->0:209,562->0:245,23->0:204,22->0:236,25->0:236,24->0:210,27->0:236,573->0:249,26->0:205,569->0:248,30->0:237,35->0:206,32->0:232,33->0:238,513->0:245,37->0:233,515->0:246,524->0:249,41->0:207,520->0:248,47->0:241,45->0:213,533->0:252,50->0:255,49->0:214,48->0:233,54->0:256,528->0:250,53->0:310,531->0:251,52->0:242,58->0:257,57->0:310,542->0:242,537->0:241,61->0:312,611->0:245,1034->0:241,70->0:222,64->0:222,65->0:314,1039->0:242,67->0:243,613->0:246,618->0:248,78->0:224,79->0:248,72->0:245,622->0:249,73->0:222,74->0:246,626->0:250,87->0:250,86->0:228,631->0:252,83->0:249,629->0:251,1054->0:243,635->0:241,92->0:252,94->0:228,90->0:251,103->0:228,577->0:250,1065->0:248,101->0:242,98->0:257,580->0:251,96->0:241,582->0:252,97->0:257,1069->0:249,1058->0:245,111->0:257,586->0:241,109->0:228,1060->0:246,591->0:242,119->0:228,1083->0:253,116->0:243,1087->0:255,1084->0:254,127->0:257,1075->0:251,126->0:228,1073->0:250,123->0:246,1077->0:252,121->0:245,120->0:257,606->0:243,136->0:261,139->0:262,684->0:241,141->0:252,143->0:262,680->0:252,128->0:248,678->0:251,130->0:258,675->0:250,132->0:249,154->0:262,145->0:241,147->0:262,148->0:262,149->0:262,150->0:242,689->0:242,171->0:262,170->0:262,655->0:243,172->0:246,162->0:262,160->0:262,640->0:242,165->0:243,187->0:268,185->0:250,671->0:249,190->0:252,191->0:269,188->0:251,667->0:248,178->0:262,660->0:245,662->0:246,177->0:262,181->0:263,205->0:275,201->0:274,738->0:242,199->0:242,198->0:272,195->0:271,194->0:241,221->0:277,760->0:246,216->0:276,219->0:245,765->0:248,212->0:275,214->0:243,753->0:243,208->0:275,758->0:245,239->0:252,237->0:251,234->0:250,716->0:248,233->0:278,230->0:249,704->0:243,228->0:277,709->0:245,226->0:248,711->0:246,224->0:277,729->0:252,733->0:241,248->0:242,720->0:249,247->0:279,724->0:250,243->0:278,727->0:251,275->0:248,822->0:250,279->0:286,276->0:286,818->0:249,283->0:286,831->0:241,825->0:251,286->0:251,827->0:252,257->0:280,807->0:245,263->0:243,802->0:243,261->0:281,267->0:283,814->0:248,270->0:246,271->0:284,809->0:246,268->0:245,787->0:242,310->0:287,313->0:288,312->0:243,317->0:290,319->0:246,288->0:287,291->0:287,773->0:250,292->0:241,295->0:287,769->0:249,782->0:241,297->0:242,300->0:287,778->0:252,776->0:251,342->0:296,880->0:241,341->0:241,885->0:242,338->0:296,337->0:252,350->0:297,349->0:297,346->0:297,324->0:248,867->0:249,322->0:291,871->0:250,335->0:296,874->0:251,332->0:250,876->0:252,331->0:293,328->0:292,373->0:306,851->0:243,369->0:305,368->0:246,381->0:250,858->0:246,383->0:306,856->0:245,863->0:248,377->0:306,356->0:300,357->0:302,352->0:298,836->0:242,364->0:304,366->0:245,361->0:243,956->0:246,410->0:243,415->0:245,954->0:245,949->0:243,395->0:242,386->0:307,934->0:242,384->0:251,391->0:310,929->0:241,390->0:241,389->0:308,925->0:252,444->0:242,923->0:251,920->0:250,433->0:251,916->0:249,435->0:252,912->0:248,439->0:241,426->0:249,907->0:246,905->0:245,430->0:250,417->0:246,900->0:243,422->0:248,479->0:250,1018->0:250,1021->0:251,475->0:249,1023->0:252,471->0:248,1010->0:248,466->0:246,1014->0:249,464->0:245,1003->0:245,1005->0:246,459->0:243,998->0:243,508->0:243,978->0:241,983->0:242,493->0:242,969->0:250,974->0:252,488->0:241,972->0:251,484->0:252,961->0:248,965->0:249,482->0:251,} M{}"; }
