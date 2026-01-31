`ifndef AXI_READ_SEQUENCE
`define AXI_READ_SEQUENCE
class axi_read_sequence extends axi_base_sequence;
`uvm_object_utils (axi_read_sequence);
function new (string name="axi_read_sequence");
super.new(name);
endfunction
task body();
repeat (10) begin
item=axi_seq_item::type_id::create("item");
assert(item.randomize()with{op==read; addr inside{[0:127]};});
start_item(item);
finish_item(item);
end
endtask
endclass
`endif
