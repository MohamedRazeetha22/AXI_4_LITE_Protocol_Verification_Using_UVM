`ifndef AXI_WRITE_TEST
`define AXI_WRITE_TEST
class axi_write_test extends axi_base_test;
`uvm_component_utils (axi_write_test);
axi_write_sequence write_seq;
function new (string name="axi_write_test", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
write_seq=axi_write_sequence::type_id::create("write_seq",this);
endfunction
task run_phase (uvm_phase phase);
phase.raise_objection(this);
write_seq.start(env.agt.seqr);
phase.drop_objection(this);
endtask
endclass
`endif
