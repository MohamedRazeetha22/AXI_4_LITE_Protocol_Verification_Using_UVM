`ifndef AXI_BASE_TEST
`define AXI_BASE_TEST
class axi_base_test extends uvm_test;
`uvm_component_utils (axi_base_test);
axi_environment env;
function new (string name="axi_base_test", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
env=axi_environment::type_id::create("env",this);
endfunction
function void end_of_elaboration_phase (uvm_phase phase);
uvm_top.print_topology();
endfunction
endclass
`endif
