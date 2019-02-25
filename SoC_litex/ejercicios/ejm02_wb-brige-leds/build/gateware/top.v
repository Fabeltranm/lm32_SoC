/* Machine-generated using LiteX gen */
module top(
	input clk32,
	input cpu_reset,
	output reg serial_tx,
	input serial_rx,
	output user_led0,
	output user_led1,
	output user_led2,
	output user_led3,
	output user_led4,
	output user_led5,
	output user_led6,
	output user_led7,
	output user_led8
);

wire basesoc_reset_reset_re;
wire basesoc_reset_reset_r;
reg basesoc_reset_reset_w = 1'd0;
reg [31:0] basesoc_storage_full = 32'd305419896;
wire [31:0] basesoc_storage;
reg basesoc_re = 1'd0;
wire [31:0] basesoc_bus_errors_status;
wire basesoc_reset;
wire basesoc_bus_error;
reg [31:0] basesoc_bus_errors = 32'd0;
wire [29:0] basesoc_sram_bus_adr;
wire [31:0] basesoc_sram_bus_dat_w;
wire [31:0] basesoc_sram_bus_dat_r;
wire [3:0] basesoc_sram_bus_sel;
wire basesoc_sram_bus_cyc;
wire basesoc_sram_bus_stb;
reg basesoc_sram_bus_ack = 1'd0;
wire basesoc_sram_bus_we;
wire [2:0] basesoc_sram_bus_cti;
wire [1:0] basesoc_sram_bus_bte;
reg basesoc_sram_bus_err = 1'd0;
wire [9:0] basesoc_sram_adr;
wire [31:0] basesoc_sram_dat_r;
reg [3:0] basesoc_sram_we = 4'd0;
wire [31:0] basesoc_sram_dat_w;
reg [13:0] basesoc_interface_adr = 14'd0;
reg basesoc_interface_we = 1'd0;
reg [31:0] basesoc_interface_dat_w = 32'd0;
wire [31:0] basesoc_interface_dat_r;
wire [29:0] basesoc_bus_wishbone_adr;
wire [31:0] basesoc_bus_wishbone_dat_w;
reg [31:0] basesoc_bus_wishbone_dat_r = 32'd0;
wire [3:0] basesoc_bus_wishbone_sel;
wire basesoc_bus_wishbone_cyc;
wire basesoc_bus_wishbone_stb;
reg basesoc_bus_wishbone_ack = 1'd0;
wire basesoc_bus_wishbone_we;
wire [2:0] basesoc_bus_wishbone_cti;
wire [1:0] basesoc_bus_wishbone_bte;
reg basesoc_bus_wishbone_err = 1'd0;
reg [1:0] basesoc_counter = 2'd0;
reg [31:0] basesoc_load_storage_full = 32'd0;
wire [31:0] basesoc_load_storage;
reg basesoc_load_re = 1'd0;
reg [31:0] basesoc_reload_storage_full = 32'd0;
wire [31:0] basesoc_reload_storage;
reg basesoc_reload_re = 1'd0;
reg basesoc_en_storage_full = 1'd0;
wire basesoc_en_storage;
reg basesoc_en_re = 1'd0;
wire basesoc_update_value_re;
wire basesoc_update_value_r;
reg basesoc_update_value_w = 1'd0;
reg [31:0] basesoc_value_status = 32'd0;
wire basesoc_irq;
wire basesoc_zero_status;
reg basesoc_zero_pending = 1'd0;
wire basesoc_zero_trigger;
reg basesoc_zero_clear = 1'd0;
reg basesoc_zero_old_trigger = 1'd0;
wire basesoc_eventmanager_status_re;
wire basesoc_eventmanager_status_r;
wire basesoc_eventmanager_status_w;
wire basesoc_eventmanager_pending_re;
wire basesoc_eventmanager_pending_r;
wire basesoc_eventmanager_pending_w;
reg basesoc_eventmanager_storage_full = 1'd0;
wire basesoc_eventmanager_storage;
reg basesoc_eventmanager_re = 1'd0;
reg [31:0] basesoc_value = 32'd0;
wire sys_clk;
wire sys_rst;
wire por_clk;
reg int_rst = 1'd1;
reg [31:0] uartwishbonebridge_storage = 32'd15461882;
reg uartwishbonebridge_sink_valid = 1'd0;
reg uartwishbonebridge_sink_ready = 1'd0;
wire uartwishbonebridge_sink_last;
reg [7:0] uartwishbonebridge_sink_payload_data = 8'd0;
reg uartwishbonebridge_uart_clk_txen = 1'd0;
reg [31:0] uartwishbonebridge_phase_accumulator_tx = 32'd0;
reg [7:0] uartwishbonebridge_tx_reg = 8'd0;
reg [3:0] uartwishbonebridge_tx_bitcount = 4'd0;
reg uartwishbonebridge_tx_busy = 1'd0;
reg uartwishbonebridge_source_valid = 1'd0;
wire uartwishbonebridge_source_ready;
reg [7:0] uartwishbonebridge_source_payload_data = 8'd0;
reg uartwishbonebridge_uart_clk_rxen = 1'd0;
reg [31:0] uartwishbonebridge_phase_accumulator_rx = 32'd0;
wire uartwishbonebridge_rx;
reg uartwishbonebridge_rx_r = 1'd0;
reg [7:0] uartwishbonebridge_rx_reg = 8'd0;
reg [3:0] uartwishbonebridge_rx_bitcount = 4'd0;
reg uartwishbonebridge_rx_busy = 1'd0;
wire [29:0] uartwishbonebridge_wishbone_adr;
wire [31:0] uartwishbonebridge_wishbone_dat_w;
wire [31:0] uartwishbonebridge_wishbone_dat_r;
wire [3:0] uartwishbonebridge_wishbone_sel;
reg uartwishbonebridge_wishbone_cyc = 1'd0;
reg uartwishbonebridge_wishbone_stb = 1'd0;
wire uartwishbonebridge_wishbone_ack;
reg uartwishbonebridge_wishbone_we = 1'd0;
reg [2:0] uartwishbonebridge_wishbone_cti = 3'd0;
reg [1:0] uartwishbonebridge_wishbone_bte = 2'd0;
wire uartwishbonebridge_wishbone_err;
reg [2:0] uartwishbonebridge_byte_counter = 3'd0;
reg uartwishbonebridge_byte_counter_reset = 1'd0;
reg uartwishbonebridge_byte_counter_ce = 1'd0;
reg [2:0] uartwishbonebridge_word_counter = 3'd0;
reg uartwishbonebridge_word_counter_reset = 1'd0;
reg uartwishbonebridge_word_counter_ce = 1'd0;
reg [7:0] uartwishbonebridge_cmd = 8'd0;
reg uartwishbonebridge_cmd_ce = 1'd0;
reg [7:0] uartwishbonebridge_length = 8'd0;
reg uartwishbonebridge_length_ce = 1'd0;
reg [31:0] uartwishbonebridge_address = 32'd0;
reg uartwishbonebridge_address_ce = 1'd0;
reg [31:0] uartwishbonebridge_data = 32'd0;
reg uartwishbonebridge_rx_data_ce = 1'd0;
reg uartwishbonebridge_tx_data_ce = 1'd0;
wire uartwishbonebridge_reset;
wire uartwishbonebridge_wait;
wire uartwishbonebridge_done;
reg [21:0] uartwishbonebridge_count = 22'd3200000;
reg uartwishbonebridge_is_ongoing = 1'd0;
reg [8:0] leds_storage_full = 9'd0;
wire [8:0] leds_storage;
reg leds_re = 1'd0;
reg [2:0] state = 3'd0;
reg [2:0] next_state = 3'd0;
wire [29:0] shared_adr;
wire [31:0] shared_dat_w;
reg [31:0] shared_dat_r = 32'd0;
wire [3:0] shared_sel;
wire shared_cyc;
wire shared_stb;
reg shared_ack = 1'd0;
wire shared_we;
wire [2:0] shared_cti;
wire [1:0] shared_bte;
wire shared_err;
wire request;
wire grant;
reg [1:0] slave_sel = 2'd0;
reg [1:0] slave_sel_r = 2'd0;
reg error = 1'd0;
wire wait_1;
wire done;
reg [19:0] count = 20'd1000000;
wire [13:0] interface0_bank_bus_adr;
wire interface0_bank_bus_we;
wire [31:0] interface0_bank_bus_dat_w;
reg [31:0] interface0_bank_bus_dat_r = 32'd0;
wire csrbank0_scratch0_re;
wire [31:0] csrbank0_scratch0_r;
wire [31:0] csrbank0_scratch0_w;
wire csrbank0_bus_errors_re;
wire [31:0] csrbank0_bus_errors_r;
wire [31:0] csrbank0_bus_errors_w;
wire csrbank0_sel;
wire [13:0] sram_bus_adr;
wire sram_bus_we;
wire [31:0] sram_bus_dat_w;
reg [31:0] sram_bus_dat_r = 32'd0;
wire [5:0] adr;
wire [7:0] dat_r;
wire sel;
reg sel_r = 1'd0;
wire [13:0] interface1_bank_bus_adr;
wire interface1_bank_bus_we;
wire [31:0] interface1_bank_bus_dat_w;
reg [31:0] interface1_bank_bus_dat_r = 32'd0;
wire csrbank1_out0_re;
wire [8:0] csrbank1_out0_r;
wire [8:0] csrbank1_out0_w;
wire csrbank1_sel;
wire [13:0] interface2_bank_bus_adr;
wire interface2_bank_bus_we;
wire [31:0] interface2_bank_bus_dat_w;
reg [31:0] interface2_bank_bus_dat_r = 32'd0;
wire csrbank2_load0_re;
wire [31:0] csrbank2_load0_r;
wire [31:0] csrbank2_load0_w;
wire csrbank2_reload0_re;
wire [31:0] csrbank2_reload0_r;
wire [31:0] csrbank2_reload0_w;
wire csrbank2_en0_re;
wire csrbank2_en0_r;
wire csrbank2_en0_w;
wire csrbank2_value_re;
wire [31:0] csrbank2_value_r;
wire [31:0] csrbank2_value_w;
wire csrbank2_ev_enable0_re;
wire csrbank2_ev_enable0_r;
wire csrbank2_ev_enable0_w;
wire csrbank2_sel;
reg [29:0] array_muxed0 = 30'd0;
reg [31:0] array_muxed1 = 32'd0;
reg [3:0] array_muxed2 = 4'd0;
reg array_muxed3 = 1'd0;
reg array_muxed4 = 1'd0;
reg array_muxed5 = 1'd0;
reg [2:0] array_muxed6 = 3'd0;
reg [1:0] array_muxed7 = 2'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg regs0 = 1'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg regs1 = 1'd0;

