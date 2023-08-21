`include "transaction.sv"

module testbench;
  
  logic [7:0] A, B;
  logic [3:0] ALU_Sel;
  logic clk;
  logic [7:0] ALU_Out;
  logic CarryOut;
  
  logic [8:0] tmp;
  
  transaction trans;
  ALU DUT (.A(A), .B(B), .ALU_Sel(ALU_Sel), .clk(clk), .ALU_Out(ALU_Out), .CarryOut(CarryOut));
  
  initial clk = 0;
  always #100 clk = ~clk;
  
  initial begin  // Apply inputs.
    repeat(150)
    begin
    trans = new;
    void'(trans.randomize());
    A = trans.A;
    B = trans.B;
    $display("A = %d, B = %d", A, B);
    @(posedge clk);
    ALU_Sel = 0; #200;
    ALU_Sel = 1; #200;
    ALU_Sel = 2; #250; // Multiplication has longer delay since it takes the ALU longer time to caluclate the correct output.
    ALU_Sel = 3; #200;
    ALU_Sel = 4; #200;
    ALU_Sel = 5; #200;
    ALU_Sel = 6; #200;
    ALU_Sel = 7; #200;
    ALU_Sel = 8; #200;
    ALU_Sel = 9; #200;
    ALU_Sel = 10; #200;
    ALU_Sel = 11; #200;
    ALU_Sel = 12; #200;
    ALU_Sel = 13; #200;
    ALU_Sel = 14; #200;
    ALU_Sel = 15; #200;
    ALU_Sel = 4'bx; #200;
    $display("-------------------------------------------------------------");
    end
    $finish;
  end

//----------------------------------------------------------------------------------------------  
  property Add;
    @(posedge clk) (ALU_Sel == 0) |-> ##1 (ALU_Out == A+B);
  endproperty
    
  Assert_Addition: assert property (Add)  
    $display("Addition Assertion Passed"); 
    else $display("Addition Assertion Failed");
  Cover_Addition: cover property(Add);
//----------------------------------------------------------------------------------------------
  property Subtract;
    @(posedge clk) (ALU_Sel == 1) |-> ##1 (ALU_Out == A-B);
  endproperty
    
  Assert_Subtraction: assert property (Subtract)  
    $display("Subtraction Assertion Passed"); 
    else $display("Subtraction Assertion Failed");
  Cover_Subtraction: cover property(Subtract);
//----------------------------------------------------------------------------------------------
  property Multiply;
    @(posedge clk) (ALU_Sel == 2) |-> ##1 (ALU_Out == A*B);
  endproperty
    
  Assert_Multiplication: assert property (Multiply)  
    $display("Multiplication Assertion Passed"); 
    else $display("Multiplication Assertion Failed");
  Cover_Multiplication: cover property(Multiply);
//----------------------------------------------------------------------------------------------
  property Divide;
    @(posedge clk) (ALU_Sel == 3) |-> ##1 (ALU_Out == A/B);
  endproperty
    
  Assert_Division: assert property (Divide)  
    $display("Division Assertion Passed"); 
    else $display("Division Assertion Failed");
  Cover_Division: cover property(Divide);
//----------------------------------------------------------------------------------------------
  property LSL;
    @(posedge clk) (ALU_Sel == 4) |-> ##1 (ALU_Out == A<<1);
  endproperty
    
  Assert_LSL: assert property (LSL)  
    $display("Logical Shift Left Assertion Passed"); 
    else $display("Logical Shift Left Assertion Failed");
  Cover_LSL: cover property(LSL);
//----------------------------------------------------------------------------------------------
  property LSR;
    @(posedge clk) (ALU_Sel == 5) |-> ##1 (ALU_Out == A>>1);
  endproperty
    
  Assert_LSR: assert property (LSR)  
    $display("Logical Shift Right Assertion Passed"); 
    else $display("Logical Shift Right Assertion Failed");
  Cover_LSR: cover property(LSR);
//----------------------------------------------------------------------------------------------
  property Rotate_Left;
    @(posedge clk) (ALU_Sel == 6) |-> ##1 (ALU_Out == {A[6:0],A[7]});
  endproperty
    
  Assert_Rotate_Left: assert property (Rotate_Left)  
    $display("Rotate Left Assertion Passed"); 
    else $display("Rotate Left Assertion Failed");
  Cover_Rotate_Left: cover property(Rotate_Left);
//----------------------------------------------------------------------------------------------
  property Rotate_Right;
    @(posedge clk) (ALU_Sel == 7) |-> ##1 (ALU_Out == {A[0],A[7:1]});
  endproperty
    
  Assert_Rotate_Right: assert property (Rotate_Right)  
    $display("Rotate Right Assertion Passed"); 
    else $display("Rotate Right Assertion Failed");
  Cover_Rotate_Right: cover property(Rotate_Right);
//----------------------------------------------------------------------------------------------
  property AND;
    @(posedge clk) (ALU_Sel == 8) |-> ##1 (ALU_Out == (A & B));
  endproperty
    
  Assert_AND: assert property (AND)  
    $display("AND Assertion Passed"); 
    else $display("AND Assertion Failed");
  Cover_AND: cover property(AND);
//----------------------------------------------------------------------------------------------
  property OR;
    @(posedge clk) (ALU_Sel == 9) |-> ##1 (ALU_Out == (A | B));
  endproperty
    
  Assert_OR: assert property (OR)  
    $display("OR Assertion Passed"); 
    else $display("OR Assertion Failed");
  Cover_OR: cover property(OR);
//----------------------------------------------------------------------------------------------
  property XOR;
    @(posedge clk) (ALU_Sel == 10) |-> ##1 (ALU_Out == (A ^ B));
  endproperty
    
  Assert_XOR: assert property (XOR)  
    $display("XOR Assertion Passed"); 
    else $display("XOR Assertion Failed");
  Cover_XOR: cover property(XOR);
//----------------------------------------------------------------------------------------------
  property NOR;
    @(posedge clk) (ALU_Sel == 11) |-> ##1 (ALU_Out == ~(A | B));
  endproperty
    
  Assert_NOR: assert property (NOR)  
    $display("NOR Assertion Passed"); 
    else $display("NOR Assertion Failed");
  Cover_NOR: cover property(NOR);
//----------------------------------------------------------------------------------------------
  property NAND;
    @(posedge clk) (ALU_Sel == 12) |-> ##1 (ALU_Out == ~(A & B));
  endproperty
    
  Assert_NAND: assert property (NAND)  
    $display("NAND Assertion Passed"); 
    else $display("NAND Assertion Failed");
  Cover_NAND: cover property(NAND);
//----------------------------------------------------------------------------------------------
  property XNOR;
    @(posedge clk) (ALU_Sel == 13) |-> ##1 (ALU_Out == ~(A ^ B));
  endproperty
    
  Assert_XNOR: assert property (XNOR)  
    $display("XNOR Assertion Passed"); 
    else $display("XNOR Assertion Failed");
  Cover_XNOR: cover property(XNOR);
//----------------------------------------------------------------------------------------------
  property GC;
    @(posedge clk) (ALU_Sel == 14) |-> ##1 (ALU_Out == ((A>B)?8'd1:8'd0));
  endproperty
    
  Assert_GC: assert property (GC)  
    $display("Greater Comparison Assertion Passed"); 
    else $display("Greater Comparison Assertion Failed");
  Cover_GC: cover property(GC);
//----------------------------------------------------------------------------------------------
  property EC;
    @(posedge clk) (ALU_Sel == 15) |-> ##1 (ALU_Out == ((A==B)?8'd1:8'd0));
  endproperty
    
  Assert_EC: assert property (EC)  
    $display("Equal Comparison Assertion Passed"); 
    else $display("Equal Comparison Assertion Failed");
  Cover_EC: cover property(EC);
//----------------------------------------------------------------------------------------------
  property CornerCase1;
    @(posedge clk) (A==0 && B==0) |-> ##1 (1'b1);
  endproperty
    
  Assert_CornerCase1: assert property (CornerCase1)  
    $display("Corner Case 1 Tested"); 
//Cover_CornerCase1: cover property(CornerCase1);
//----------------------------------------------------------------------------------------------
  property CornerCase2;
    @(posedge clk) (A==255 && B==255) |-> ##1 (1'b1);
  endproperty
    
  Assert_CornerCase2: assert property (CornerCase2)  
    $display("Corner Case 2 Tested");
//Cover_CornerCase2: cover property(CornerCase2);
//----------------------------------------------------------------------------------------------
  //The following assertion checks the default of the case statement; however, it won't be tested since the provided ALU selection lines [0-15] cover all the available values of a 4-bit number. Yet, if the ALU_Sel was changed to be a 5-bit number then the ALU was tested with an ALU_Sel of a number outside range [0-15], then the assertion will be tested.
    
  /*Default: assert property (@(posedge clk) !(ALU_Sel inside {[0:15]}) |-> ##1 (ALU_Out == A+B))  
    $display("Default Assertion Passed"); 
    else $display("Default Assertion Failed");*/
//----------------------------------------------------------------------------------------------   
  sequence Carry;
    bit [8:0] tmp; 
    (ALU_Sel == 0, tmp = A+B) ##1 (CarryOut == tmp[8]);
  endsequence
    
  Carry_Check: assert property (@(posedge clk) ALU_Sel == 0 |-> Carry)  
    $display("Carry Assertion Passed"); 
    else $display("Carry Assertion Failed");
  
endmodule
