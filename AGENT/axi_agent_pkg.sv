`ifndef AXI_AGENT_PKG
`define AXI_AGENT_PKG
package axi_agent_pkg;
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "axi_seq_item.sv"
`include "axi_base_sequence.sv"
`include "axi_write_sequence.sv"
`include "axi_read_sequence.sv"
`include "axi_write_read_sequence.sv"
`include "axi_write_sequence_aligned.sv"
`include "axi_reset_sequence.sv"
`include "axi_sequencer.sv"
`include "axi_driver.sv"
`include "axi_monitor.sv"
`include "axi_agent.sv"
endpackage
`endif
