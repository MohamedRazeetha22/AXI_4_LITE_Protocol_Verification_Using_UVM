//FEATURES 1&3
`ifndef AXI_WRITE_SEQUENCE_ALIGNED
`define AXI_WRITE_SEQUENCE_ALIGNED
class axi_write_sequence_aligned extends axi_base_sequence;
`uvm_object_utils (axi_write_sequence_aligned);
function new (string name="axi_write_sequence_aligned");
super.new(name);
endfunction
task body();
repeat (10) begin
item=axi_seq_item::type_id::create("item");
start_item(item);
assert(item.randomize()with{op==axi_seq_item::write; addr%1==0; addr<128;strb==4'b1111;});
finish_item(item);
end
endtask
endclass
`endif
