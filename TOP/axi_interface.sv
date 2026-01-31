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
endinterface
`endif
