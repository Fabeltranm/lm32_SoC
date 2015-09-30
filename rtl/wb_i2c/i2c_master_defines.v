//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2013 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement. 
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
//   --------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02 
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   --------------------------------------------------------------------
//  CVS Log
//
//  $Id: RD#RD1046#source#verilog#i2c_master_defines.v,v 1.6 2013-10-10 07:45:03-07 vpatil Exp $
//
//  $Date: 2013-10-10 07:45:03-07 $
//  $Revision: 1.6 $
//  $Author: vpatil $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: RD#RD1046#source#verilog#i2c_master_defines.v,v $
//               Revision 1.6  2013-10-10 07:45:03-07  vpatil
//               Updated header.
//
//               Revision 1.5  2013-10-10 07:44:10-07  vpatil
//               ...No comments entered during checkin...
//
//               Revision 1.4  2013-07-04 02:56:01-07  lsccad
//               Automatically checked in.
//
//               Revision 1.3  2001/11/05 11:59:25  rherveille
//               Fixed wb_ack_o generation bug.
//               Fixed bug in the byte_controller statemachine.
//               Added headers.
//


// I2C registers wishbone addresses

// bitcontroller states
`define I2C_CMD_NOP   4'b0000
`define I2C_CMD_START 4'b0001
`define I2C_CMD_STOP  4'b0010
`define I2C_CMD_WRITE 4'b0100
`define I2C_CMD_READ  4'b1000
