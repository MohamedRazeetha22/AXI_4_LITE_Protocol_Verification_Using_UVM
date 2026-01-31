`ifndef AXI_TOP
`define AXI_TOP
`include "uvm_macros.svh"
import uvm_pkg::*;
import axi_test_pkg::*;
interface sif (input logic aclk, .aresetn(aresetn));
endinterface

module dut_inst (
.awaddr(sif.awaddr),.awlen(sif.awlen),.awsize(sif.awsize),.awburst(sif.awburst),.awvalid(sif.awvalid),.awready(sif.awready),
.wid(sif.wid),.wdata(sif.wdata),.wstrb(sif.wstrb),.wlast(sif.wlast),.wvalid(sif.wvalid),.wready(sif.wready),
.bid(sif.bid),.bresp(sif.bresp),.bvalid(sif.bvalid),.bready(sif.bready),
.arid(sif.arid),.araddr(sif.araddr),.arlen(sif.arlen),.arsize(sif.arsize),.arburst(sif.arburst),.arvalid(sif.arvalid),.arready(sif.arready),
.rid(sif.rid),.rdata(sif.rdata),.rresp(sif.rresp),.rvalid(sif.rvalid),.rlast(sif.rlast),.rready(sif.rready)
);
endmodule

initial begin
  clk=0;
  always #5 clk=~clk;
  aresetn=0;
  #10 aresetn=1;
end

initial begin
  run_test("axi_write_read_test");
end
endmodule
