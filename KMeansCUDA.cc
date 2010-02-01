#include <KMeansCUDA.h>


#include "KMeansCUDA.inc"

void KMeansCUDA::_instance_init() {
    _I_("Doing initialisation for class: KMeansCUDA");
    
}


//#line 145 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
void KMeansCUDA::printClusters(x10aux::ref<x10::lang::Rail<x10_float > > clusters,
                               x10_int dims) {
    
    //#line 146 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    {
        x10_int d;
        for (
             //#line 146 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
             d = ((x10_int)0); ((d) < (dims)); 
                                               //#line 146 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                                               d += ((x10_int)1))
        {
            
            //#line 147 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            {
                x10_int k;
                for (
                     //#line 147 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                     k =
                       ((x10_int)0);
                     ((k) < (((x10_int) ((x10aux::nullCheck(clusters)->
                                            FMGL(length)) / (dims)))));
                     
                     //#line 147 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                     k +=
                       ((x10_int)1))
                {
                    
                    //#line 148 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    if (((k) > (((x10_int)0))))
                    {
                        
                        //#line 148 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                        x10aux::nullCheck(x10::io::Console::
                                            FMGL(OUT__get)())->print(
                          x10::lang::String::Lit(" "));
                    }
                    
                    //#line 149 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10aux::nullCheck(x10::io::Console::
                                        FMGL(OUT__get)())->printf(
                      x10::lang::String::Lit("%.2f"),
                      x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Object> >(x10::lang::Box<void>::__implicit_convert<x10_float >(
                                                                                      (*clusters)[((x10_int) ((((x10_int) ((k) * (dims)))) + (d)))])));
                }
            }
            
            //#line 151 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10aux::nullCheck(x10::io::Console::
                                FMGL(OUT__get)())->println();
        }
    }
    
}

//#line 155 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
x10_int KMeansCUDA::round_up(x10_int x, x10_int n) {
    
    //#line 155 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    return ((x10_int) ((((x10_int) ((((x10_int) ((x) - (((x10_int)1))))) - (((x10_int) ((((x10_int) ((x) - (((x10_int)1))))) % (n))))))) + (n)));
    
}

//#line 157 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
#include <x10/lang/Runtime.h>
#include <x10aux/bootstrap.h>
extern "C" { int main(int ac, char **av) { return x10aux::template_main<x10::lang::Runtime,KMeansCUDA>(ac,av); } }

