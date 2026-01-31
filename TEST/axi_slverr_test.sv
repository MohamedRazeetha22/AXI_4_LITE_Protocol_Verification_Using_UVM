`ifndef AXI_slverr_TEST
`define AXI_slverr_TEST
class axi_slverr_test extends axi_base_test;
`uvm_component_utils(axi_slverr_test);
axi_slverr_sequence slverr_seq;
function new (string name="axi_slverr_test", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
slverr_seq=axi_slverr_sequence::type_id::create("slverr_seq");
endfunction
task run_phase (uvm_phase phase);
phase.raise_objection(this);
slverr_seq.start(env.agt.seqr);
phase.drop_objection(this);
endtask
endclass
`endif
