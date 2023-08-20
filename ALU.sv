module ALU
(
           input [7:0] A,B,  // ALU 8-bit Inputs
           input [3:0] ALU_Sel,// ALU Selection
  		   input clk,
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
);
           reg [7:0] ALU_Result;
           wire [8:0] tmp;
           assign ALU_Out = ALU_Result; // ALU out
           assign tmp = {1'b0,A} + {1'b0,B};
           assign CarryOut = tmp[8]; // Carryout flag
           always @(posedge clk)
               begin
                   case(ALU_Sel)
                   4'b0000: // 0 Addition
                      ALU_Result = A + B ; 
                   4'b0001: // 1 Subtraction
                      ALU_Result = A + B ;
                   4'b0010: // 2 Multiplication
                      ALU_Result = A * B;
                   4'b0011: // 3 Division
                      ALU_Result = A/B;
                   4'b0100: // 4 Logical shift left
                      ALU_Result = A<<1;
                    4'b0101: // 5 Logical shift right
                      ALU_Result = A>>1;
                    4'b0110: // 6 Rotate left
                      ALU_Result = {A[6:0],A[7]};
                    4'b0111: // 7 Rotate right
                      ALU_Result = {A[0],A[7:1]};
                     4'b1000: //  8 Logical and 
                      ALU_Result = A & B;
                     4'b1001: //  9 Logical or
                      ALU_Result = A & B;
                     4'b1010: //  10 Logical xor 
                      ALU_Result = A ^ B;
                     4'b1011: //  11 Logical nor
                      ALU_Result = ~(A | B);
                     4'b1100: // 12 Logical nand 
                      ALU_Result = (A & B);
                     4'b1101: // 13 Logical xnor
                      ALU_Result = ~(A ^ B);
                     4'b1110: // 14 Greater comparison
                      ALU_Result = (A>B)?8'd1:8'd0 ;
                     4'b1111: // 15 Equal comparison   
                       ALU_Result = (A==B)?8'd1:8'd0 ;
                     default: ALU_Result = A + B ; 
                   endcase
           end

endmodule
