#//////////////////////////////////////////////////////////////////////////////
#   -- MAGMA (version 2.6.1) --
#      Univ. of Tennessee, Knoxville
#      Univ. of California, Berkeley
#      Univ. of Colorado, Denver
#      @date July 2021
#//////////////////////////////////////////////////////////////////////////////



# --------------------
# configuration

# should MAGMA be built on CUDA (NVIDIA only) or HIP (AMD or NVIDIA)
# enter 'cuda' or 'hip' respectively
BACKEND     ?= cuda

# set these to their real paths
OPENBLASDIR ?= /usr/lib/x86_64-linux-gnu/libopenblas.a
CUDADIR     ?= /usr/local/cuda
HIPDIR      ?= /opt/rocm/hip

# require either hip or cuda
ifeq (,$(findstring $(BACKEND),hip cuda))
    $(error "'BACKEND' should be either 'cuda' or 'hip' (got $(BACKEND))")
endif

# --------------------
# programs

# set compilers
CC          ?= gcc
CXX         ?= g++
FORT        ?= gfortran
HIPCC       ?= hipcc
NVCC        ?= nvcc
DEVCC       ?= NONE

# set from 'BACKEND'
ifeq ($(BACKEND),cuda)
    DEVCC = $(NVCC)
else ifeq ($(BACKEND),hip)
    DEVCC = $(HIPCC)
endif

# and utilities
ARCH      = ar
ARCHFLAGS = cr
RANLIB    = ranlib


# --------------------
# flags/settings

# set our GPU targets
ifeq ($(BACKEND),cuda)
    # For newer cards
    #GPU_TARGET = Pascal Volta Turing Ampere
    GPU_TARGET = sm_52 sm_60 sm_61 sm_70 sm_75 sm_80 sm_86
else ifeq ($(BACKEND),hip)
    GPU_TARGET = gfx803 gfx900 gfx901
endif

# Use -fPIC to make shared (.so) and static (.a) library;
# can be commented out if making only static library.
FPIC      = -fPIC

# now, generate our flags
CFLAGS      = -O3 $(FPIC) -DNDEBUG -DADD_ -Wall -fopenmp -std=c99
CXXFLAGS    = -O3 $(FPIC) -DNDEBUG -DADD_ -Wall -fopenmp -std=c++11
FFLAGS      = -O3 $(FPIC) -DNDEBUG -DADD_ -Wall -Wno-unused-dummy-argument
F90FLAGS    = -O3 $(FPIC) -DNDEBUG -DADD_ -Wall -Wno-unused-dummy-argument -x f95-cpp-input
LDFLAGS     =     $(FPIC)                       -fopenmp

DEVCCFLAGS  = -O3         -DNDEBUG -DADD_       

# DEVCCFLAGS are populated later in `backend-specific`


# --------------------
# libraries

# gcc with OpenBLAS (includes LAPACK)
LIB       += -lopenblas

# --------------------
# directories

# define library directories preferably in your environment, or here.
LIBDIR    += -L$(OPENBLASDIR)/lib
INC       += 


# --------------------
# checks

# check for openblas
-include make.check-openblas


# --------------------
# backend-specific

# add appropriate cuda flags
ifeq ($(BACKEND),cuda)
    -include make.check-cuda

    DEVCCFLAGS += -Xcompiler "$(FPIC)" -std=c++11

    # link with cuda specific libraries
    LIB += -lcublas -lcusparse -lcudart -lcudadevrt
    INC += -I$(CUDADIR)/include

endif

# add appropriate HIP flags
ifeq ($(BACKEND),hip)
    -include make.check-hip

    DEVCCFLAGS += $(FPIC) -std=c++11

    #TODO: see if we need to link any HIP libraries
    #LIB += -lhip_hcc -lhsa-runtime64
    INC += -I$(HIPDIR)/include

endif
