`ifndef AXI_DRIVER
`define AXI_DRIVER
class axi_driver extends uvm_driver #(axi_seq_item);
`uvm_component_utils (axi_driver);
virtual axi_interface vif;
axi_seq_item item;
function new (string name="axi_driver", uvm_component parent);
super.new(name, parent);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
if(!uvm_config_db#(virtual axi_interface)::get(this,"", "vif", vif))
`uvm_fatal("AXI_DRV", "virtual interface not found")
endfunction
task run_phase (uvm_phase phase);
reset_signals();
forever begin
seq_item_port.get_next_item(item);
if(item.op==axi_seq_item::write)
drive_write(item);
else
drive_read(item);
`uvm_info("drv", "item done called", UVM_LOW)
seq_item_port.item_done();
end
endtask
//drive reset values
task reset_signals();
`uvm_info("drv", "applying reset defaults", UVM_LOW)
vif.awvalid<=0;
vif.wwalid<=0;
vif.bready<=0;
vif.arvalid<=0;
vif.rready<=0;
wait(vif.aresetn==1);
@(posedge vif.aclk);
endtask
//write transaction (aw+w+b)
task drive_write(axi_seq_item item);
//write address channel
vif.awaddr<=item.addr;
vif.awid<=0;
vif.awlen<=0;
vif.awsize<=3'b010;
vif.awburst<=2'b01;
vif.awvalid<=1;
@(posedge vif.aclk);
wait(vif.awready);
vif.awvalid<=0;
//write data channel
@(posedge vif.aclk);
vif.wdata<=item.data;
vif.wstrb<=item.strb;
vif.wid<=0;
vif.wvalid<=1;
vif.wlast<=1;
@(posedge vif.aclk);
wait(vif.wready);
@(posedge vif.aclk);
vif.wvalid<=0;
vif.wlast<=0;
//write response channel
vif.bready<=1;
@(posedge vif.aclk);
wait(vif.bvalid)
item.resp=vif.bresp;
vif.bready=0;
`uvm_info("drv:write_done", $sformatf("addr=%0d data=%0d resp=%0b",item.addr,item.data,item.resp), UVM_LOW)
endtask
//read transaction(ar+r)
task drive_read(axi_seq_item item);
vif.rready<=1;
//read address channel
vif.araddr=item.addr;
vif.arid=0;
vif.arlen<=8;
vif.arsize<=3'b010;
vif.arburst<=2'b01;
vif.arvalid<=1;
wait(vif.arready);
@(posedge vif.aclk);
vif.arvalid<=0;
//read data channel
wait(vif.rvalid);
@(posedge vif.aclk);
item.data=vif.rdata;
item.resp=vif.rresp;
`uvm_info("drv:read_done", $sformatf("addr=%0d data=%0d resp=%0b",item.addr,item.data,item.resp), UVM_LOW)
vif.rready=0;
endtask
endclass
`endif
