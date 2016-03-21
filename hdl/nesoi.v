// Nesoi, modular GPU
// Released under the terms of the MIT license
// Copyright 2015-2016 Alexander von Gluck IV <kallisti5@unixzen.com>

module top(
  // 50MHz clock input
  input clk,

  // HDMI 0 Output
  output [2:0] TMDSp,
  output [2:0] TMDSn,
  output TMDS_pclk,
  output TMDS_nclk,

  output LED_OK,
  output LED_FAULT,
  output DEBUG_CLK
  );

  reg LED_OK;
  reg LED_FAULT;
  reg DEBUG_CLK;

  wire HBclk;
  wire TMDSclk;

  initial begin
    // Fault LED starts off
    LED_FAULT=1'b0;
  end

  always begin
    // Clock multiplexer
    if (clk == 1'b1) begin
      HBclk=1'b1;
      TMDSclk=1'b1;
      DEBUG_CLK=1'b1;
    end else begin
      HBclk=1'b0;
      TMDSclk=1'b0;
      DEBUG_CLK=1'b0;
    end
  end

  HeartBeat HEARTBEAT (
    .signal(HBclk),
    .monitor(LED_OK)
  );

  // XXX: This really needs 25Mhz
  HDMI_encoder HDMITEST (
    .TMDSclk(TMDSclk),
    .TMDSp(TMDSp),
    .TMDSn(TMDSn),
    .TMDSp_clock(TMDS_pclk),
    .TMDSn_clock(TMDS_nclk)
  );
endmodule // top


module HeartBeat(
  input signal,
  output monitor
  );

  wire monitor;
  reg [26:0] counter;
  assign monitor = counter[18];
  always @(posedge signal) counter <= counter + 1;

endmodule
