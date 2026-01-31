`ifndef AXI_WRITE_READ_TEST
`define AXI_WRITE_READ_TEST
class axi_write_read_test extends axi_base_test;
`uvm_component_utils(axi_write_read_test);
axi_write_read_sequence wt_rd_seq;
function new (string name="axi_write_read_test", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
wt_rd_seq=axi_write_read_sequence::type_id::create("wt_rd_seq",this);
endfunction
task run_phase (uvm_phase phase);
phase.raise_objection(this);
wt_rd_seq.start(env.agt.seqr);
phase.drop_objection(this);
endtask
endclass
`endif
