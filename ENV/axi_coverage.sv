`ifndef AXI_COVERAGE
`define AXI_COVERAGE
import uvm_pkg::*;
`include "uvm_macros.svh"
class axi_coverage extends uvm_component;
`uvm_component_utils(axi_coverage)
virtual axi_interface vif;
uvm_analysis_imp#(axi_seq_item,axi_coverage) analysis_export;
axi_seq_item item;

covergroup axi4_lite_write;

awaddr_cov:coverpoint vif.awaddr{bins lowrange_addr={[0:40]};
bins midrange_addr={[41:90]};
bins highrange_addr={[91:127]};}

awvalid_cov:coverpoint vif.awvalid{bins awvalid={[0:1]};}

awready_cov:coverpoint vif.awready{bins awready={[0:1]};}


wvalid_cov:coverpoint vif.wvalid{bins wvalid={[0:1]};}
wready_cov:coverpoint vif.wready{bins wready={[0:1]};}

bvalid_cov:coverpoint vif.bvalid{bins bvalid={[0:1]};}
bready_cov:coverpoint vif.bready{bins bready={[0:1]};}
awsize_cov:coverpoint vif.awsize{bins awsize={2'b10};}
awburst_cov: coverpoint vif.awburst{

ignore bins FIXED = {2'b00};
bins INCR = {2'b01};
ignore_bins WRAP = {2'b10};
}
endgroup

covergroup axi4_lite_read;

araddr_cov:coverpoint vif.araddr{bins lowrange_addr={[0:40]};
bins midrange_addr={[41:90]};
bins highrange_addr={[91:127]};}


arvalid_cov: coverpoint vif.arvalid{bins awvalid={[0:1]};}

arready_cov: coverpoint vif.arready{bins awready={[0:1]};}

rvalid_cov:coverpoint vif.rvalid{bins wvalid={[0:1]};}


rready_cov:coverpoint vif.rready{bins wready={[0:1]};}

endgroup
covergroup axi4_lite_wstrb;
wstrb_cov: coverpoint vif.wstrb{
bins full_word = {4'b1111};
ignore_bins zero = {4'b0000};
}
endgroup

covergroup axi4_lite_resp;
bresp_cov: coverpoint vif.bresp{
bins okay={2'b00};
bins slverr={2'b10};
ignore_bins decerr={2'b11};
ignore_bins exokay={2'b01};}
rresp_cov: coverpoint vif.rresp{
bins okay={2'b00};
ignore_bins decerr={2'b11};
ignore_bins exokay={2'b01};}

endgroup
function new (string name="axi_coverage", uvm_component parent);
super.new(name, parent);
analysis_export=new("analysis_export", this);
axi4_lite_write=new();
axi4_lite_read=new();
axi4_lite_wstrb=new();
axi4_lite_resp=new();
endfunction
function void build_phase (uvm_phase phase);
super.build_phase (phase);
if(!uvm_config_db#(virtual axi_interface)::get(this, "", "vif", vif))
uvm_fatal("novif", "virtual interface not set for subscriber")
endfunction
function void write(axi_seq_item pkt);
axi4_lite_write.sample();
axi4_lite_read.sample();
axi4_lite_wstrb.sample();
axi4_lite_resp.sample();
endfunction
endclass
`endif
