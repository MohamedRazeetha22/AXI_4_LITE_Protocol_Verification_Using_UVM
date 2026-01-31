`ifndef AXI_MONITOR
`define AXI_MONITOR
class axi_monitor extends uvm_monitor;
`uvm_component_utils (axi_monitor);
virtual axi_interface vif;
uvm_analysis_port #(axi_seq_item) ap;//analysis port to scb/cov
axi_seq_item wr_item;
axi_seq_item rd_item;
function new (string name="axi_monitor", uvm_component parent);
super.new(name, parent);
ap=new("ap", this);
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
if(!uvm_config_db#(virtual axi_interface)::get(this,"", "vif", vif))
`uvm_fatal("AXI_MON", "virtual interface not found")
endfunction
task run_phase (uvm_phase phase);
fork
monitor_write();
monitor_read();
join
endtask
//write channel monitor (aw+w+b)
task monitor_write();
forever begin
wait(vif.aresetn==1);
//write address handshake AW
wait(vif.awvalid&&vif.awready);
wr_item=axi_seq_item::type_id::create("wr_item");
wr_item.op=axi_seq_item::write;
wr_item.addr=vif.awaddr;
//write data handshake W
wait(vif.wvalid&&vif.wready);
wr_item.data=vif.wdata;
wr_item.strb=vif.wstrb;
//write response handshake
wait(vif.bvalid&&vif.bready);
wr_item.resp= vif.bresp;
`uvm_info("MON", $sformatf("WRITE OBSERVED addr=%0d data=%0d",wr_item.addr,wr_item.data), UVM_LOW)
ap.write(wr_item);
@(posedge vif.aclk);
wait(!(vif.bvalid&&vif.bready));
end
endtask
//read channel monitor(ar+r)
task monitor_read();
forever begin
//reset handling
wait(vif.aresetn==1);
//read address handshake AR
wait(vif.arvalid&&vif.arready);
rd_item=axi_seq_item::type_id::create("rd_item");
rd_item.op=axi_seq_item:: read;
rd_item.addr=vif.araddr;
//read data handshake R
wait(vif.rvalid && vif.rready);
rd_item.data=vif.rdata;
rd_item.resp=vif.rresp;
`uvm_info("MON", $sformatf("READ OBSERVED addr=%0d data=%0d", rd_item.addr,rd_item.data), UVM_LOW)
ap.write(rd_item);
@(posedge vif.aclk);
wait(!(vif.rvalid&&vif.rready));
end
endtask
endclass
`endif
