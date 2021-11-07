set(CMAKE_C_COMPILER "/bin/cc")
set(CMAKE_C_COMPILER_ARG1 "")
set(CMAKE_C_COMPILER_ID "GNU")
set(CMAKE_C_COMPILER_VERSION "8.4.1")
set(CMAKE_C_COMPILER_VERSION_INTERNAL "")
set(CMAKE_C_COMPILER_WRAPPER "")
set(CMAKE_C_STANDARD_COMPUTED_DEFAULT "11")
set(CMAKE_C_COMPILE_FEATURES "c_std_90;c_function_prototypes;c_std_99;c_restrict;c_variadic_macros;c_std_11;c_static_assert")
set(CMAKE_C90_COMPILE_FEATURES "c_std_90;c_function_prototypes")
set(CMAKE_C99_COMPILE_FEATURES "c_std_99;c_restrict;c_variadic_macros")
set(CMAKE_C11_COMPILE_FEATURES "c_std_11;c_static_assert")

set(CMAKE_C_PLATFORM_ID "Linux")
set(CMAKE_C_SIMULATE_ID "")
set(CMAKE_C_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_C_SIMULATE_VERSION "")




set(CMAKE_AR "/bin/ar")
set(CMAKE_C_COMPILER_AR "/bin/gcc-ar")
set(CMAKE_RANLIB "/bin/ranlib")
set(CMAKE_C_COMPILER_RANLIB "/bin/gcc-ranlib")
set(CMAKE_LINKER "/bin/ld")
set(CMAKE_MT "")
set(CMAKE_COMPILER_IS_GNUCC 1)
set(CMAKE_C_COMPILER_LOADED 1)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_C_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW )
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_C_COMPILER_ENV_VAR "CC")

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_C_COMPILER_ID_RUN 1)
set(CMAKE_C_SOURCE_FILE_EXTENSIONS c;m)
set(CMAKE_C_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_C_LINKER_PREFERENCE 10)

# Save compiler ABI information.
set(CMAKE_C_SIZEOF_DATA_PTR "8")
set(CMAKE_C_COMPILER_ABI "ELF")
set(CMAKE_C_LIBRARY_ARCHITECTURE "")

if(CMAKE_C_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_C_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_C_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_C_COMPILER_ABI}")
endif()

if(CMAKE_C_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_C_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_C_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_C_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES "/software/spackages/linux-centos8-x86_64/gcc-8.4.1/boost-1.65.0-7khgefmy7b6h33q2bvsa4gwbtyathj37/include;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/hwloc-1.11.11-lomvaodzuhiy6e4ep77gizazaudfd7lw/include;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/libiconv-1.16-5w3k7reekk6hcreoiw4ctkidltpery7x/include;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/libpciaccess-0.16-vk6vkhypqo2gantbng2hifdkzsfa4vi6/include;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/libxml2-2.9.10-4juad7kpcxw7ko2ubahhi7tnlritl2aq/include;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/numactl-2.0.14-rh7djo5fq4g5kee4wijvqxqinr7stx3r/include;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/openmpi-3.1.6-vgm2v2kplihuze3q5ozerlxzman3scic/include;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/zlib-1.2.11-gvnjtfqd5zskg2eeduzbqlakpdmpzne4/include;/software/spackages/linux-centos8-x86_64/gcc-8.3.1/cuda-10.2.89-bsydnscqeeeoytpr2buzenenj2uex3ux/include;/usr/lib/gcc/x86_64-redhat-linux/8/include;/usr/local/include;/usr/include")
set(CMAKE_C_IMPLICIT_LINK_LIBRARIES "gcc;gcc_s;c;gcc;gcc_s")
set(CMAKE_C_IMPLICIT_LINK_DIRECTORIES "/usr/lib/gcc/x86_64-redhat-linux/8;/usr/lib64;/lib64;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/boost-1.65.0-7khgefmy7b6h33q2bvsa4gwbtyathj37/lib;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/hwloc-1.11.11-lomvaodzuhiy6e4ep77gizazaudfd7lw/lib;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/libiconv-1.16-5w3k7reekk6hcreoiw4ctkidltpery7x/lib;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/libpciaccess-0.16-vk6vkhypqo2gantbng2hifdkzsfa4vi6/lib;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/libxml2-2.9.10-4juad7kpcxw7ko2ubahhi7tnlritl2aq/lib;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/numactl-2.0.14-rh7djo5fq4g5kee4wijvqxqinr7stx3r/lib;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/openmpi-3.1.6-vgm2v2kplihuze3q5ozerlxzman3scic/lib;/software/spackages/linux-centos8-x86_64/gcc-8.4.1/zlib-1.2.11-gvnjtfqd5zskg2eeduzbqlakpdmpzne4/lib;/software/spackages/linux-centos8-x86_64/gcc-8.3.1/cuda-10.2.89-bsydnscqeeeoytpr2buzenenj2uex3ux/lib64;/usr/lib")
set(CMAKE_C_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
