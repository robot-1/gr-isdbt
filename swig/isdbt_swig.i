/* -*- c++ -*- */

#define ISDBT_API

%include "gnuradio.i"           // the common stuff

//load generated python docstrings
%include "isdbt_swig_doc.i"

%{
#include "isdbt/ofdm_synchronization.h"
#include "isdbt/tmcc_decoder.h"
#include "isdbt/frequency_deinterleaver.h"
#include "isdbt/time_deinterleaver.h"
#include "isdbt/symbol_demapper.h"
#include "isdbt/bit_deinterleaver.h"
#include "isdbt/viterbi_decoder.h"
#include "isdbt/byte_deinterleaver.h"
#include "isdbt/energy_descrambler.h"
#include "isdbt/reed_solomon_dec_isdbt.h"
#include "isdbt/tmcc_encoder.h"
#include "isdbt/pilot_signals.h"
#include "isdbt/frequency_interleaver.h"
#include "isdbt/time_interleaver.h"
#include "isdbt/hierarchical_combinator.h"
#include "isdbt/carrier_modulation.h"
#include "isdbt/byte_interleaver.h"
#include "isdbt/energy_dispersal.h"
%}

%include "isdbt/ofdm_synchronization.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, ofdm_synchronization);
%include "isdbt/tmcc_decoder.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, tmcc_decoder);
%include "isdbt/frequency_deinterleaver.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, frequency_deinterleaver);
%include "isdbt/time_deinterleaver.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, time_deinterleaver);
%include "isdbt/symbol_demapper.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, symbol_demapper);
%include "isdbt/bit_deinterleaver.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, bit_deinterleaver);
%include "isdbt/viterbi_decoder.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, viterbi_decoder);
%include "isdbt/byte_deinterleaver.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, byte_deinterleaver);
%include "isdbt/energy_descrambler.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, energy_descrambler);
%include "isdbt/reed_solomon_dec_isdbt.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, reed_solomon_dec_isdbt);
%include "isdbt/tmcc_encoder.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, tmcc_encoder);
%include "isdbt/pilot_signals.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, pilot_signals);
%include "isdbt/frequency_interleaver.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, frequency_interleaver);
%include "isdbt/time_interleaver.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, time_interleaver);
%include "isdbt/hierarchical_combinator.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, hierarchical_combinator);
%include "isdbt/carrier_modulation.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, carrier_modulation);
%include "isdbt/byte_interleaver.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, byte_interleaver);
%include "isdbt/energy_dispersal.h"
GR_SWIG_BLOCK_MAGIC2(isdbt, energy_dispersal);
