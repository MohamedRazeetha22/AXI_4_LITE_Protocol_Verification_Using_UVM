`ifndef AXI_TEST_PKG
`define AXI_TEST_PKG
package axi_test_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import axi_agent_pkg::*;
import axi_environment_pkg::*;
/*include all sequences
`include "axi_base_sequence.sv"
`include "axi_write_sequence.sv"
`include "axi_read_sequence.sv"
`include "axi_write_read_sequence.sv"
`include "axi_write_sequence_aligned.sv"
`include "axi_reset_sequence.sv"*/
//test
`include "axi_base_test.sv"
`include "axi_write_test.sv"
`include "axi_read_test.sv"
`include "axi_write_read_test.sv"
`include "axi_write_aligned_test.sv"
`include "axi_reset_test.sv"
endpackage
`endif
