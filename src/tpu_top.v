module basic_tpu (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  data_in,
    input  wire [7:0]  weight_in,
    input  wire [19:0] acc_in,
    output reg  [7:0]  data_out,
    output reg  [7:0]  weight_out,
    output reg  [19:0] acc_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out   <= 8'sd0;
            weight_out <= 8'sd0;
            acc_out    <= 20'sd0;
        end else begin
            data_out   <= data_in;
            weight_out <= weight_in;
            acc_out    <= acc_in + ($signed(data_in) * $signed(weight_in));
        end
    end

endmodule
