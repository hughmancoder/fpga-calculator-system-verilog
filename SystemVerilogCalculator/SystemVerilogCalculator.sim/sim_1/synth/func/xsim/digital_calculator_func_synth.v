// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Oct  3 21:35:53 2024
// Host        : INGB16W024 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               U:/Xilinix/SystemVerilogAssignment/project_1/project_1.sim/sim_1/synth/func/xsim/digital_calculator_func_synth.v
// Design      : digital_calculator
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module digital_calculator
   (sw,
    reset,
    confirm,
    display_mode,
    clk,
    seg,
    an);
  input [4:0]sw;
  input reset;
  input confirm;
  input display_mode;
  input clk;
  output [6:0]seg;
  output [3:0]an;

  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire confirm;
  wire confirm_IBUF;
  wire display_mode;
  wire display_mode_IBUF;
  wire [1:0]display_state;
  wire \display_state[0]_i_1_n_0 ;
  wire \display_state[1]_i_1_n_0 ;
  wire [3:1]display_value;
  wire [3:0]operand1;
  wire operand10;
  wire operand1_confirmed;
  wire operand1_confirmed_i_1_n_0;
  wire \operand2[3]_i_1_n_0 ;
  wire operand2_confirmed_i_1_n_0;
  wire operand2_confirmed_reg_n_0;
  wire \operand2_reg_n_0_[0] ;
  wire \operand2_reg_n_0_[1] ;
  wire \operand2_reg_n_0_[2] ;
  wire \operand2_reg_n_0_[3] ;
  wire operator_sel_i_1_n_0;
  wire operator_sel_reg_n_0;
  wire reset;
  wire reset_IBUF;
  wire [4:0]result;
  wire [4:0]result0_in;
  wire \result[4]_i_2_n_0 ;
  wire [6:0]seg;
  wire [6:0]seg_OBUF;
  wire \seg_OBUF[6]_inst_i_10_n_0 ;
  wire \seg_OBUF[6]_inst_i_11_n_0 ;
  wire \seg_OBUF[6]_inst_i_12_n_0 ;
  wire \seg_OBUF[6]_inst_i_14_n_0 ;
  wire \seg_OBUF[6]_inst_i_15_n_0 ;
  wire \seg_OBUF[6]_inst_i_7_n_0 ;
  wire \seg_OBUF[6]_inst_i_8_n_0 ;
  wire [4:0]sw;
  wire [4:0]sw_IBUF;

  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF confirm_IBUF_inst
       (.I(confirm),
        .O(confirm_IBUF));
  display_control display_control_inst
       (.CLK(clk_IBUF_BUFG),
        .D(sw_IBUF[0]),
        .Q({result[4],result[0]}),
        .an_OBUF(an_OBUF),
        .display_mode_IBUF(display_mode_IBUF),
        .display_state(display_state),
        .display_value(display_value),
        .seg_OBUF(seg_OBUF),
        .\seg_OBUF[0]_inst_i_1_0 (\seg_OBUF[6]_inst_i_7_n_0 ),
        .\seg_OBUF[0]_inst_i_1_1 (\seg_OBUF[6]_inst_i_8_n_0 ),
        .\seg_OBUF[0]_inst_i_1_2 (\seg_OBUF[6]_inst_i_11_n_0 ),
        .\seg_OBUF[0]_inst_i_1_3 (\seg_OBUF[6]_inst_i_12_n_0 ),
        .\seg_OBUF[0]_inst_i_1_4 (\seg_OBUF[6]_inst_i_10_n_0 ),
        .\seg_OBUF[0]_inst_i_1_5 (\seg_OBUF[6]_inst_i_14_n_0 ),
        .\seg_OBUF[0]_inst_i_1_6 (\seg_OBUF[6]_inst_i_15_n_0 ),
        .\seg_OBUF[6]_inst_i_6_0 (operand1[0]));
  IBUF display_mode_IBUF_inst
       (.I(display_mode),
        .O(display_mode_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hDFD8)) 
    \display_state[0]_i_1 
       (.I0(operand1_confirmed),
        .I1(operand2_confirmed_reg_n_0),
        .I2(confirm_IBUF),
        .I3(display_state[0]),
        .O(\display_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hAFA8)) 
    \display_state[1]_i_1 
       (.I0(operand1_confirmed),
        .I1(operand2_confirmed_reg_n_0),
        .I2(confirm_IBUF),
        .I3(display_state[1]),
        .O(\display_state[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \display_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\display_state[0]_i_1_n_0 ),
        .Q(display_state[0]));
  FDCE #(
    .INIT(1'b0)) 
    \display_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\display_state[1]_i_1_n_0 ),
        .Q(display_state[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \operand1[3]_i_1 
       (.I0(confirm_IBUF),
        .I1(operand1_confirmed),
        .O(operand10));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    operand1_confirmed_i_1
       (.I0(confirm_IBUF),
        .I1(operand1_confirmed),
        .O(operand1_confirmed_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    operand1_confirmed_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(operand1_confirmed_i_1_n_0),
        .Q(operand1_confirmed));
  FDCE #(
    .INIT(1'b0)) 
    \operand1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(operand10),
        .CLR(reset_IBUF),
        .D(sw_IBUF[0]),
        .Q(operand1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \operand1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(operand10),
        .CLR(reset_IBUF),
        .D(sw_IBUF[1]),
        .Q(operand1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \operand1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(operand10),
        .CLR(reset_IBUF),
        .D(sw_IBUF[2]),
        .Q(operand1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \operand1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(operand10),
        .CLR(reset_IBUF),
        .D(sw_IBUF[3]),
        .Q(operand1[3]));
  LUT3 #(
    .INIT(8'h40)) 
    \operand2[3]_i_1 
       (.I0(operand2_confirmed_reg_n_0),
        .I1(operand1_confirmed),
        .I2(confirm_IBUF),
        .O(\operand2[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    operand2_confirmed_i_1
       (.I0(operand2_confirmed_reg_n_0),
        .I1(operand1_confirmed),
        .I2(confirm_IBUF),
        .O(operand2_confirmed_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    operand2_confirmed_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(operand2_confirmed_i_1_n_0),
        .Q(operand2_confirmed_reg_n_0));
  FDCE #(
    .INIT(1'b0)) 
    \operand2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\operand2[3]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(sw_IBUF[0]),
        .Q(\operand2_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \operand2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\operand2[3]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(sw_IBUF[1]),
        .Q(\operand2_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \operand2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\operand2[3]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(sw_IBUF[2]),
        .Q(\operand2_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \operand2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\operand2[3]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(sw_IBUF[3]),
        .Q(\operand2_reg_n_0_[3] ));
  LUT2 #(
    .INIT(4'h8)) 
    operator_sel_i_1
       (.I0(operand2_confirmed_reg_n_0),
        .I1(operand1_confirmed),
        .O(operator_sel_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    operator_sel_reg
       (.C(clk_IBUF_BUFG),
        .CE(operator_sel_i_1_n_0),
        .CLR(reset_IBUF),
        .D(sw_IBUF[4]),
        .Q(operator_sel_reg_n_0));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  LUT2 #(
    .INIT(4'h6)) 
    \result[0]_i_1 
       (.I0(operand1[0]),
        .I1(\operand2_reg_n_0_[0] ),
        .O(result0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h96666966)) 
    \result[1]_i_1 
       (.I0(operand1[1]),
        .I1(\operand2_reg_n_0_[1] ),
        .I2(operand1[0]),
        .I3(\operand2_reg_n_0_[0] ),
        .I4(operator_sel_reg_n_0),
        .O(result0_in[1]));
  LUT4 #(
    .INIT(16'h9669)) 
    \result[2]_i_1 
       (.I0(operand1[2]),
        .I1(operator_sel_reg_n_0),
        .I2(\operand2_reg_n_0_[2] ),
        .I3(\result[4]_i_2_n_0 ),
        .O(result0_in[2]));
  LUT6 #(
    .INIT(64'h9996966669996669)) 
    \result[3]_i_1 
       (.I0(operand1[3]),
        .I1(\operand2_reg_n_0_[3] ),
        .I2(operand1[2]),
        .I3(\result[4]_i_2_n_0 ),
        .I4(\operand2_reg_n_0_[2] ),
        .I5(operator_sel_reg_n_0),
        .O(result0_in[3]));
  LUT6 #(
    .INIT(64'hFFE82BFFE800002B)) 
    \result[4]_i_1 
       (.I0(\operand2_reg_n_0_[2] ),
        .I1(\result[4]_i_2_n_0 ),
        .I2(operand1[2]),
        .I3(operand1[3]),
        .I4(operator_sel_reg_n_0),
        .I5(\operand2_reg_n_0_[3] ),
        .O(result0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFB9B9101)) 
    \result[4]_i_2 
       (.I0(\operand2_reg_n_0_[1] ),
        .I1(operator_sel_reg_n_0),
        .I2(\operand2_reg_n_0_[0] ),
        .I3(operand1[0]),
        .I4(operand1[1]),
        .O(\result[4]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \result_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(operator_sel_i_1_n_0),
        .CLR(reset_IBUF),
        .D(result0_in[0]),
        .Q(result[0]));
  FDCE #(
    .INIT(1'b0)) 
    \result_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(operator_sel_i_1_n_0),
        .CLR(reset_IBUF),
        .D(result0_in[1]),
        .Q(result[1]));
  FDCE #(
    .INIT(1'b0)) 
    \result_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(operator_sel_i_1_n_0),
        .CLR(reset_IBUF),
        .D(result0_in[2]),
        .Q(result[2]));
  FDCE #(
    .INIT(1'b0)) 
    \result_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(operator_sel_i_1_n_0),
        .CLR(reset_IBUF),
        .D(result0_in[3]),
        .Q(result[3]));
  FDCE #(
    .INIT(1'b0)) 
    \result_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(operator_sel_i_1_n_0),
        .CLR(reset_IBUF),
        .D(result0_in[4]),
        .Q(result[4]));
  OBUF \seg_OBUF[0]_inst 
       (.I(seg_OBUF[0]),
        .O(seg[0]));
  OBUF \seg_OBUF[1]_inst 
       (.I(seg_OBUF[1]),
        .O(seg[1]));
  OBUF \seg_OBUF[2]_inst 
       (.I(seg_OBUF[2]),
        .O(seg[2]));
  OBUF \seg_OBUF[3]_inst 
       (.I(seg_OBUF[3]),
        .O(seg[3]));
  OBUF \seg_OBUF[4]_inst 
       (.I(seg_OBUF[4]),
        .O(seg[4]));
  OBUF \seg_OBUF[5]_inst 
       (.I(seg_OBUF[5]),
        .O(seg[5]));
  OBUF \seg_OBUF[6]_inst 
       (.I(seg_OBUF[6]),
        .O(seg[6]));
  LUT5 #(
    .INIT(32'hE0000000)) 
    \seg_OBUF[6]_inst_i_10 
       (.I0(display_value[3]),
        .I1(display_value[2]),
        .I2(result[4]),
        .I3(display_state[0]),
        .I4(display_state[1]),
        .O(\seg_OBUF[6]_inst_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h6AAA95556AAA5555)) 
    \seg_OBUF[6]_inst_i_11 
       (.I0(display_value[1]),
        .I1(display_state[1]),
        .I2(display_state[0]),
        .I3(result[4]),
        .I4(display_value[2]),
        .I5(display_value[3]),
        .O(\seg_OBUF[6]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF7F000080)) 
    \seg_OBUF[6]_inst_i_12 
       (.I0(result[4]),
        .I1(display_state[0]),
        .I2(display_state[1]),
        .I3(display_value[3]),
        .I4(display_value[2]),
        .I5(display_value[1]),
        .O(\seg_OBUF[6]_inst_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFACA0ACA)) 
    \seg_OBUF[6]_inst_i_13 
       (.I0(sw_IBUF[2]),
        .I1(operand1[2]),
        .I2(display_state[0]),
        .I3(display_state[1]),
        .I4(result[2]),
        .O(display_value[2]));
  LUT6 #(
    .INIT(64'hFFFF3FFF4000D555)) 
    \seg_OBUF[6]_inst_i_14 
       (.I0(display_value[1]),
        .I1(display_state[1]),
        .I2(display_state[0]),
        .I3(result[4]),
        .I4(display_value[2]),
        .I5(display_value[3]),
        .O(\seg_OBUF[6]_inst_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h008080FFFF7FFF00)) 
    \seg_OBUF[6]_inst_i_15 
       (.I0(result[4]),
        .I1(display_state[0]),
        .I2(display_state[1]),
        .I3(display_value[1]),
        .I4(display_value[2]),
        .I5(display_value[3]),
        .O(\seg_OBUF[6]_inst_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hFACA0ACA)) 
    \seg_OBUF[6]_inst_i_16 
       (.I0(sw_IBUF[3]),
        .I1(operand1[3]),
        .I2(display_state[0]),
        .I3(display_state[1]),
        .I4(result[3]),
        .O(display_value[3]));
  LUT6 #(
    .INIT(64'h9CCCCCCC18888888)) 
    \seg_OBUF[6]_inst_i_7 
       (.I0(display_value[2]),
        .I1(display_value[3]),
        .I2(display_state[1]),
        .I3(display_state[0]),
        .I4(result[4]),
        .I5(display_value[1]),
        .O(\seg_OBUF[6]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \seg_OBUF[6]_inst_i_8 
       (.I0(display_state[0]),
        .I1(display_state[1]),
        .O(\seg_OBUF[6]_inst_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFACA0ACA)) 
    \seg_OBUF[6]_inst_i_9 
       (.I0(sw_IBUF[1]),
        .I1(operand1[1]),
        .I2(display_state[0]),
        .I3(display_state[1]),
        .I4(result[1]),
        .O(display_value[1]));
  IBUF \sw_IBUF[0]_inst 
       (.I(sw[0]),
        .O(sw_IBUF[0]));
  IBUF \sw_IBUF[1]_inst 
       (.I(sw[1]),
        .O(sw_IBUF[1]));
  IBUF \sw_IBUF[2]_inst 
       (.I(sw[2]),
        .O(sw_IBUF[2]));
  IBUF \sw_IBUF[3]_inst 
       (.I(sw[3]),
        .O(sw_IBUF[3]));
  IBUF \sw_IBUF[4]_inst 
       (.I(sw[4]),
        .O(sw_IBUF[4]));
endmodule

module display_control
   (an_OBUF,
    seg_OBUF,
    CLK,
    display_mode_IBUF,
    \seg_OBUF[0]_inst_i_1_0 ,
    Q,
    \seg_OBUF[0]_inst_i_1_1 ,
    display_state,
    D,
    \seg_OBUF[6]_inst_i_6_0 ,
    \seg_OBUF[0]_inst_i_1_2 ,
    \seg_OBUF[0]_inst_i_1_3 ,
    display_value,
    \seg_OBUF[0]_inst_i_1_4 ,
    \seg_OBUF[0]_inst_i_1_5 ,
    \seg_OBUF[0]_inst_i_1_6 );
  output [3:0]an_OBUF;
  output [6:0]seg_OBUF;
  input CLK;
  input display_mode_IBUF;
  input \seg_OBUF[0]_inst_i_1_0 ;
  input [1:0]Q;
  input \seg_OBUF[0]_inst_i_1_1 ;
  input [1:0]display_state;
  input [0:0]D;
  input [0:0]\seg_OBUF[6]_inst_i_6_0 ;
  input \seg_OBUF[0]_inst_i_1_2 ;
  input \seg_OBUF[0]_inst_i_1_3 ;
  input [2:0]display_value;
  input \seg_OBUF[0]_inst_i_1_4 ;
  input \seg_OBUF[0]_inst_i_1_5 ;
  input \seg_OBUF[0]_inst_i_1_6 ;

  wire CLK;
  wire [0:0]D;
  wire [1:0]Q;
  wire [3:0]an_OBUF;
  wire [1:0]digit_select;
  wire display_mode_IBUF;
  wire [1:0]display_state;
  wire [2:0]display_value;
  wire \refresh_counter[0]_i_2_n_0 ;
  wire \refresh_counter_reg[0]_i_1_n_0 ;
  wire \refresh_counter_reg[0]_i_1_n_1 ;
  wire \refresh_counter_reg[0]_i_1_n_2 ;
  wire \refresh_counter_reg[0]_i_1_n_3 ;
  wire \refresh_counter_reg[0]_i_1_n_4 ;
  wire \refresh_counter_reg[0]_i_1_n_5 ;
  wire \refresh_counter_reg[0]_i_1_n_6 ;
  wire \refresh_counter_reg[0]_i_1_n_7 ;
  wire \refresh_counter_reg[12]_i_1_n_0 ;
  wire \refresh_counter_reg[12]_i_1_n_1 ;
  wire \refresh_counter_reg[12]_i_1_n_2 ;
  wire \refresh_counter_reg[12]_i_1_n_3 ;
  wire \refresh_counter_reg[12]_i_1_n_4 ;
  wire \refresh_counter_reg[12]_i_1_n_5 ;
  wire \refresh_counter_reg[12]_i_1_n_6 ;
  wire \refresh_counter_reg[12]_i_1_n_7 ;
  wire \refresh_counter_reg[16]_i_1_n_7 ;
  wire \refresh_counter_reg[4]_i_1_n_0 ;
  wire \refresh_counter_reg[4]_i_1_n_1 ;
  wire \refresh_counter_reg[4]_i_1_n_2 ;
  wire \refresh_counter_reg[4]_i_1_n_3 ;
  wire \refresh_counter_reg[4]_i_1_n_4 ;
  wire \refresh_counter_reg[4]_i_1_n_5 ;
  wire \refresh_counter_reg[4]_i_1_n_6 ;
  wire \refresh_counter_reg[4]_i_1_n_7 ;
  wire \refresh_counter_reg[8]_i_1_n_0 ;
  wire \refresh_counter_reg[8]_i_1_n_1 ;
  wire \refresh_counter_reg[8]_i_1_n_2 ;
  wire \refresh_counter_reg[8]_i_1_n_3 ;
  wire \refresh_counter_reg[8]_i_1_n_4 ;
  wire \refresh_counter_reg[8]_i_1_n_5 ;
  wire \refresh_counter_reg[8]_i_1_n_6 ;
  wire \refresh_counter_reg[8]_i_1_n_7 ;
  wire \refresh_counter_reg_n_0_[0] ;
  wire \refresh_counter_reg_n_0_[10] ;
  wire \refresh_counter_reg_n_0_[11] ;
  wire \refresh_counter_reg_n_0_[12] ;
  wire \refresh_counter_reg_n_0_[13] ;
  wire \refresh_counter_reg_n_0_[14] ;
  wire \refresh_counter_reg_n_0_[1] ;
  wire \refresh_counter_reg_n_0_[2] ;
  wire \refresh_counter_reg_n_0_[3] ;
  wire \refresh_counter_reg_n_0_[4] ;
  wire \refresh_counter_reg_n_0_[5] ;
  wire \refresh_counter_reg_n_0_[6] ;
  wire \refresh_counter_reg_n_0_[7] ;
  wire \refresh_counter_reg_n_0_[8] ;
  wire \refresh_counter_reg_n_0_[9] ;
  wire [6:0]seg_OBUF;
  wire \seg_OBUF[0]_inst_i_1_0 ;
  wire \seg_OBUF[0]_inst_i_1_1 ;
  wire \seg_OBUF[0]_inst_i_1_2 ;
  wire \seg_OBUF[0]_inst_i_1_3 ;
  wire \seg_OBUF[0]_inst_i_1_4 ;
  wire \seg_OBUF[0]_inst_i_1_5 ;
  wire \seg_OBUF[0]_inst_i_1_6 ;
  wire \seg_OBUF[6]_inst_i_17_n_0 ;
  wire [0:0]\seg_OBUF[6]_inst_i_6_0 ;
  wire \seg_OBUF[6]_inst_i_6_n_0 ;
  wire [3:0]sel0;
  wire [3:0]\NLW_refresh_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_refresh_counter_reg[16]_i_1_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an_OBUF[0]_inst_i_1 
       (.I0(digit_select[0]),
        .I1(digit_select[1]),
        .O(an_OBUF[0]));
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[1]_inst_i_1 
       (.I0(digit_select[1]),
        .I1(digit_select[0]),
        .O(an_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[2]_inst_i_1 
       (.I0(digit_select[0]),
        .I1(digit_select[1]),
        .O(an_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \an_OBUF[3]_inst_i_1 
       (.I0(digit_select[0]),
        .I1(digit_select[1]),
        .O(an_OBUF[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \refresh_counter[0]_i_2 
       (.I0(\refresh_counter_reg_n_0_[0] ),
        .O(\refresh_counter[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[0]_i_1_n_7 ),
        .Q(\refresh_counter_reg_n_0_[0] ),
        .R(1'b0));
  CARRY4 \refresh_counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\refresh_counter_reg[0]_i_1_n_0 ,\refresh_counter_reg[0]_i_1_n_1 ,\refresh_counter_reg[0]_i_1_n_2 ,\refresh_counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\refresh_counter_reg[0]_i_1_n_4 ,\refresh_counter_reg[0]_i_1_n_5 ,\refresh_counter_reg[0]_i_1_n_6 ,\refresh_counter_reg[0]_i_1_n_7 }),
        .S({\refresh_counter_reg_n_0_[3] ,\refresh_counter_reg_n_0_[2] ,\refresh_counter_reg_n_0_[1] ,\refresh_counter[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[8]_i_1_n_5 ),
        .Q(\refresh_counter_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[8]_i_1_n_4 ),
        .Q(\refresh_counter_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[12]_i_1_n_7 ),
        .Q(\refresh_counter_reg_n_0_[12] ),
        .R(1'b0));
  CARRY4 \refresh_counter_reg[12]_i_1 
       (.CI(\refresh_counter_reg[8]_i_1_n_0 ),
        .CO({\refresh_counter_reg[12]_i_1_n_0 ,\refresh_counter_reg[12]_i_1_n_1 ,\refresh_counter_reg[12]_i_1_n_2 ,\refresh_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\refresh_counter_reg[12]_i_1_n_4 ,\refresh_counter_reg[12]_i_1_n_5 ,\refresh_counter_reg[12]_i_1_n_6 ,\refresh_counter_reg[12]_i_1_n_7 }),
        .S({digit_select[0],\refresh_counter_reg_n_0_[14] ,\refresh_counter_reg_n_0_[13] ,\refresh_counter_reg_n_0_[12] }));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[12]_i_1_n_6 ),
        .Q(\refresh_counter_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[12]_i_1_n_5 ),
        .Q(\refresh_counter_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[12]_i_1_n_4 ),
        .Q(digit_select[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[16]_i_1_n_7 ),
        .Q(digit_select[1]),
        .R(1'b0));
  CARRY4 \refresh_counter_reg[16]_i_1 
       (.CI(\refresh_counter_reg[12]_i_1_n_0 ),
        .CO(\NLW_refresh_counter_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_refresh_counter_reg[16]_i_1_O_UNCONNECTED [3:1],\refresh_counter_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,digit_select[1]}));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[0]_i_1_n_6 ),
        .Q(\refresh_counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[0]_i_1_n_5 ),
        .Q(\refresh_counter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[0]_i_1_n_4 ),
        .Q(\refresh_counter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[4]_i_1_n_7 ),
        .Q(\refresh_counter_reg_n_0_[4] ),
        .R(1'b0));
  CARRY4 \refresh_counter_reg[4]_i_1 
       (.CI(\refresh_counter_reg[0]_i_1_n_0 ),
        .CO({\refresh_counter_reg[4]_i_1_n_0 ,\refresh_counter_reg[4]_i_1_n_1 ,\refresh_counter_reg[4]_i_1_n_2 ,\refresh_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\refresh_counter_reg[4]_i_1_n_4 ,\refresh_counter_reg[4]_i_1_n_5 ,\refresh_counter_reg[4]_i_1_n_6 ,\refresh_counter_reg[4]_i_1_n_7 }),
        .S({\refresh_counter_reg_n_0_[7] ,\refresh_counter_reg_n_0_[6] ,\refresh_counter_reg_n_0_[5] ,\refresh_counter_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[4]_i_1_n_6 ),
        .Q(\refresh_counter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[4]_i_1_n_5 ),
        .Q(\refresh_counter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[4]_i_1_n_4 ),
        .Q(\refresh_counter_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[8]_i_1_n_7 ),
        .Q(\refresh_counter_reg_n_0_[8] ),
        .R(1'b0));
  CARRY4 \refresh_counter_reg[8]_i_1 
       (.CI(\refresh_counter_reg[4]_i_1_n_0 ),
        .CO({\refresh_counter_reg[8]_i_1_n_0 ,\refresh_counter_reg[8]_i_1_n_1 ,\refresh_counter_reg[8]_i_1_n_2 ,\refresh_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\refresh_counter_reg[8]_i_1_n_4 ,\refresh_counter_reg[8]_i_1_n_5 ,\refresh_counter_reg[8]_i_1_n_6 ,\refresh_counter_reg[8]_i_1_n_7 }),
        .S({\refresh_counter_reg_n_0_[11] ,\refresh_counter_reg_n_0_[10] ,\refresh_counter_reg_n_0_[9] ,\refresh_counter_reg_n_0_[8] }));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_counter_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\refresh_counter_reg[8]_i_1_n_6 ),
        .Q(\refresh_counter_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h44C4C730)) 
    \seg_OBUF[0]_inst_i_1 
       (.I0(display_mode_IBUF),
        .I1(sel0[3]),
        .I2(sel0[0]),
        .I3(sel0[2]),
        .I4(sel0[1]),
        .O(seg_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hC7C0FC40)) 
    \seg_OBUF[1]_inst_i_1 
       (.I0(display_mode_IBUF),
        .I1(sel0[3]),
        .I2(sel0[1]),
        .I3(sel0[2]),
        .I4(sel0[0]),
        .O(seg_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8CEE0202)) 
    \seg_OBUF[2]_inst_i_1 
       (.I0(sel0[1]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(display_mode_IBUF),
        .I4(sel0[3]),
        .O(seg_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hF44347C0)) 
    \seg_OBUF[3]_inst_i_1 
       (.I0(display_mode_IBUF),
        .I1(sel0[3]),
        .I2(sel0[1]),
        .I3(sel0[2]),
        .I4(sel0[0]),
        .O(seg_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h223AEEFA)) 
    \seg_OBUF[4]_inst_i_1 
       (.I0(sel0[0]),
        .I1(sel0[3]),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .I4(display_mode_IBUF),
        .O(seg_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h33B0AF0A)) 
    \seg_OBUF[5]_inst_i_1 
       (.I0(sel0[0]),
        .I1(display_mode_IBUF),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .I4(sel0[3]),
        .O(seg_OBUF[5]));
  LUT5 #(
    .INIT(32'h1083FC83)) 
    \seg_OBUF[6]_inst_i_1 
       (.I0(sel0[0]),
        .I1(sel0[1]),
        .I2(sel0[2]),
        .I3(sel0[3]),
        .I4(display_mode_IBUF),
        .O(seg_OBUF[6]));
  LUT5 #(
    .INIT(32'h00008C80)) 
    \seg_OBUF[6]_inst_i_17 
       (.I0(Q[0]),
        .I1(display_state[0]),
        .I2(display_state[1]),
        .I3(\seg_OBUF[6]_inst_i_6_0 ),
        .I4(digit_select[0]),
        .O(\seg_OBUF[6]_inst_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAAAEAEEEAAAEA)) 
    \seg_OBUF[6]_inst_i_2 
       (.I0(\seg_OBUF[6]_inst_i_6_n_0 ),
        .I1(digit_select[0]),
        .I2(\seg_OBUF[0]_inst_i_1_0 ),
        .I3(display_mode_IBUF),
        .I4(Q[1]),
        .I5(\seg_OBUF[0]_inst_i_1_1 ),
        .O(sel0[0]));
  LUT6 #(
    .INIT(64'hF0FFFAF6F0F0FAF6)) 
    \seg_OBUF[6]_inst_i_3 
       (.I0(display_value[0]),
        .I1(\seg_OBUF[0]_inst_i_1_0 ),
        .I2(digit_select[1]),
        .I3(display_mode_IBUF),
        .I4(digit_select[0]),
        .I5(\seg_OBUF[0]_inst_i_1_4 ),
        .O(sel0[1]));
  LUT6 #(
    .INIT(64'hF0FFF0F9F0F0F0F9)) 
    \seg_OBUF[6]_inst_i_4 
       (.I0(\seg_OBUF[0]_inst_i_1_2 ),
        .I1(\seg_OBUF[0]_inst_i_1_3 ),
        .I2(digit_select[1]),
        .I3(digit_select[0]),
        .I4(display_mode_IBUF),
        .I5(display_value[1]),
        .O(sel0[2]));
  LUT6 #(
    .INIT(64'hF0FFF0F9F0F0F0F9)) 
    \seg_OBUF[6]_inst_i_5 
       (.I0(\seg_OBUF[0]_inst_i_1_5 ),
        .I1(\seg_OBUF[0]_inst_i_1_6 ),
        .I2(digit_select[1]),
        .I3(digit_select[0]),
        .I4(display_mode_IBUF),
        .I5(display_value[2]),
        .O(sel0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hEEEEEFEE)) 
    \seg_OBUF[6]_inst_i_6 
       (.I0(\seg_OBUF[6]_inst_i_17_n_0 ),
        .I1(digit_select[1]),
        .I2(display_state[0]),
        .I3(D),
        .I4(digit_select[0]),
        .O(\seg_OBUF[6]_inst_i_6_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
