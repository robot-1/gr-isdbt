# Copyright 2011,2012,2016,2018,2019 Free Software Foundation, Inc.
#
# This file was generated by gr_modtool, a tool from the GNU Radio framework
# This file is a part of gr-isdbt
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

########################################################################
# Setup library
########################################################################
include(GrPlatform) #define LIB_SUFFIX

list(APPEND isdbt_sources
    ofdm_synchronization_impl.cc
    tmcc_decoder_impl.cc
    frequency_deinterleaver_impl.cc
    time_deinterleaver_impl.cc
    symbol_demapper_impl.cc
    bit_deinterleaver_impl.cc
    viterbi_decoder_impl.cc
    byte_deinterleaver_impl.cc
    energy_descrambler_impl.cc
    reed_solomon_dec_isdbt_impl.cc
    tmcc_encoder_impl.cc
    pilot_signals_impl.cc
    frequency_interleaver_impl.cc
    time_interleaver_impl.cc
    hierarchical_combinator_impl.cc
    carrier_modulation_impl.cc
    byte_interleaver_impl.cc
    energy_dispersal_impl.cc
)

set(isdbt_sources "${isdbt_sources}" PARENT_SCOPE)
if(NOT isdbt_sources)
    MESSAGE(STATUS "No C++ sources... skipping lib/")
    return()
endif(NOT isdbt_sources)

add_library(gnuradio-isdbt SHARED ${isdbt_sources})
target_link_libraries(gnuradio-isdbt gnuradio::gnuradio-runtime gnuradio::gnuradio-blocks gnuradio::gnuradio-fft gnuradio::gnuradio-filter gnuradio::gnuradio-fec Volk::volk)
target_include_directories(gnuradio-isdbt
    PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
    PUBLIC $<INSTALL_INTERFACE:include>
  )
set_target_properties(gnuradio-isdbt PROPERTIES DEFINE_SYMBOL "gnuradio_isdbt_EXPORTS")

if(APPLE)
    set_target_properties(gnuradio-isdbt PROPERTIES
        INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib"
    )
endif(APPLE)

####################
# This should check if SSE2 is available or not (necessary for the viterbi decoder)
####################

include (CheckCCompilerFlag)
if (MSVC)
    # 64-bit MSVC always supports SSE2
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(SSE2_SUPPORTED true)
    else()
        check_c_compiler_flag("/arch:SSE2" SSE2_SUPPORTED)
    endif(CMAKE_SIZEOF_VOID_P EQUAL 8)
else ()
    # The "correct" way to test this would be to run
    # check_c_compiler_flag("-msse2")
    # ...but that's not reliable, in particular, on Clang and ARM, it will
    # return TRUE when it shouldn't. Hence, we compile this snippet
    # manually.
    check_c_source_compiles(
        "#include <emmintrin.h>\nint main(){__m128i m0, m1, m2; m0 = _mm_add_epi8(m1, m2);}"
        SSE2_SUPPORTED
    )
endif(MSVC)

if(SSE2_SUPPORTED)
    if(NOT MSVC)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse2")
    else()
        if (CMAKE_SIZEOF_VOID_P EQUAL 4)
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /arch:SSE2")
        endif ()
    endif()
#    target_compile_definitions(gnuradio-dtv PRIVATE -DDTV_SSE2)
    add_definitions(-DDTV_SSE2=1)
endif(SSE2_SUPPORTED)

########################################################################
# Install built library files
########################################################################
include(GrMiscUtils)
GR_LIBRARY_FOO(gnuradio-isdbt)

########################################################################
# Print summary
########################################################################
message(STATUS "Using install prefix: ${CMAKE_INSTALL_PREFIX}")
message(STATUS "Building for version: ${VERSION} / ${LIBVER}")

########################################################################
# Build and register unit test
########################################################################
include(GrTest)

# If your unit tests require special include paths, add them here
#include_directories()
# List all files that contain Boost.UTF unit tests here
list(APPEND test_isdbt_sources
)
# Anything we need to link to for the unit tests go here
list(APPEND GR_TEST_TARGET_DEPS gnuradio-isdbt)

if(NOT test_isdbt_sources)
    MESSAGE(STATUS "No C++ unit tests... skipping")
    return()
endif(NOT test_isdbt_sources)

foreach(qa_file ${test_isdbt_sources})
    GR_ADD_CPP_TEST("isdbt_${qa_file}"
        ${CMAKE_CURRENT_SOURCE_DIR}/${qa_file}
    )
endforeach(qa_file)