void KMeansCUDA::main(x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > > args) {
    
    //#line 158 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
    try {
        
        //#line 159 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::util::OptionsParser> opts = x10::util::OptionsParser::_make(args,
                                                                                     (x10aux::ref<x10::lang::ValRail<x10::util::Option > >)x10aux::alloc_rail<x10::util::Option,
                                                                                     x10::lang::ValRail<x10::util::Option > >(2,(x10::util::Option_methods::_make(x10::lang::String::Lit("q"),
                                                                                                                                                                  x10::lang::String::Lit("quiet"),
                                                                                                                                                                  x10::lang::String::Lit("just print time taken"))),(x10::util::Option_methods::_make(x10::lang::String::Lit("v"),
                                                                                                                                                                                                                                                      x10::lang::String::Lit("verbose"),
                                                                                                                                                                                                                                                      x10::lang::String::Lit("print out each iteration")))),
                                                                                     (x10aux::ref<x10::lang::ValRail<x10::util::Option > >)x10aux::alloc_rail<x10::util::Option,
                                                                                     x10::lang::ValRail<x10::util::Option > >(5,(x10::util::Option_methods::_make(x10::lang::String::Lit("p"),
                                                                                                                                                                  x10::lang::String::Lit("points"),
                                                                                                                                                                  x10::lang::String::Lit("location of data file"))),(x10::util::Option_methods::_make(x10::lang::String::Lit("i"),
                                                                                                                                                                                                                                                      x10::lang::String::Lit("iterations"),
                                                                                                                                                                                                                                                      x10::lang::String::Lit("quit after this many iterations"))),(x10::util::Option_methods::_make(x10::lang::String::Lit("c"),
                                                                                                                                                                                                                                                                                                                                                    x10::lang::String::Lit("clusters"),
                                                                                                                                                                                                                                                                                                                                                    x10::lang::String::Lit("number of clusters to find"))),(x10::util::Option_methods::_make(x10::lang::String::Lit("s"),
                                                                                                                                                                                                                                                                                                                                                                                                                                             x10::lang::String::Lit("slices"),
                                                                                                                                                                                                                                                                                                                                                                                                                                             x10::lang::String::Lit("factor by which to oversubscribe computational resources"))),(x10::util::Option_methods::_make(x10::lang::String::Lit("n"),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    x10::lang::String::Lit("num"),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    x10::lang::String::Lit("quantity of points")))));
        
        //#line 168 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::String> fname =
          x10aux::nullCheck(opts)->x10::util::OptionsParser::apply(
            x10::lang::String::Lit("-p"),
            x10::lang::String::Lit("points.dat"));
        
        //#line 168 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int num_clusters = x10aux::nullCheck(opts)->x10::util::OptionsParser::apply(
                                 x10::lang::String::Lit("-c"),
                                 ((x10_int)8));
        
        //#line 169 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int num_slices = x10aux::nullCheck(opts)->x10::util::OptionsParser::apply(
                               x10::lang::String::Lit("-s"),
                               ((x10_int)4));
        
        //#line 169 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int num_global_points = x10aux::nullCheck(opts)->x10::util::OptionsParser::apply(
                                      x10::lang::String::Lit("-n"),
                                      ((x10_int)100000));
        
        //#line 170 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int iterations = x10aux::nullCheck(opts)->x10::util::OptionsParser::apply(
                               x10::lang::String::Lit("-i"),
                               ((x10_int)500));
        
        //#line 171 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_boolean verbose = x10aux::nullCheck(opts)->x10::util::OptionsParser::apply(
                                x10::lang::String::Lit("-v"));
        
        //#line 171 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_boolean quiet = x10aux::nullCheck(opts)->x10::util::OptionsParser::apply(
                              x10::lang::String::Lit("-q"));
        
        //#line 173 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int MEM_ALIGN = ((x10_int)32);
        
        //#line 175 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        if (!(quiet)) {
            
            //#line 176 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10aux::nullCheck(x10::io::Console::
                                FMGL(OUT__get)())->x10::io::Printer::println(
              x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Any> >(x10::lang::String::Lit("points: ") +
              x10aux::safe_to_string(num_global_points) +
              x10::lang::String::Lit(" clusters: ") +
              x10aux::safe_to_string(num_clusters) +
              x10::lang::String::Lit(" dim: ") +
              x10aux::safe_to_string(((x10_int)4))));
        }
        
        //#line 179 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::io::File> file =
          x10::io::File::_make(fname);
        
        //#line 179 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::io::FileReader> fr =
          x10aux::nullCheck(file)->openRead();
        
        //#line 180 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_float> > init_points =
          x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_float> > >(x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_float> >(x10aux::ref<KMeansCUDA__closure__0>(new (x10aux::alloc<x10::lang::Fun_0_1<x10_int, x10_float> >(sizeof(KMeansCUDA__closure__0)))KMeansCUDA__closure__0(fr))));
        
        //#line 181 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10_int num_file_points = ((x10_int) (((x10_long) ((((x10_long) ((x10aux::nullCheck(file)->size()) / (((x10_long) (((x10_int)4))))))) / (((x10_long) (((x10_int)4))))))));
        
        //#line 182 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::ValRail<x10_float > > file_points =
          x10::lang::ValRail<x10_float >::make(((x10_int) ((num_file_points) * (((x10_int)4)))), init_points);
        
        //#line 184 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<x10::lang::Rail<x10_float > > results;
        
        //#line 187 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<DistributedRail<x10_float> > clusters =
          DistributedRail<x10_float>::_make(((x10_int) ((num_clusters) * (((x10_int)4)))),
                                            file_points);
        
        //#line 188 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        x10aux::ref<DistributedRail<x10_int> > cluster_counts =
          DistributedRail<x10_int>::_make(num_clusters,
                                          x10aux::class_cast_unchecked<x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_int> > >(x10aux::ref<x10::lang::Fun_0_1<x10_int, x10_int> >(x10aux::ref<KMeansCUDA__closure__1>(new (x10aux::alloc<x10::lang::Fun_0_1<x10_int, x10_int> >(sizeof(KMeansCUDA__closure__1)))KMeansCUDA__closure__1()))));
        
        //#line 190 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        try {
        try {
            
            //#line 190 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::startFinish();
            {
                
                //#line 190 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10::lang::Runtime::runAsync(
                  x10aux::class_cast_unchecked<x10aux::ref<x10::lang::VoidFun_0_0> >(x10aux::ref<x10::lang::VoidFun_0_0>(x10aux::ref<KMeansCUDA__closure__2>(new (x10aux::alloc<x10::lang::VoidFun_0_0>(sizeof(KMeansCUDA__closure__2)))KMeansCUDA__closure__2(num_global_points, num_slices, quiet, MEM_ALIGN, file_points, num_file_points, iterations, clusters, num_clusters, cluster_counts, verbose)))));
            }
        }
        catch (x10aux::__ref& __ref__22) {
            x10aux::ref<x10::lang::Throwable>& __exc__ref__22 = (x10aux::ref<x10::lang::Throwable>&)__ref__22;
            
            //#line 190 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            if (x10aux::instanceof<x10aux::ref<x10::lang::Throwable> >(__exc__ref__22)) {
                x10aux::ref<x10::lang::Throwable> __desugarer__var__6__ =
                  static_cast<x10aux::ref<x10::lang::Throwable> >(__exc__ref__22);
                {
                    
                    //#line 190 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                    x10::lang::Runtime::pushException(
                      __desugarer__var__6__);
                }
            } else
            throw;
        }
        } catch (...) {
            {
                
                //#line 190 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                x10::lang::Runtime::stopFinish();
            }
            throw;
        }
        {
            
            //#line 190 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
            x10::lang::Runtime::stopFinish();
        }
    }
    catch (x10aux::__ref& __ref__23) {
        x10aux::ref<x10::lang::Throwable>& __exc__ref__23 = (x10aux::ref<x10::lang::Throwable>&)__ref__23;
        
        //#line 316 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
        if (x10aux::instanceof<x10aux::ref<x10::lang::Throwable> >(__exc__ref__23)) {
            x10aux::ref<x10::lang::Throwable> e =
              static_cast<x10aux::ref<x10::lang::Throwable> >(__exc__ref__23);
            {
                
                //#line 317 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
                (e)->printStackTrace(x10::io::Console::
                                       FMGL(ERR__get)());
            }
        } else
        throw;
    }
}