assign basesoc_bus_error = error;
assign basesoc_reset = basesoc_reset_reset_re;
assign basesoc_bus_errors_status = basesoc_bus_errors;
always @(*) begin
	basesoc_sram_we <= 4'd0;
	basesoc_sram_we[0] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[0]);
	basesoc_sram_we[1] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[1]);
	basesoc_sram_we[2] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[2]);
	basesoc_sram_we[3] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[3]);
end
assign basesoc_sram_adr = basesoc_sram_bus_adr[9:0];
assign basesoc_sram_bus_dat_r = basesoc_sram_dat_r;
assign basesoc_sram_dat_w = basesoc_sram_bus_dat_w;
assign basesoc_zero_trigger = (basesoc_value != 1'd0);
assign basesoc_eventmanager_status_w = basesoc_zero_status;
always @(*) begin
	basesoc_zero_clear <= 1'd0;
	if ((basesoc_eventmanager_pending_re & basesoc_eventmanager_pending_r)) begin
		basesoc_zero_clear <= 1'd1;
	end
end
assign basesoc_eventmanager_pending_w = basesoc_zero_pending;
assign basesoc_irq = (basesoc_eventmanager_pending_w & basesoc_eventmanager_storage);
assign basesoc_zero_status = basesoc_zero_trigger;
assign sys_clk = clk32;
assign por_clk = clk32;
assign sys_rst = int_rst;
assign uartwishbonebridge_reset = uartwishbonebridge_done;
assign uartwishbonebridge_source_ready = 1'd1;
assign uartwishbonebridge_wishbone_adr = (uartwishbonebridge_address + uartwishbonebridge_word_counter);
assign uartwishbonebridge_wishbone_dat_w = uartwishbonebridge_data;
assign uartwishbonebridge_wishbone_sel = 4'd15;
always @(*) begin
	uartwishbonebridge_sink_payload_data <= 8'd0;
	case (uartwishbonebridge_byte_counter)
		1'd0: begin
			uartwishbonebridge_sink_payload_data <= uartwishbonebridge_data[31:24];
		end
		1'd1: begin
			uartwishbonebridge_sink_payload_data <= uartwishbonebridge_data[23:16];
		end
		2'd2: begin
			uartwishbonebridge_sink_payload_data <= uartwishbonebridge_data[15:8];
		end
		default: begin
			uartwishbonebridge_sink_payload_data <= uartwishbonebridge_data[7:0];
		end
	endcase
end
assign uartwishbonebridge_wait = (~uartwishbonebridge_is_ongoing);
assign uartwishbonebridge_sink_last = ((uartwishbonebridge_byte_counter == 2'd3) & (uartwishbonebridge_word_counter == (uartwishbonebridge_length - 1'd1)));
always @(*) begin
	next_state <= 3'd0;
	uartwishbonebridge_wishbone_cyc <= 1'd0;
	uartwishbonebridge_cmd_ce <= 1'd0;
	uartwishbonebridge_wishbone_stb <= 1'd0;
	uartwishbonebridge_length_ce <= 1'd0;
	uartwishbonebridge_wishbone_we <= 1'd0;
	uartwishbonebridge_address_ce <= 1'd0;
	uartwishbonebridge_rx_data_ce <= 1'd0;
	uartwishbonebridge_byte_counter_reset <= 1'd0;
	uartwishbonebridge_is_ongoing <= 1'd0;
	uartwishbonebridge_byte_counter_ce <= 1'd0;
	uartwishbonebridge_tx_data_ce <= 1'd0;
	uartwishbonebridge_word_counter_reset <= 1'd0;
	uartwishbonebridge_sink_valid <= 1'd0;
	uartwishbonebridge_word_counter_ce <= 1'd0;
	next_state <= state;
	case (state)
		1'd1: begin
			if (uartwishbonebridge_source_valid) begin
				uartwishbonebridge_length_ce <= 1'd1;
				next_state <= 2'd2;
			end
		end
		2'd2: begin
			if (uartwishbonebridge_source_valid) begin
				uartwishbonebridge_address_ce <= 1'd1;
				uartwishbonebridge_byte_counter_ce <= 1'd1;
				if ((uartwishbonebridge_byte_counter == 2'd3)) begin
					if ((uartwishbonebridge_cmd == 1'd1)) begin
						next_state <= 2'd3;
					end else begin
						if ((uartwishbonebridge_cmd == 2'd2)) begin
							next_state <= 3'd5;
						end
					end
					uartwishbonebridge_byte_counter_reset <= 1'd1;
				end
			end
		end
		2'd3: begin
			if (uartwishbonebridge_source_valid) begin
				uartwishbonebridge_rx_data_ce <= 1'd1;
				uartwishbonebridge_byte_counter_ce <= 1'd1;
				if ((uartwishbonebridge_byte_counter == 2'd3)) begin
					next_state <= 3'd4;
					uartwishbonebridge_byte_counter_reset <= 1'd1;
				end
			end
		end
		3'd4: begin
			uartwishbonebridge_wishbone_stb <= 1'd1;
			uartwishbonebridge_wishbone_we <= 1'd1;
			uartwishbonebridge_wishbone_cyc <= 1'd1;
			if (uartwishbonebridge_wishbone_ack) begin
				uartwishbonebridge_word_counter_ce <= 1'd1;
				if ((uartwishbonebridge_word_counter == (uartwishbonebridge_length - 1'd1))) begin
					next_state <= 1'd0;
				end else begin
					next_state <= 2'd3;
				end
			end
		end
		3'd5: begin
			uartwishbonebridge_wishbone_stb <= 1'd1;
			uartwishbonebridge_wishbone_we <= 1'd0;
			uartwishbonebridge_wishbone_cyc <= 1'd1;
			if (uartwishbonebridge_wishbone_ack) begin
				uartwishbonebridge_tx_data_ce <= 1'd1;
				next_state <= 3'd6;
			end
		end
		3'd6: begin
			uartwishbonebridge_sink_valid <= 1'd1;
			if (uartwishbonebridge_sink_ready) begin
				uartwishbonebridge_byte_counter_ce <= 1'd1;
				if ((uartwishbonebridge_byte_counter == 2'd3)) begin
					uartwishbonebridge_word_counter_ce <= 1'd1;
					if ((uartwishbonebridge_word_counter == (uartwishbonebridge_length - 1'd1))) begin
						next_state <= 1'd0;
					end else begin
						next_state <= 3'd5;
						uartwishbonebridge_byte_counter_reset <= 1'd1;
					end
				end
			end
		end
		default: begin
			if (uartwishbonebridge_source_valid) begin
				uartwishbonebridge_cmd_ce <= 1'd1;
				if (((uartwishbonebridge_source_payload_data == 1'd1) | (uartwishbonebridge_source_payload_data == 2'd2))) begin
					next_state <= 1'd1;
				end
				uartwishbonebridge_byte_counter_reset <= 1'd1;
				uartwishbonebridge_word_counter_reset <= 1'd1;
			end
			uartwishbonebridge_is_ongoing <= 1'd1;
		end
	endcase
end
assign uartwishbonebridge_done = (uartwishbonebridge_count == 1'd0);
assign {user_led8, user_led7, user_led6, user_led5, user_led4, user_led3, user_led2, user_led1, user_led0} = leds_storage;
assign shared_adr = array_muxed0;
assign shared_dat_w = array_muxed1;
assign shared_sel = array_muxed2;
assign shared_cyc = array_muxed3;
assign shared_stb = array_muxed4;
assign shared_we = array_muxed5;
assign shared_cti = array_muxed6;
assign shared_bte = array_muxed7;
assign uartwishbonebridge_wishbone_dat_r = shared_dat_r;
assign uartwishbonebridge_wishbone_ack = (shared_ack & (grant == 1'd0));
assign uartwishbonebridge_wishbone_err = (shared_err & (grant == 1'd0));
assign request = {uartwishbonebridge_wishbone_cyc};
assign grant = 1'd0;
always @(*) begin
	slave_sel <= 2'd0;
	slave_sel[0] <= (shared_adr[28:26] == 1'd1);
	slave_sel[1] <= (shared_adr[28:26] == 3'd6);
end
assign basesoc_sram_bus_adr = shared_adr;
assign basesoc_sram_bus_dat_w = shared_dat_w;
assign basesoc_sram_bus_sel = shared_sel;
assign basesoc_sram_bus_stb = shared_stb;
assign basesoc_sram_bus_we = shared_we;
assign basesoc_sram_bus_cti = shared_cti;
assign basesoc_sram_bus_bte = shared_bte;
assign basesoc_bus_wishbone_adr = shared_adr;
assign basesoc_bus_wishbone_dat_w = shared_dat_w;
assign basesoc_bus_wishbone_sel = shared_sel;
assign basesoc_bus_wishbone_stb = shared_stb;
assign basesoc_bus_wishbone_we = shared_we;
assign basesoc_bus_wishbone_cti = shared_cti;
assign basesoc_bus_wishbone_bte = shared_bte;
assign basesoc_sram_bus_cyc = (shared_cyc & slave_sel[0]);
assign basesoc_bus_wishbone_cyc = (shared_cyc & slave_sel[1]);
assign shared_err = (basesoc_sram_bus_err | basesoc_bus_wishbone_err);
assign wait_1 = ((shared_stb & shared_cyc) & (~shared_ack));
always @(*) begin
	shared_ack <= 1'd0;
	error <= 1'd0;
	shared_dat_r <= 32'd0;
	shared_ack <= (basesoc_sram_bus_ack | basesoc_bus_wishbone_ack);
	shared_dat_r <= (({32{slave_sel_r[0]}} & basesoc_sram_bus_dat_r) | ({32{slave_sel_r[1]}} & basesoc_bus_wishbone_dat_r));
	if (done) begin
		shared_dat_r <= 32'd4294967295;
		shared_ack <= 1'd1;
		error <= 1'd1;
	end
end
assign done = (count == 1'd0);
assign csrbank0_sel = (interface0_bank_bus_adr[13:9] == 1'd0);
assign basesoc_reset_reset_r = interface0_bank_bus_dat_w[0];
assign basesoc_reset_reset_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[1:0] == 1'd0));
assign csrbank0_scratch0_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_scratch0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[1:0] == 1'd1));
assign csrbank0_bus_errors_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_bus_errors_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[1:0] == 2'd2));
assign basesoc_storage = basesoc_storage_full[31:0];
assign csrbank0_scratch0_w = basesoc_storage_full[31:0];
assign csrbank0_bus_errors_w = basesoc_bus_errors_status[31:0];
assign sel = (sram_bus_adr[13:9] == 3'd4);
always @(*) begin
	sram_bus_dat_r <= 32'd0;
	if (sel_r) begin
		sram_bus_dat_r <= dat_r;
	end
end
assign adr = sram_bus_adr[5:0];
assign csrbank1_sel = (interface1_bank_bus_adr[13:9] == 4'd8);
assign csrbank1_out0_r = interface1_bank_bus_dat_w[8:0];
assign csrbank1_out0_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[0] == 1'd0));
assign leds_storage = leds_storage_full[8:0];
assign csrbank1_out0_w = leds_storage_full[8:0];
assign csrbank2_sel = (interface2_bank_bus_adr[13:9] == 3'd5);
assign csrbank2_load0_r = interface2_bank_bus_dat_w[31:0];
assign csrbank2_load0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 1'd0));
assign csrbank2_reload0_r = interface2_bank_bus_dat_w[31:0];
assign csrbank2_reload0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 1'd1));
assign csrbank2_en0_r = interface2_bank_bus_dat_w[0];
assign csrbank2_en0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 2'd2));
assign basesoc_update_value_r = interface2_bank_bus_dat_w[0];
assign basesoc_update_value_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 2'd3));
assign csrbank2_value_r = interface2_bank_bus_dat_w[31:0];
assign csrbank2_value_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 3'd4));
assign basesoc_eventmanager_status_r = interface2_bank_bus_dat_w[0];
assign basesoc_eventmanager_status_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 3'd5));
assign basesoc_eventmanager_pending_r = interface2_bank_bus_dat_w[0];
assign basesoc_eventmanager_pending_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 3'd6));
assign csrbank2_ev_enable0_r = interface2_bank_bus_dat_w[0];
assign csrbank2_ev_enable0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[2:0] == 3'd7));
assign basesoc_load_storage = basesoc_load_storage_full[31:0];
assign csrbank2_load0_w = basesoc_load_storage_full[31:0];
assign basesoc_reload_storage = basesoc_reload_storage_full[31:0];
assign csrbank2_reload0_w = basesoc_reload_storage_full[31:0];
assign basesoc_en_storage = basesoc_en_storage_full;
assign csrbank2_en0_w = basesoc_en_storage_full;
assign csrbank2_value_w = basesoc_value_status[31:0];
assign basesoc_eventmanager_storage = basesoc_eventmanager_storage_full;
assign csrbank2_ev_enable0_w = basesoc_eventmanager_storage_full;
assign interface0_bank_bus_adr = basesoc_interface_adr;
assign interface1_bank_bus_adr = basesoc_interface_adr;
assign interface2_bank_bus_adr = basesoc_interface_adr;
assign sram_bus_adr = basesoc_interface_adr;
assign interface0_bank_bus_we = basesoc_interface_we;
assign interface1_bank_bus_we = basesoc_interface_we;
assign interface2_bank_bus_we = basesoc_interface_we;
assign sram_bus_we = basesoc_interface_we;
assign interface0_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface1_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface2_bank_bus_dat_w = basesoc_interface_dat_w;
assign sram_bus_dat_w = basesoc_interface_dat_w;
assign basesoc_interface_dat_r = (((interface0_bank_bus_dat_r | interface1_bank_bus_dat_r) | interface2_bank_bus_dat_r) | sram_bus_dat_r);
always @(*) begin
	array_muxed0 <= 30'd0;
	case (grant)
		default: begin
			array_muxed0 <= uartwishbonebridge_wishbone_adr;
		end
	endcase
end
always @(*) begin
	array_muxed1 <= 32'd0;
	case (grant)
		default: begin
			array_muxed1 <= uartwishbonebridge_wishbone_dat_w;
		end
	endcase
end
always @(*) begin
	array_muxed2 <= 4'd0;
	case (grant)
		default: begin
			array_muxed2 <= uartwishbonebridge_wishbone_sel;
		end
	endcase
end
always @(*) begin
	array_muxed3 <= 1'd0;
	case (grant)
		default: begin
			array_muxed3 <= uartwishbonebridge_wishbone_cyc;
		end
	endcase
end
always @(*) begin
	array_muxed4 <= 1'd0;
	case (grant)
		default: begin
			array_muxed4 <= uartwishbonebridge_wishbone_stb;
		end
	endcase
end
always @(*) begin
	array_muxed5 <= 1'd0;
	case (grant)
		default: begin
			array_muxed5 <= uartwishbonebridge_wishbone_we;
		end
	endcase
end
always @(*) begin
	array_muxed6 <= 3'd0;
	case (grant)
		default: begin
			array_muxed6 <= uartwishbonebridge_wishbone_cti;
		end
	endcase
end
always @(*) begin
	array_muxed7 <= 2'd0;
	case (grant)
		default: begin
			array_muxed7 <= uartwishbonebridge_wishbone_bte;
		end
	endcase
end
assign uartwishbonebridge_rx = regs1;

always @(posedge por_clk) begin
	int_rst <= (~cpu_reset);
end

always @(posedge sys_clk) begin
	if ((basesoc_bus_errors != 32'd4294967295)) begin
		if (basesoc_bus_error) begin
			basesoc_bus_errors <= (basesoc_bus_errors + 1'd1);
		end
	end
	basesoc_sram_bus_ack <= 1'd0;
	if (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & (~basesoc_sram_bus_ack))) begin
		basesoc_sram_bus_ack <= 1'd1;
	end
	basesoc_interface_we <= 1'd0;
	basesoc_interface_dat_w <= basesoc_bus_wishbone_dat_w;
	basesoc_interface_adr <= basesoc_bus_wishbone_adr;
	basesoc_bus_wishbone_dat_r <= basesoc_interface_dat_r;
	if ((basesoc_counter == 1'd1)) begin
		basesoc_interface_we <= basesoc_bus_wishbone_we;
	end
	if ((basesoc_counter == 2'd2)) begin
		basesoc_bus_wishbone_ack <= 1'd1;
	end
	if ((basesoc_counter == 2'd3)) begin
		basesoc_bus_wishbone_ack <= 1'd0;
	end
	if ((basesoc_counter != 1'd0)) begin
		basesoc_counter <= (basesoc_counter + 1'd1);
	end else begin
		if ((basesoc_bus_wishbone_cyc & basesoc_bus_wishbone_stb)) begin
			basesoc_counter <= 1'd1;
		end
	end
	if (basesoc_en_storage) begin
		if ((basesoc_value == 1'd0)) begin
			basesoc_value <= basesoc_reload_storage;
		end else begin
			basesoc_value <= (basesoc_value - 1'd1);
		end
	end else begin
		basesoc_value <= basesoc_load_storage;
	end
	if (basesoc_update_value_re) begin
		basesoc_value_status <= basesoc_value;
	end
	if (basesoc_zero_clear) begin
		basesoc_zero_pending <= 1'd0;
	end
	basesoc_zero_old_trigger <= basesoc_zero_trigger;
	if (((~basesoc_zero_trigger) & basesoc_zero_old_trigger)) begin
		basesoc_zero_pending <= 1'd1;
	end
	if (uartwishbonebridge_byte_counter_reset) begin
		uartwishbonebridge_byte_counter <= 1'd0;
	end else begin
		if (uartwishbonebridge_byte_counter_ce) begin
			uartwishbonebridge_byte_counter <= (uartwishbonebridge_byte_counter + 1'd1);
		end
	end
	if (uartwishbonebridge_word_counter_reset) begin
		uartwishbonebridge_word_counter <= 1'd0;
	end else begin
		if (uartwishbonebridge_word_counter_ce) begin
			uartwishbonebridge_word_counter <= (uartwishbonebridge_word_counter + 1'd1);
		end
	end
	if (uartwishbonebridge_cmd_ce) begin
		uartwishbonebridge_cmd <= uartwishbonebridge_source_payload_data;
	end
	if (uartwishbonebridge_length_ce) begin
		uartwishbonebridge_length <= uartwishbonebridge_source_payload_data;
	end
	if (uartwishbonebridge_address_ce) begin
		uartwishbonebridge_address <= {uartwishbonebridge_address[23:0], uartwishbonebridge_source_payload_data};
	end
	if (uartwishbonebridge_rx_data_ce) begin
		uartwishbonebridge_data <= {uartwishbonebridge_data[23:0], uartwishbonebridge_source_payload_data};
	end else begin
		if (uartwishbonebridge_tx_data_ce) begin
			uartwishbonebridge_data <= uartwishbonebridge_wishbone_dat_r;
		end
	end
	uartwishbonebridge_sink_ready <= 1'd0;
	if (((uartwishbonebridge_sink_valid & (~uartwishbonebridge_tx_busy)) & (~uartwishbonebridge_sink_ready))) begin
		uartwishbonebridge_tx_reg <= uartwishbonebridge_sink_payload_data;
		uartwishbonebridge_tx_bitcount <= 1'd0;
		uartwishbonebridge_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((uartwishbonebridge_uart_clk_txen & uartwishbonebridge_tx_busy)) begin
			uartwishbonebridge_tx_bitcount <= (uartwishbonebridge_tx_bitcount + 1'd1);
			if ((uartwishbonebridge_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((uartwishbonebridge_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					uartwishbonebridge_tx_busy <= 1'd0;
					uartwishbonebridge_sink_ready <= 1'd1;
				end else begin
					serial_tx <= uartwishbonebridge_tx_reg[0];
					uartwishbonebridge_tx_reg <= {1'd0, uartwishbonebridge_tx_reg[7:1]};
				end
			end
		end
	end
	if (uartwishbonebridge_tx_busy) begin
		{uartwishbonebridge_uart_clk_txen, uartwishbonebridge_phase_accumulator_tx} <= (uartwishbonebridge_phase_accumulator_tx + uartwishbonebridge_storage);
	end else begin
		{uartwishbonebridge_uart_clk_txen, uartwishbonebridge_phase_accumulator_tx} <= 1'd0;
	end
	uartwishbonebridge_source_valid <= 1'd0;
	uartwishbonebridge_rx_r <= uartwishbonebridge_rx;
	if ((~uartwishbonebridge_rx_busy)) begin
		if (((~uartwishbonebridge_rx) & uartwishbonebridge_rx_r)) begin
			uartwishbonebridge_rx_busy <= 1'd1;
			uartwishbonebridge_rx_bitcount <= 1'd0;
		end
	end else begin
		if (uartwishbonebridge_uart_clk_rxen) begin
			uartwishbonebridge_rx_bitcount <= (uartwishbonebridge_rx_bitcount + 1'd1);
			if ((uartwishbonebridge_rx_bitcount == 1'd0)) begin
				if (uartwishbonebridge_rx) begin
					uartwishbonebridge_rx_busy <= 1'd0;
				end
			end else begin
				if ((uartwishbonebridge_rx_bitcount == 4'd9)) begin
					uartwishbonebridge_rx_busy <= 1'd0;
					if (uartwishbonebridge_rx) begin
						uartwishbonebridge_source_payload_data <= uartwishbonebridge_rx_reg;
						uartwishbonebridge_source_valid <= 1'd1;
					end
				end else begin
					uartwishbonebridge_rx_reg <= {uartwishbonebridge_rx, uartwishbonebridge_rx_reg[7:1]};
				end
			end
		end
	end
	if (uartwishbonebridge_rx_busy) begin
		{uartwishbonebridge_uart_clk_rxen, uartwishbonebridge_phase_accumulator_rx} <= (uartwishbonebridge_phase_accumulator_rx + uartwishbonebridge_storage);
	end else begin
		{uartwishbonebridge_uart_clk_rxen, uartwishbonebridge_phase_accumulator_rx} <= 32'd2147483648;
	end
	state <= next_state;
	if (uartwishbonebridge_reset) begin
		state <= 3'd0;
	end
	if (uartwishbonebridge_wait) begin
		if ((~uartwishbonebridge_done)) begin
			uartwishbonebridge_count <= (uartwishbonebridge_count - 1'd1);
		end
	end else begin
		uartwishbonebridge_count <= 22'd3200000;
	end
	slave_sel_r <= slave_sel;
	if (wait_1) begin
		if ((~done)) begin
			count <= (count - 1'd1);
		end
	end else begin
		count <= 20'd1000000;
	end
	interface0_bank_bus_dat_r <= 1'd0;
	if (csrbank0_sel) begin
		case (interface0_bank_bus_adr[1:0])
			1'd0: begin
				interface0_bank_bus_dat_r <= basesoc_reset_reset_w;
			end
			1'd1: begin
				interface0_bank_bus_dat_r <= csrbank0_scratch0_w;
			end
			2'd2: begin
				interface0_bank_bus_dat_r <= csrbank0_bus_errors_w;
			end
		endcase
	end
	if (csrbank0_scratch0_re) begin
		basesoc_storage_full[31:0] <= csrbank0_scratch0_r;
	end
	basesoc_re <= csrbank0_scratch0_re;
	sel_r <= sel;
	interface1_bank_bus_dat_r <= 1'd0;
	if (csrbank1_sel) begin
		case (interface1_bank_bus_adr[0])
			1'd0: begin
				interface1_bank_bus_dat_r <= csrbank1_out0_w;
			end
		endcase
	end
	if (csrbank1_out0_re) begin
		leds_storage_full[8:0] <= csrbank1_out0_r;
	end
	leds_re <= csrbank1_out0_re;
	interface2_bank_bus_dat_r <= 1'd0;
	if (csrbank2_sel) begin
		case (interface2_bank_bus_adr[2:0])
			1'd0: begin
				interface2_bank_bus_dat_r <= csrbank2_load0_w;
			end
			1'd1: begin
				interface2_bank_bus_dat_r <= csrbank2_reload0_w;
			end
			2'd2: begin
				interface2_bank_bus_dat_r <= csrbank2_en0_w;
			end
			2'd3: begin
				interface2_bank_bus_dat_r <= basesoc_update_value_w;
			end
			3'd4: begin
				interface2_bank_bus_dat_r <= csrbank2_value_w;
			end
			3'd5: begin
				interface2_bank_bus_dat_r <= basesoc_eventmanager_status_w;
			end
			3'd6: begin
				interface2_bank_bus_dat_r <= basesoc_eventmanager_pending_w;
			end
			3'd7: begin
				interface2_bank_bus_dat_r <= csrbank2_ev_enable0_w;
			end
		endcase
	end
	if (csrbank2_load0_re) begin
		basesoc_load_storage_full[31:0] <= csrbank2_load0_r;
	end
	basesoc_load_re <= csrbank2_load0_re;
	if (csrbank2_reload0_re) begin
		basesoc_reload_storage_full[31:0] <= csrbank2_reload0_r;
	end
	basesoc_reload_re <= csrbank2_reload0_re;
	if (csrbank2_en0_re) begin
		basesoc_en_storage_full <= csrbank2_en0_r;
	end
	basesoc_en_re <= csrbank2_en0_re;
	if (csrbank2_ev_enable0_re) begin
		basesoc_eventmanager_storage_full <= csrbank2_ev_enable0_r;
	end
	basesoc_eventmanager_re <= csrbank2_ev_enable0_re;
	if (sys_rst) begin
		basesoc_storage_full <= 32'd305419896;
		basesoc_re <= 1'd0;
		basesoc_bus_errors <= 32'd0;
		basesoc_sram_bus_ack <= 1'd0;
		basesoc_interface_adr <= 14'd0;
		basesoc_interface_we <= 1'd0;
		basesoc_interface_dat_w <= 32'd0;
		basesoc_bus_wishbone_dat_r <= 32'd0;
		basesoc_bus_wishbone_ack <= 1'd0;
		basesoc_counter <= 2'd0;
		basesoc_load_storage_full <= 32'd0;
		basesoc_load_re <= 1'd0;
		basesoc_reload_storage_full <= 32'd0;
		basesoc_reload_re <= 1'd0;
		basesoc_en_storage_full <= 1'd0;
		basesoc_en_re <= 1'd0;
		basesoc_value_status <= 32'd0;
		basesoc_zero_pending <= 1'd0;
		basesoc_zero_old_trigger <= 1'd0;
		basesoc_eventmanager_storage_full <= 1'd0;
		basesoc_eventmanager_re <= 1'd0;
		basesoc_value <= 32'd0;
		serial_tx <= 1'd1;
		uartwishbonebridge_sink_ready <= 1'd0;
		uartwishbonebridge_uart_clk_txen <= 1'd0;
		uartwishbonebridge_phase_accumulator_tx <= 32'd0;
		uartwishbonebridge_tx_reg <= 8'd0;
		uartwishbonebridge_tx_bitcount <= 4'd0;
		uartwishbonebridge_tx_busy <= 1'd0;
		uartwishbonebridge_source_valid <= 1'd0;
		uartwishbonebridge_source_payload_data <= 8'd0;
		uartwishbonebridge_uart_clk_rxen <= 1'd0;
		uartwishbonebridge_phase_accumulator_rx <= 32'd0;
		uartwishbonebridge_rx_r <= 1'd0;
		uartwishbonebridge_rx_reg <= 8'd0;
		uartwishbonebridge_rx_bitcount <= 4'd0;
		uartwishbonebridge_rx_busy <= 1'd0;
		uartwishbonebridge_count <= 22'd3200000;
		leds_storage_full <= 9'd0;
		leds_re <= 1'd0;
		state <= 3'd0;
		slave_sel_r <= 2'd0;
		count <= 20'd1000000;
		interface0_bank_bus_dat_r <= 32'd0;
		sel_r <= 1'd0;
		interface1_bank_bus_dat_r <= 32'd0;
		interface2_bank_bus_dat_r <= 32'd0;
	end
	regs0 <= serial_rx;
	regs1 <= regs0;
end

reg [31:0] mem[0:1023];
reg [9:0] memadr;
always @(posedge sys_clk) begin
	if (basesoc_sram_we[0])
		mem[basesoc_sram_adr][7:0] <= basesoc_sram_dat_w[7:0];
	if (basesoc_sram_we[1])
		mem[basesoc_sram_adr][15:8] <= basesoc_sram_dat_w[15:8];
	if (basesoc_sram_we[2])
		mem[basesoc_sram_adr][23:16] <= basesoc_sram_dat_w[23:16];
	if (basesoc_sram_we[3])
		mem[basesoc_sram_adr][31:24] <= basesoc_sram_dat_w[31:24];
	memadr <= basesoc_sram_adr;
end

assign basesoc_sram_dat_r = mem[memadr];

reg [7:0] mem_1[0:43];
reg [5:0] memadr_1;
always @(posedge sys_clk) begin
	memadr_1 <= adr;
end

assign dat_r = mem_1[memadr_1];

initial begin
	$readmemh("mem_1.init", mem_1);
end

endmodule
