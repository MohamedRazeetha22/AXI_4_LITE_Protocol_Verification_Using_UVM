//FEATURES 3,4,10,11
`ifndef AXI_RESET_SEQUENCE
`define AXI_RESET_SEQUENCE
class axi_reset_sequence extends axi_base_sequence;
`uvm_object_utils (axi_reset_sequence);
function new (string name="axi_reset_sequence");
super.new(name);
endfunction
task body();
`uvm_info("seq", "reset seq started", UVM_LOW)
repeat (5) begin
#10;
end
`uvm_info("seq", "reset seq completed", UVM_LOW)
endtask
endclass
`endif