//#line 143 "/home/jim/Desktop/X10/bin/KMeansCUDA.x10"
void KMeansCUDA::_constructor() {
    this->x10::lang::Object::_constructor();
    
}
x10aux::ref<KMeansCUDA> KMeansCUDA::_make(
  ) {
    x10aux::ref<KMeansCUDA> this_ = new (x10aux::alloc<KMeansCUDA>()) KMeansCUDA();
    this_->_constructor();
    return this_;
}


const x10aux::serialization_id_t KMeansCUDA::_serialization_id = 
    x10aux::DeserializationDispatcher::addDeserializer(KMeansCUDA::_deserializer<x10::lang::Object>);

void KMeansCUDA::_serialize_body(x10aux::serialization_buffer& buf) {
    x10::lang::Object::_serialize_body(buf);
    
}

void KMeansCUDA::_deserialize_body(x10aux::deserialization_buffer& buf) {
    x10::lang::Object::_deserialize_body(buf);
    
}

x10aux::RuntimeType KMeansCUDA::rtt;
void KMeansCUDA::_initRTT() {
    rtt.canonical = &rtt;
    const x10aux::RuntimeType* parents[1] = { x10aux::getRTT<x10::lang::Object>()};
    rtt.init(&rtt, "KMeansCUDA", 1, parents, 0, NULL, NULL);
}

extern "C" { const char* LNMAP__KMeansCUDA_cc = "N{\"KMeansCUDA.cc\"} F{0:\"/home/jim/Desktop/X10/bin/KMeansCUDA.x10\",1:\"KMeansCUDA\",2:\"printClusters\",3:\"x10.lang.Void\",4:\"x10.lang.Rail[x10.lang.Float]{_self148683.home==here}\",5:\"x10.lang.Int\",6:\"void\",7:\"x10aux::ref<x10::lang::Rail<x10_float > >\",8:\"x10_int\",9:\"round_up\",10:\"main\",11:\"x10.lang.Rail[x10.lang.String]{_self182879.home==here}\",12:\"x10aux::ref<x10::lang::Rail<x10aux::ref<x10::lang::String> > >\",13:\"this\",14:\"\",15:\"_constructor\",} L{138->0:171,142->0:173,129->0:170,13->0:145,134->0:171,18->0:146,21->0:146,156->0:176,23->0:146,159->0:179,145->0:175,148->0:176,28->0:147,31->0:147,171->0:181,174->0:182,37->0:147,42->0:148,163->0:179,46->0:148,167->0:180,186->0:188,49->0:148,191->0:190,52->0:149,178->0:184,57->0:150,63->0:152,61->0:151,181->0:187,69->0:155,207->0:190,201->0:314,66->0:153,202->0:314,77->0:157,199->0:190,72->0:155,74->0:155,195->0:190,84->0:158,87->0:159,223->0:190,213->0:190,215->0:314,237->0:316,232->0:316,231->0:314,230->0:190,108->0:168,224->0:314,119->0:169,252->0:143,114->0:168,249->0:319,245->0:318,124->0:169,243->0:317,} M{6 1.15()->14 1.13();6 1.10(12)->3 1.10(11);8 1.9(8,8)->5 1.9(5,5);6 1.2(7,8)->3 1.2(4,5);}"; }
