/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module main_7 (
    input clk,
    input rst,
    input left2,
    input center1,
    input right0,
    output reg [1:0] result,
    output reg high1,
    output reg high2,
    output reg high3,
    output reg low1,
    output reg low2,
    output reg low3,
    output reg [1:0] rowOn,
    input mainState
  );
  
  
  
  reg mainControl;
  
  wire [1-1:0] M_edge_ctr_value;
  counter_15 edge_ctr (
    .clk(mainControl),
    .rst(rst),
    .value(M_edge_ctr_value)
  );
  wire [2-1:0] M_mypropogater_rowLit;
  wire [3-1:0] M_mypropogater_numSeq;
  wire [1-1:0] M_mypropogater_row1;
  wire [1-1:0] M_mypropogater_row2;
  wire [1-1:0] M_mypropogater_row3;
  wire [1-1:0] M_mypropogater_gnd1;
  wire [1-1:0] M_mypropogater_gnd2;
  wire [1-1:0] M_mypropogater_gnd3;
  wire [3-1:0] M_mypropogater_clkChoice;
  reg [1-1:0] M_mypropogater_propState;
  propogate_17 mypropogater (
    .clk(mainControl),
    .rst(rst),
    .propState(M_mypropogater_propState),
    .rowLit(M_mypropogater_rowLit),
    .numSeq(M_mypropogater_numSeq),
    .row1(M_mypropogater_row1),
    .row2(M_mypropogater_row2),
    .row3(M_mypropogater_row3),
    .gnd1(M_mypropogater_gnd1),
    .gnd2(M_mypropogater_gnd2),
    .gnd3(M_mypropogater_gnd3),
    .clkChoice(M_mypropogater_clkChoice)
  );
  reg [0:0] M_left_d, M_left_q = 1'h0;
  reg [0:0] M_right_d, M_right_q = 1'h0;
  reg [0:0] M_cent_d, M_cent_q = 1'h0;
  
  wire [1-1:0] M_button_cond1_out;
  reg [1-1:0] M_button_cond1_in;
  button_conditioner_9 button_cond1 (
    .clk(M_edge_ctr_value),
    .in(M_button_cond1_in),
    .out(M_button_cond1_out)
  );
  wire [1-1:0] M_button_cond2_out;
  reg [1-1:0] M_button_cond2_in;
  button_conditioner_9 button_cond2 (
    .clk(M_edge_ctr_value),
    .in(M_button_cond2_in),
    .out(M_button_cond2_out)
  );
  wire [1-1:0] M_button_cond3_out;
  reg [1-1:0] M_button_cond3_in;
  button_conditioner_9 button_cond3 (
    .clk(M_edge_ctr_value),
    .in(M_button_cond3_in),
    .out(M_button_cond3_out)
  );
  wire [1-1:0] M_edge_detector1_out;
  reg [1-1:0] M_edge_detector1_in;
  edge_detector_12 edge_detector1 (
    .clk(M_edge_ctr_value),
    .in(M_edge_detector1_in),
    .out(M_edge_detector1_out)
  );
  wire [1-1:0] M_edge_detector2_out;
  reg [1-1:0] M_edge_detector2_in;
  edge_detector_12 edge_detector2 (
    .clk(M_edge_ctr_value),
    .in(M_edge_detector2_in),
    .out(M_edge_detector2_out)
  );
  wire [1-1:0] M_edge_detector3_out;
  reg [1-1:0] M_edge_detector3_in;
  edge_detector_12 edge_detector3 (
    .clk(M_edge_ctr_value),
    .in(M_edge_detector3_in),
    .out(M_edge_detector3_out)
  );
  wire [2-1:0] M_score_out;
  reg [1-1:0] M_score_en;
  reg [2-1:0] M_score_data;
  reg2bit_24 score (
    .clk(M_edge_ctr_value),
    .rst(rst),
    .en(M_score_en),
    .data(M_score_data),
    .out(M_score_out)
  );
  
  wire [1-1:0] M_myalu_z;
  wire [1-1:0] M_myalu_v;
  wire [1-1:0] M_myalu_n;
  wire [8-1:0] M_myalu_alu;
  reg [8-1:0] M_myalu_a;
  reg [8-1:0] M_myalu_b;
  reg [6-1:0] M_myalu_alufn;
  alu_8 myalu (
    .a(M_myalu_a),
    .b(M_myalu_b),
    .alufn(M_myalu_alufn),
    .z(M_myalu_z),
    .v(M_myalu_v),
    .n(M_myalu_n),
    .alu(M_myalu_alu)
  );
  
  always @* begin
    M_cent_d = M_cent_q;
    M_left_d = M_left_q;
    M_right_d = M_right_q;
    
    mainControl = clk && mainState;
    M_myalu_alufn = 6'h00;
    M_myalu_a = 8'h00;
    M_myalu_b = 8'h00;
    result = 2'h0;
    rowOn = M_mypropogater_rowLit;
    M_mypropogater_propState = 1'h1;
    result = M_score_out;
    M_score_data = 2'h0;
    M_score_en = 1'h1;
    high1 = M_mypropogater_row1;
    high2 = M_mypropogater_row2;
    high3 = M_mypropogater_row3;
    low1 = M_mypropogater_gnd1;
    low2 = M_mypropogater_gnd2;
    low3 = M_mypropogater_gnd3;
    M_button_cond1_in = left2;
    M_edge_detector1_in = M_button_cond1_out;
    M_button_cond2_in = center1;
    M_edge_detector2_in = M_button_cond2_out;
    M_button_cond3_in = right0;
    M_edge_detector3_in = M_button_cond3_out;
    if (M_edge_detector1_out) begin
      M_left_d = 1'h1;
    end
    if (M_edge_detector2_out) begin
      M_cent_d = 1'h1;
    end
    if (M_edge_detector3_out) begin
      M_right_d = 1'h1;
    end
    M_myalu_alufn = 6'h33;
    M_myalu_a[2+0-:1] = M_left_q;
    M_myalu_a[1+0-:1] = M_cent_q;
    M_myalu_a[0+0-:1] = M_right_q;
    M_myalu_b[0+2-:3] = M_mypropogater_numSeq;
    if (M_left_q == 1'h0 && M_right_q == 1'h0 && M_cent_q == 1'h0) begin
      if (M_mypropogater_rowLit == 2'h3) begin
        M_score_data = 2'h3;
        M_score_en = 1'h1;
        M_mypropogater_propState = 1'h0;
      end else begin
        M_score_data = 2'h0;
        M_score_en = 1'h1;
      end
    end else begin
      if (M_myalu_alu[0+0-:1]) begin
        if (M_mypropogater_rowLit == 2'h1) begin
          M_score_data = 2'h1;
          M_score_en = 1'h1;
        end else begin
          if (M_mypropogater_rowLit == 2'h2) begin
            M_score_data = 2'h2;
            M_score_en = 1'h1;
          end else begin
            M_score_data = 2'h3;
            M_score_en = 1'h1;
          end
        end
      end else begin
        M_score_data = 2'h3;
        M_score_en = 1'h1;
      end
      M_mypropogater_propState = 1'h0;
      M_left_d = 1'h0;
      M_right_d = 1'h0;
      M_cent_d = 1'h0;
    end
  end
  
  always @(posedge mainControl) begin
    if (rst == 1'b1) begin
      M_left_q <= 1'h0;
      M_right_q <= 1'h0;
      M_cent_q <= 1'h0;
    end else begin
      M_left_q <= M_left_d;
      M_right_q <= M_right_d;
      M_cent_q <= M_cent_d;
    end
  end
  
endmodule
