/* Machine-generated using Migen */
module top(
	output user_led1,
	output user_led2,
	output user_led3,
	output user_led4,
	output user_led5,
	output user_led6,
	output user_led7,
	output user_led8,
	input clk32
);

reg [29:0] counter = 30'd0;
wire sys_clk;
wire sys_rst;
wire por_clk;
reg int_rst = 1'd1;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign user_led1 = counter[29];
assign user_led2 = counter[28];
assign user_led3 = counter[27];
assign user_led4 = counter[26];
assign user_led5 = counter[25];
assign user_led6 = counter[24];
assign user_led7 = counter[23];
assign user_led8 = counter[22];
assign sys_clk = clk32;
assign por_clk = clk32;
assign sys_rst = int_rst;

always @(posedge por_clk) begin
	int_rst <= 1'd0;
end

always @(posedge sys_clk) begin
	counter <= (counter + 1'd1);
	if (sys_rst) begin
		counter <= 30'd0;
	end
end

endmodule
