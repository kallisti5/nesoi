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
  );

  reg LED_OK;
  reg LED_FAULT;

  always
  begin

  // Set LED State
  LED_OK=1'b1;
  LED_FAULT=1'b0;

  end

  // XXX: This really needs 25Mhz
  HDMI_encoder TESTCODE (
    .pixclk(clk),
    .TMDSp(TMDSp),
    .TMDSn(TMDSn),
    .TMDSp_clock(TMDS_pclk),
    .TMDSn_clock(TMDS_nclk)
  );
endmodule // top
