
module ALU_test;
reg  [7:0] A;
reg  [7:0] B;
reg  [2:0] opcode;
wire [7:0] result;
wire zero;
wire carry;

ALU uut (A, B, opcode, result, zero, carry);

initial 
begin

    $display("Starting ALU Testbench...");

    A = 8'd253;
    B = 8'd5;
    opcode = 3'b000; 
    #10;
    
    $display("ADD: %d + %d = %d , %d", A, B, result, carry);

    A = 8'd10;
    B = 8'd5; 
    opcode = 3'b001;
    #10;
    
    $display("SUB: %d - %d = %d , %d", A, B, result, carry);

    A = 8'b10101010; 
    B = 8'b11001100; 
    opcode = 3'b010; 
    #10;
    
    $display("A AND B: %b & %b = %b", A, B, result);

    opcode = 3'b011; #10;
    $display("A OR B: %b | %b = %b", A, B, result);

    opcode = 3'b100; #10;
    $display("A XOR B: %b ^ %b = %b", A, B, result);

    opcode = 3'b101; #10;
    $display("NOT A: ~ %b = %b", A, result);

    A = 8'b00001111;
    opcode = 3'b110;
    #10;
    $display("Before shift operations: %b", A);
    $display("Shift left result = %b", result);

    opcode = 3'b111; #10;
    $display("Shift right result = %b", result);

    A = 8'd0;
    B = 8'd0;
    opcode = 3'b000;
    #10;
    
    $display("Zero flag = %b", zero);

    $finish;
end
endmodule
