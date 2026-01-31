//FEATURES 3,4,7
`ifndef AXI_WRITE_READ_SEQUENCE
`define AXI_WRITE_READ_SEQUENCE
class axi_write_read_sequence extends axi_base_sequence;
`uvm_object_utils(axi_write_read_sequence);
function new (string name="axi_write_read_sequence");
super.new(name);
endfunction
task body();
axi_seq_item wr,rd;
bit [31:0]addr_q;
repeat (10) begin
//write
wr=axi_seq_item::type_id::create("wr");
start_item(wr);
assert(wr.randomize()with{op==axi_seq_item::write; addr<128; strb==4'b1111;});
finish_item(wr);
addr_q=wr.addr;
//read
rd=axi_seq_item::type_id::create("rd");
start_item(rd);
rd.op=axi_seq_item::read;
rd.addr=addr_q;
finish_item(rd);
end
endtask
endclass
`endif
