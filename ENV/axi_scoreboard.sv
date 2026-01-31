class axi_scoreboard extends uvm_component;
`uvm_component_utils(axi_scoreboard)
uvm_analysis_imp#(axi_seq_item,axi_scoreboard) analysis_export;
axi_seq_item item;
logic [7:0] mem[0:127];
function new (string name="axi_scoreboard", uvm_component parent);
super.new(name, parent);
analysis_export=new("analysis_export",this);
endfunction
function void write(axi_seq_item item);
if(item.op==axi_seq_item::write) begin
if(item.resp==2'b00 && item.addr+3<128)begin//okay
mem[item.addr+0]=item.data[7:0];
mem[item.addr+1]=item.data[15:8];
mem[item.addr+2]=item.data[23:16];
mem[item.addr+3]=item.data[31:24];
`uvm_info("SCB", $sformatf("write pass: addr=%0d data=%0d",item.addr,item.data), UVM_MEDIUM)
end
end else begin //read
if(item.addr+3<128) begin
logic[31:0] exp_data;
exp_data={mem[item.addr+3],mem[item.addr+2],mem[item.addr+1],mem[item.addr+0]};
if(item.data == exp_data)
`uvm_info("SCB", $sformatf("read pass: addr=%0d data=%0d",item.addr,item.data), UVM_MEDIUM)
else
`uvm_info("SCB", $sformatf("read fail: addr=%0d data=%0d",item.addr,item.data), UVM_MEDIUM)
end
end
endfunction
endclass
`endif
