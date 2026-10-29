module alu_tb;

    reg clk;
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] opcode;

    wire [7:0] result;
    wire flag;

    integer tests;

    alu dut (
        .clk(clk),
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .flag(flag)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    task check;
        input [2:0] op;
        input [7:0] av;
        input [7:0] bv;
        input [7:0] expected;

        begin
            @(negedge clk);
            opcode = op;
            a = av;
            b = bv;

            @(posedge clk);
            #1;

            tests = tests + 1;

            if (result !== expected ||
                flag !== (expected == 8'd0)) begin
                $display("FAIL: op=%b, a=%0d, b=%0d, result=%0d, expected=%0d, flag=%b",
                         op, av, bv, result, expected, flag);
            end
            else begin
                $display("PASS: op=%b, a=%0d, b=%0d, result=%0d, flag=%b",
                         op, av, bv, result, flag);
            end
        end
    endtask

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        tests = 0;
        a = 0;
        b = 0;
        opcode = 0;

        check(3'b000, 10,  5,  15);  // Addition
        check(3'b000, 250, 10, 4);   // 8-bit overflow
        check(3'b001, 10,  5,  5);   // Subtraction
        check(3'b001, 5,   10, 251); // Negative result in 8 bits

        check(3'b010, 12, 10, 8);    // AND
        check(3'b011, 12, 10, 14);   // OR
        check(3'b100, 12, 10, 6);    // XOR

        check(3'b101, 10, 10, 1);    // Equal
        check(3'b101, 10, 5,  0);    // Not equal

        check(3'b110, 10, 5, 0);     // Default opcode

        $display("-------------------------------");
        $display("Completed %0d tests.", tests);
        $finish;
    end

endmodule
