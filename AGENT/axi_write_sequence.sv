//FEATURES 2,4,6,7
`ifndef AXI_WRITE_SEQUENCE
`define AXI_WRITE_SEQUENCE
class axi_write_sequence extends axi_base_sequence;
`uvm_object_utils(axi_write_sequence);
function new (string name="axi_write_sequence");
super.new(name);
endfunction
task body();
item=axi_seq_item::type_id::create("item");
repeat (10) begin
assert(item.randomize()with{op==write; addr inside{[0:127]}; data!=32'h0;strb==4'hF;});
start_item(item);
Finish_item(item);
#10;
end
endtask
endclass
`endif
