`ifndef AXI_INTERFACE
`define AXI_INTERFACE
interface axi_interface (input logic aclk, input logic aresetn);
//================WRITE ADDRESS CHANNEL============
logic [31:0] awaddr;
logic awvalid;
logic awready;
logic [3:0] awid;
logic [3:0] awlen;
logic [2:0] awsize;
logic [1:0] awburst;
//================WRITE DATA CHANNEL======
logic [31:0] wdata;
logic wvalid;
logic wready;
logic [3:0] wstrb;
logic [3:0] wid;
logic wlast;
//WRITE RESPONSE CHANNEL------
logic [1:0] bresp;
logic bvalid;
logic bready;
logic [3:0] bid;
//================READ DATA CHANNEL==========
logic [31:0] rdata;
logic rvalid;
logic rready;
logic [1:0] rresp;
logic [3:0] rid;
logic rlast;
//========READ ADDRESS CHANNEL=======
logic [31:0] araddr;
logic arvalid;
logic arready;
logic [3:0] arid;
logic[3:0] arlen;
logic [2:0] arsize;
logic [1:0] arburst;
property p_sig_stable(valid, ready, sig);
  @(posedge aclk) 
  disable iff(!aresetn)
  valid&&!ready |=>sig==$past(sig); 
endproperty


//write address channel
asm_awvalid_stable: assert property(p_sig_stable(awvalid, awready, awvalid))
else $error("AXI ASSERT: awvalid changed before handshake");

asm_awaddr_stable:assert property(p_sig_stable(awvalid, awready, awaddr))
else $error("AXI ASSERT:awaddr changed before handshake");

//write data channel
asm_wvalid_stable: assert property(p_sig_stable(wvalid, wready, wvalid))
else $error("AXI ASSERT:wvalid changed before handshake");

asm_wdata_stable: assert property(p_sig_stable(wvalid,wready, wdata))
else $error ("AXI ASSERT:wdata changed before handshake");

asm_wstrb_stable: assert property(p_sig_stable(wvalid, wready, wstrb))
else $error("AXI ASSERT:wstrb changed before handshake");

//asm_wvalid_allowed:assert property(p_wvalid_allowed)
//else $error("AXI ASSERT:wvalid asserted illegaly");

//write response channel
ast_bvalid_stable:assert property(p_sig_stable(bvalid, bready, bvalid))
else $error("AXI ASSERT:bvalid changed before handshake");

ast_bresp_stable: assert property(p_sig_stable(bvalid, bready, bresp))
else $error("AXI ASSERT: bresp changed before handshake");
ast_wstrb_stable:assert property(p_sig_stable(wvalid, wready, wstrb))
else $error("AXI ASSERT: wstrb changed before handshake");

//ast_bvalid_allowed:assert property(p_bvalid_allowed)
//else $error("AXI_ASSERT:bvalid asserted illegaly");

//read data channel
ast_rvalid_stable: assert property(p_sig_stable(rvalid, rready, rvalid))
else $error("AXI ASSERT: rvalid changed before handshake");

ast_rresp_stable: assert property(p_sig_stable(rvalid, rready, rresp))
else $error("AXI ASSERT: rresp changed before handshake");

ast_rdata_stable: assert property(p_sig_stable(rvalid, rready, rdata))
else $error("AXI ASSERT: rdata changed before handshake");

//ast_rvalid_allowed: assert property(p_rvalid_allowed)
//else $error("AXI_ASSERT: rvalid asserted illegaly");
endinterface
`endif
