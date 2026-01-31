//FEATURES 3,4,10,11
`ifndef AXI_SLVERR_SEQUENCE
`define AXI_SLVERR_SEQUENCE
class axi_slverr_sequence extends axi_base_sequence;
`uvm_object_utils (axi_slverr_sequence);
function new (string name="axi_slverr_sequence");
super.new(name);
endfunction
task body();
axi_seq_item item;
`uvm_info("seq", "slverr seq started", UVM_LOW)
repeat(10) begin
item=axi_seq_item::type_id::create("item");
start_item(item);
assert(item.randomize()with{op==write; awsize==3'b011;});
Finish_item(item);
end
`uvm_info("seq", "slverr seq completed", UVM_LOW)
endtask
endclass
`endif
