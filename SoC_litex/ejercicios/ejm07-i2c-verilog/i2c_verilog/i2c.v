
// synopsys translate_off
`include "timescale.v"
// synopsys translate_on

`include "i2c_master_defines.v"

module i2c(
	I2C_clk, I2C_rst,
    prescale,control,transmit,receive,command,status,
    scl,sda );

	//
	// inputs & outputs
	//

	// signals on left side
	input        I2C_clk;     // master clock input
	input        I2C_rst;     // synchronous active high reset (Asignar self reset)
	//output       I2C_intrp;    // interrupt request signal output

	//signals on right side
	inout scl; // i2c clock line
	inout sda; // i2c data line

	reg I2C_intrp;

	//Registers to wishbone
  input  wire [ 15:0] prescale; // clock prescale register
	input  wire [ 7:0] control;  // control register
	input  wire [ 7:0] transmit;  // transmit register
	output wire [ 7:0] receive;  // receive register
	input  wire [ 7:0] command;   // command register
	output wire [ 7:0] status;   // status register

	// I2C signals (REVISAR DOCUMENTACION pag 3)
	// i2c clock line
	wire scl_pad_i;       // SCL-line input
	wire scl_pad_o;       // SCL-line output (always 1'b0)
	wire scl_padoen_o;    // SCL-line output enable (active low)

	// i2c data line
	wire sda_pad_i;       // SDA-line input
	wire sda_pad_o;       // SDA-line output (always 1'b0)
	wire sda_padoen_o;    // SDA-line output enable (active low)

  assign scl = scl_padoen_o ? 1'bz : scl_pad_o;
  assign sda = sda_padoen_o ? 1'bz: sda_pad_o;
  assign scl_pad_i = scl;
  assign sda_pad_i = sda;

	//
	// variable declarations
	//

//	// registers
	reg  [15:0] prer; // clock prescale register
	reg  [ 7:0] ctr;  // control register
	reg  [ 7:0] txr;  // transmit register;
	reg  [ 7:0] cr;   // command register;



	// done signal: command completed, clear command register
	wire done;

	// core enable signal
	wire core_en;
	wire ien;

	// status register signals
	wire irxack;
	reg  rxack;       // received aknowledge from slave
	reg  tip;         // transfer in progress
	reg  irq_flag;    // interrupt pending flag
	wire i2c_busy;    // bus busy (start signal detected)
	wire i2c_al;      // i2c bus arbitration lost
	reg  al;          // status register arbitration lost bit

	//
	// module body
	//

	// generate internal reset


	// generate registers
	always @(posedge I2C_clk)
      if (I2C_rst)begin
	        prer <= #1 16'hffff;
	        ctr  <= #1  8'h0;
	        txr  <= #1  8'h0;
	    end
	    else
	    begin
	       prer <= prescale;
	       ctr <= control;
         txr <= transmit;
	    end
	// generate command register (special case)
	always @(posedge I2C_clk)
	  if (I2C_rst)
	    cr <= #1 8'h0;
	  else if (done | i2c_al)
	   begin
	        cr[7:4] <= #1 4'h0;           // clear command bits when done
	                                        // or when aribitration lost
	        cr[2:1] <= #1 2'b0;             // reserved bits
	        cr[0]   <= #1 1'b0;             // clear IRQ_ACK bit
	    end
	    else
	       begin
            cr <= command;
	       end


	// decode command register
	wire sta;
	wire sto;
	wire rd;
	wire wr;
	wire ack;
	wire iack;

	assign sta  = cr[7];
	assign sto  = cr[6];
	assign rd   = cr[5];
	assign wr   = cr[4];
	assign ack  = cr[3];
	assign iack = cr[0];

	// decode control register
	assign core_en = ctr[7];
	assign ien = ctr[6];

	// hookup byte controller block
	i2c_master_byte_ctrl byte_controller (
		.clk      ( I2C_clk     ),
		.rst      ( I2C_rst     ),
		.ena      ( core_en      ),
		.clk_cnt  ( prer         ),
		.start    ( sta          ),
		.stop     ( sto          ),
		.read     ( rd           ),
		.write    ( wr           ),
		.ack_in   ( ack          ),
		.din      ( txr          ),
		.cmd_ack  ( done         ),
		.ack_out  ( irxack       ),
		.dout     ( receive      ),
		.i2c_busy ( i2c_busy     ),
		.i2c_al   ( i2c_al       ),
		.scl_i    ( scl_pad_i    ),
		.scl_o    ( scl_pad_o    ),
		.scl_oen  ( scl_padoen_o ),
		.sda_i    ( sda_pad_i    ),
		.sda_o    ( sda_pad_o    ),
		.sda_oen  ( sda_padoen_o )
	);

	// status register block + interrupt request signal
	always @(posedge I2C_clk)
	  if (I2C_rst)
	    begin
	        al       <= #1 1'b0;
	        rxack    <= #1 1'b0;
	        tip      <= #1 1'b0;
	        irq_flag <= #1 1'b0;
	    end
	  else
	    begin
	        al       <= #1 i2c_al | (al & ~sta);
	        rxack    <= #1 irxack;
	        tip      <= #1 (rd | wr);
	        irq_flag <= #1 (done | i2c_al | irq_flag) & ~iack; // interrupt request flag is always generated
	    end

	// generate interrupt request signals
	always @(posedge I2C_clk)
	  if (I2C_rst)
	    I2C_intrp <= #1 1'b0;
	  else
	    I2C_intrp <= #1 irq_flag && ien; // interrupt signal is only generated when IEN (interrupt enable bit is set)

	// assign status register bits
	assign status[7]   = rxack;
	assign status[6]   = i2c_busy;
	assign status[5]   = al;
	assign status[4:2] = 3'h0; // reserved
	assign status[1]   = tip;
	assign status[0]   = irq_flag;

endmodule
