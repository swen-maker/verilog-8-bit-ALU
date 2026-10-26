module alu (
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [2:0] opcode,
    output reg [7:0] result,
    output flag,
    output reg [7:0] cout
);

wire [8:0] carry;
wire subtract;
wire [7:0] b_new;
wire [7:0] sum;

assign subtract = (opcode == 3'b001);
assign carry[0] = subtract;
assign b_new = b ^ {8{subtract}};

genvar i;

generate
            for (i = 0; i <8; i = i + 1) begin: fullAdder
              adder inst (a[i], b_new[i], carry[i], carry[i+1], sum[i]);
            end
        endgenerate

always @ (posedge clk) begin
    case (opcode) 
        3'b000: result <= sum;
        3'b001: result <= sum;
        3'b010: result <= a & b;
        3'b011: result <= a | b;
        3'b100: result <= a ^ b;
        3'b101: result <= (a == b) ? 8'd1 : 8'd0;
        default: result <= 0;
    endcase
end

    assign flag = (result == 8'd0);
    
endmodule


module adder (
    input a,
    input b,
    input cin,
    output cout,
    output sum
);

  assign cout = (a&b|a&cin|b&cin);
  assign sum = (a^b^cin);

endmodule
