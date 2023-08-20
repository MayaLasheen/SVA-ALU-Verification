# ALU Verification using SystemVerilog Assertions
<p align = "justify">A testbench was implemented using SystemVerilog Assertions on Mentor QuestaSim in order to verify an ALU RTL to ensure that the ALU functions correctly and reliably, and to detect the present bugs, if any.</p>
<p align = "justify">The ALU has 4 input ports and 2 output ports.</p>
<p align = "justify">
Inputs:
  <ul>
  <li><i>A</i>: First Operand (8-Bit)</li>
  <li><i>B</i>: Second Operand (8-Bit)</li>
  <li><i>ALU_Sel</i>: Selection Line (4-Bit)</li>
  <li><i>clk</i></li>
  </ul>
  </p>
<p align = "justify">
Outputs:
  <ul>
  <li><i>ALU_Out</i>: ALU Output (8-Bit)</li>
  <li><i>CarryOut</i>: Carry Out Flag (1-Bit)</li>
  </ul>
  </p>
<b>Bugs Detection</b>
<p align = "justify">
The ALU (Device Under Test) has 3 bugs, namely Subtraction, Logical OR and Logical NAND operations, which were detected by the assertion results as shown in the following screenshot.</p>
<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/SVA_ALU_Verification/assets/137602736/85fa4327-bc03-4ac3-bbf0-fb1cef440ace" alt="Assertions"/></kbd>
</p>

<b>Coverage</b>
<p align = "justify">  
The HTML coverage report as well as detailed coverage report were generated. The detailed coverage report was generated using the <i>coverage report -detail</i> command option.
</p>

<p align = "center"><b>HTML Coverage Report</b></p>

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/SVA_ALU_Verification/assets/137602736/31d31f72-db10-472c-9a4e-d7b32be1670e" alt="HTML Coverage Report"/></kbd></p> 

<p align = "center"><b>Directive Coverage</b></p>

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/SVA_ALU_Verification/assets/137602736/0e99a683-7b35-4694-a1cc-ed8b800929bd" alt="Directive Coverage"/></kbd></p> 

<p align = "center"><b>Assertion Results</b></p>

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/SVA_ALU_Verification/assets/137602736/7e2c4e5d-a2cb-47a7-b867-a588af13dc73" alt="Assertion Results 1"/></kbd></p> 

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/SVA_ALU_Verification/assets/137602736/f354c7a2-11bf-4d93-8c87-6e6f8d33c8da" alt="Assertion Results 2"/></kbd></p> 
