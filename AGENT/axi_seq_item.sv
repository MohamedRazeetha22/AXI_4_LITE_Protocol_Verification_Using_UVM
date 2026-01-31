`ifndef AXI_SEQ_ITEM
`define AXI_SEQ_ITEM
class axi_seq_item extends uvm_sequence_item;
typedef enum{read, write} option;
rand option op;
// address channel info
rand bit[31:0] addr;
rand bit [2:0] prot;
// write data channel info
rand bit [31:0] data;
rand bit [3:0] strb;
rand bit [2:0] awsize;
rand bit [2:0] arsize;
//response (from slave)
bit[1:0] resp;
constraint addr_align_c{addr[1:0]==2'b00;}
constraint axi_4_lite{soft awsize ==3'b010; soft arsize==3'b010;}
constraint strobe_c{strb==4'b1111;}
`uvm_object_utils_begin(axi_seq_item)
`uvm_field_enum (option,op, UVM_ALL_ON)
`uvm_field_int(addr, UVM_ALL_ON)
`uvm_field_int(prot, UVM_ALL_ON)
`uvm_field_int(data, UVM_ALL_ON)
`uvm_field_int(strb, UVM_ALL_ON)
`uvm_field_int(resp, UVM_ALL_ON)
`uvm_field_int(awsize, UVM_ALL_ON)
`uvm_field_int(arsize, UVM_ALL_ON)
`uvm_object_utils_end
function new (string name="axi_seq_item");
super.new(name);
endfunction
endclass
`endif
