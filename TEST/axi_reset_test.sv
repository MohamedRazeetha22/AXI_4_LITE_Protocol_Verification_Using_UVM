`ifndef AXI_RESET_TEST
`define AXI_RESET_TEST
class axi_reset_test extends axi_base_test;
`uvm_component_utils (axi_reset_test);
axi_reset_sequence reset_seq;
function new (string name="axi_reset_test", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
reset_seq=axi_reset_sequence::type_id::create("reset_seq",this);
endfunction
task run_phase (uvm_phase phase);
phase.raise_objection(this);
reset_seq.start(env.agt.seqr);
phase.drop_objection(this);
endtask
endclass
`endif
