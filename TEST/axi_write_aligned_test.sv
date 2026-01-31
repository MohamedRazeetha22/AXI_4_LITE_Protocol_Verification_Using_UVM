`ifndef AXI_WRITE_ALIGNED_TEST
`define AXI_WRITE_ALIGNED_TEST
class axi_write_aligned_test extends axi_base_test;
`uvm_component_utils(axi_write_aligned_test);
axi_write_sequence_aligned wt_aligned_seq;
function new (string name="axi_write_aligned_test", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
wt_aligned_seq=axi_write_sequence_aligned::type_id::create("wt_aligned_seq",this);
endfunction
task run_phase (uvm_phase phase);
phase.raise_objection(this);
wt_aligned_seq.start(env.agt.seqr);
phase.drop_objection(this);
endtask
endclass
`endif
