
//-----------------------------------------------------------------
// System Generator version 13.4 VERILOG source file.
//
// Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------
module xldpram_71_dist (dina, addra, wea, a_ce, a_clr, a_clk, douta, addrb, b_ce, b_clr, b_clk, doutb);
parameter core_name0= "";
parameter c_width= 12;
parameter addr_width= 12;
parameter c_address_width= 4;
parameter c_depth= 16;
parameter c_mem_init_file= "null.mif";
parameter uid= 0;
parameter latency= 1;
parameter c_enable_rlocs= 1;
input [c_width-1:0] dina;
input [addr_width-1:0] addra;
input wea, a_ce, a_clr, a_clk;
output [c_width-1:0] douta;
input [addr_width-1:0] addrb;
input b_ce, b_clr, b_clk;
output [c_width-1:0] doutb;
wire [c_address_width-1:0] core_addra,core_addrb;
wire [c_width-1:0] core_douta,core_doutb;
wire [c_width-1:0] reg_douta,reg_doutb;
   assign core_addra = addra;
   assign core_addrb = addrb;
   assign douta = reg_douta;
   assign doutb = reg_doutb;
generate
[% names_already_seen = {}                                                 -%]
[% FOREACH name = core_name0                                               -%]
[%   NEXT IF (! name.defined || names_already_seen.$name == 1)             -%]
[%   names_already_seen.$name = 1                                          -%]
[%   i = loop.index                                                        -%]
[%   inst_txt = core_instance_text.$i                                      -%]
  if (core_name0 == "[% name %]")
    begin:comp[% i %]
    [% name %] core_instance[% i %] (
      .A(core_addra),
      .CLK(a_clk),
      .D(dina),
      .WE(wea),
      .DPRA(core_addrb),
      .SPO(core_douta),
      .DPO(core_doutb));
  end
[% END -%]
 if (latency > 0)
   begin:registered_dpram_instA
      synth_reg # (c_width, latency)
        output_regA (.i(core_douta),
                     .ce(a_ce),
                     .clr(a_clr),
                     .clk(a_clk),
                     .o(reg_douta));
   end
 if (latency > 0)
   begin:registered_dpram_instB
      synth_reg # (c_width, latency)
        output_regB (.i(core_doutb),
                     .ce(b_ce),
                     .clr(b_clr),
                     .clk(b_clk),
                     .o(reg_doutb));
   end

   if (latency == 0)
     begin:nonregistered_ram
        assign reg_douta = core_douta;
        assign reg_doutb = core_doutb;
     end
endgenerate
endmodule