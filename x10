#!/bin/bash
# DO NOT EDIT - This file was automatically generated.

#JAVA='/usr/lib/jvm/java-6-sun-1.6.0.15/jre/bin/java'
[ -n "$JAVA_HOME" ] || JAVA_HOME='${env.JAVA_HOME}'
[ -n "$JRE_HOME" ] || JRE_HOME='/usr/lib/jvm/java-6-sun-1.6.0.15/jre'
#FILE_SEP='/'
#PATH_SEP=':'
#CONFIG_FILE='standard.cfg'
POLYGLOT_JAR='polyglot3.jar'
LPG_JAR='lpg.jar'
ECJ_JAR='ecj.jar'
POLYGLOT_URL='http://polyglot-compiler.googlecode.com/svn/trunk/updates/plugins/polyglot3_3.1.1.jar'
LPG_URL='http://lpg.sourceforge.net/updates/plugins/lpg.runtime_2.0.17.jar'
ECJ_URL='http://download.eclipse.org/eclipse/downloads/drops/R-3.4.1-200809111700/ecj-3.4.1.jar'

UNAME=`uname -smp | sed -e 's/ /,/g'`
FILE_SEP='/'; if [[ "$UNAME" = CYGWIN* ]]; then FILE_SEP='\\'; fi
PATH_SEP=':'; if [[ "$UNAME" = CYGWIN* ]]; then PATH_SEP=';'; fi
[ -n "$X10_PLATFORM" ] || \
case "$UNAME" in
  CYGWIN*,i*86,*) export X10_PLATFORM='win32_x86';;
  Linux,*86*,*) export X10_PLATFORM='linux_x86';;
  Linux,ppc*,*) export X10_PLATFORM='linux_ppc';;
  AIX,*,powerpc) export X10_PLATFORM='aix_ppc';;
  Darwin,*,i*86) export X10_PLATFORM='macosx_x86';;
  Darwin,*,powerpc) export X10_PLATFORM='macosx_ppc';;
  SunOS,*,sparc) export X10_PLATFORM='sunos_sparc';;
  *) echo "Unrecognized platform: '$UNAME'"; exit 1;;
esac
# NOTE: the above assumes that Cygwin==win32 (probably valid)

prog="$(readlink $0 2>&1)"
[ $? -eq 127 -o "$prog" = "" ] && prog="$0"
TOP="$(cd "$(dirname $prog)/.." && pwd)"
if [[ "$UNAME" = CYGWIN* ]]; then TOP="$(cygpath -am "$TOP")"; fi

if [ -n "$JAVA_HOME" -a -e "$JAVA_HOME/bin/java" ]; then
    JAVA="$JAVA_HOME/bin/java"
elif [ -n "$JRE_HOME" -a -e "$JRE_HOME/bin/java" ]; then
    JAVA="$JRE_HOME/bin/java"
else
    echo "JAVA_HOME ($JAVA_HOME) is not pointing to a JRE or a JDK"
    exit 1
fi
if [[ "$UNAME" = CYGWIN* ]]; then JAVA="$(cygpath -au "$JAVA")"; fi
if [[ "$UNAME" = CYGWIN* ]]; then JAVA_HOME="$(cygpath -am "$JAVA_HOME")"; fi

help=""
time=""
verbose=""
extra_cp=""
extra_lib=""
mx=""
defs=""
dev=""
java_args=""
args=""

while [ -n "$1" ]; do
    case "$1" in
        -h|-help|--help) help="1"; break;;
        -v|-verbose|--verbose) verbose="1";;
        -t|-time) time="time ";;
        -mx) shift; mx="$1";;
        -D*) if [[ "${1##-D}" = java.library.path=* ]]; then
                 echo >&2 "Error: Cannot reset java.library.path, use -libpath instead"
                 exit 1
             fi
             # TODO: add tests for more system properties above
             defs="${defs} $1";;
        -classpath|-cp) shift; extra_cp="$1";;
        -libpath) shift; extra_lib="$1";;
        -config) shift; config="$1.cfg";;
        -dev) dev="true";;
        -J*) java_args="${java_args} '${1##-J}'";;
        -*=*) java_args="${java_args} -Dx10.${1##-}";;
        -*) java_args="${java_args} -Dx10.${1##-}=true";;
        *.x10) args="$args '${1%%.x10}\$Main'"; shift; args="$args $*"; break;;
        *) args="$args '$1\$Main'"; shift; args="$args $*"; break;;
    esac
    shift
done

if [ -n "$help" -o -z "$args" ]; then
    cat << EOF
Usage: x10 [options] <main-class> [arg0 arg1 ...]
where [options] includes:
    -t -time                 display execution time
    -v -verbose --verbose    print verbose debugging information
    -h -help --help          print this message
    -mx <size>               set max heap size, e.g., -mx 200M
    -D<name>=<value>         set system property <name> to <value>
    -classpath <path>        search path for class files
    -libpath <path>          search path for native libraries
    -config <conf>           (IGNORED) read configuration from etc${FILE_SEP}<conf>.cfg
    -dev                     developer mode (use unpackaged X10 libraries)
    -J<arg>                  [USE WITH CAUTION] pass <arg> directly to java.
        e.g., use -J-verbose to make java execution verbose.
EOF
    exit 1
fi


CONFIG_DIR="${TOP}${FILE_SEP}etc"
LIB_DIR="${TOP}${FILE_SEP}lib"

[ -n "$config" ] && config="-Dx10.configuration=\"${CONFIG_DIR}${FILE_SEP}${config}\""

classpath=""
[ -n "$dev" ] && classpath="${TOP}${FILE_SEP}..${FILE_SEP}x10.runtime${FILE_SEP}classes${PATH_SEP}"
classpath=".${PATH_SEP}${classpath}${LIB_DIR}${FILE_SEP}x10.jar"

if [ -n "$extra_cp" ]; then
   classpath="$extra_cp${PATH_SEP}$classpath"
fi

externpath="${TOP}${FILE_SEP}lib${FILE_SEP}${X10_PLATFORM}"
if [ -n "$extra_lib" ]; then
   externpath="$extra_lib${PATH_SEP}$externpath"
fi

java_args="-Djava.library.path=\"$externpath\" -ea -classpath \"$classpath\" ${java_args}"

if [ -n "$mx" ]; then
   java_args="-Xmx$mx $java_args"
fi
java_args="${java_args} ${defs}"

command="\"$JAVA\" $java_args $config $args"

[ -n "$verbose" ] && echo "$command"

eval "$time$command"
exit $?

