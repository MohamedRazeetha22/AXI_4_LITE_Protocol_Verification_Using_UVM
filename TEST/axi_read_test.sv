`ifndef AXI_READ_TEST
`define AXI_READ_TEST
class axi_read_test extends axi_base_test;
`uvm_component_utils (axi_read_test);
axi_read_sequence read_seq;
function new (string name="axi_read_test", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase(phase);
read_seq=axi_read_sequence::type_id::create("read_seq",this);
endfunction
task run_phase (uvm_phase phase);
phase.raise_objection(this);
read_seq.start(env.agt.seqr);
phase.drop_objection(this);
endtask
endclass
`endif
