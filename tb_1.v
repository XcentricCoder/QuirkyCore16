`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2025 11:15:13 AM
// Design Name: 
// Module Name: tb_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*    
    integer i =0;
    top dut();
    
/////////////initiating values of all GPRs
    initial begin 
    for(i=0;i<31;i=i+1)
    begin
    dut.GPR[i]=2;
    end
    end
    
    ////////////////////////////////
    initial begin
//////// immediate add op
$display("-----------------------------------------------------------------");
dut.IR = 0;
dut.`imm_mode = 1;
dut.`oper_type = 2;
dut.`rsrc1 = 2;///gpr[2] = 2
dut.`rdst  = 0;///gpr[0]
dut.`imsrc = 4;
#10;
$display("OP:ADI Rsrc1:%0d  Rimsrc:%0d Rdst:%0d",dut.GPR[2], dut.`imsrc, dut.GPR[0]);
///////// register add op
$display("-----------------------------------------------------------------");
dut.IR = 0;
dut.`imm_mode = 0;
dut.`oper_type = 2;
dut.`rsrc1 = 4;///gpr[2] = 2
dut.`rdst  = 0;///gpr[0]
dut.`rsrc2 = 5;
#10;
$display("OP:ADR Rsrc1:%0d  Rsrc2:%0d Rdst:%0d",dut.GPR[4], dut.GPR[5] , dut.GPR[0]);
///////////REGISTER MOV OP
$display("-----------------------------------------------------------------");
dut.IR = 0;
dut.`imm_mode = 0;
dut.`oper_type = 1;
dut.`rsrc1 = 7;///gpr[7] = 2
dut.`rdst  = 0;///gpr[0]
#10;
$display("OP:MOV Rdst:%0d Rsrc1:%0d",dut.GPR[0], dut.GPR[7]);
///////////IMMEDIATE MOV OP
$display("-----------------------------------------------------------------");
dut.IR = 0;
dut.`imm_mode = 1;
dut.`oper_type = 1;
dut.`rdst = 5;///gpr[5] = 2
dut.`imsrc  = 66;///imm data =55
#10;
$display("OP:MOV Rdst:%0d Rimsrc:%0d",dut.GPR[5], dut.`imsrc);
///////////IMMEDIATE and OP
$display("-----------------------------------------------------------------");
dut.IR = 0;
dut.`imm_mode = 1;
dut.`oper_type = 1;
dut.`rdst = 4;///gpr[5] = 2
dut.`rsrc1 = 5;
dut.`imsrc  = 66;///imm data =55
#10;
$display("OP:MOV Rdst:%0d Rsrc1:%0d Rimsrc:%0d",dut.GPR[4],dut.GPR[5], dut.`imsrc);
///////// register AND op
$display("-----------------------------------------------------------------");
dut.IR = 0;
dut.`imm_mode = 0;
dut.`oper_type = 2;
dut.`rsrc1 = 3;///gpr[3] = 2
dut.`rdst  = 0;///gpr[0]
dut.`rsrc2 = 5;
#10;
$display("OP:ADR Rsrc1:%0d  Rsrc2:%0d Rdst:%0d",dut.GPR[3], dut.GPR[5] , dut.GPR[0]);
$display("-----------------------------------------------------------------");
/////////////////////////// zero flag
dut.IR  = 0;
dut.GPR[0] = 0;
dut.GPR[1] = 0; 
dut.`imm_mode = 0;
dut.`rsrc1 = 0;//gpr[0]
dut.`rsrc2 = 1;//gpr[1]
dut.`oper_type = 2;
dut.`rdst = 2;
#10;
$display("OP:Zero Rsrc1:%0d  Rsrc2:%0d Rdst:%0d",dut.GPR[0], dut.GPR[1], dut.GPR[2] );
$display("-----------------------------------------------------------------");
 
//////////////////////////sign flag
dut.IR = 0;
dut.GPR[0] = 16'h8000; /////1000_0000_0000_0000
dut.GPR[1] = 0; 
dut.`imm_mode = 0;
dut.`rsrc1 = 0;//gpr[0]
dut.`rsrc2 = 1;//gpr[1]
dut.`oper_type = 2;
dut.`rdst = 2;
#10;
$display("OP:Sign Rsrc1:%0d  Rsrc2:%0d Rdst:%0d",dut.GPR[0], dut.GPR[1], dut.GPR[2] );
$display("-----------------------------------------------------------------");
 
////////////////////////carry flag
dut.IR = 0;
dut.GPR[0] = 16'h8000; /////1000_0000_0000_0000   <0
dut.GPR[1] = 16'h8002; /////1000_0000_0000_0010   <0
dut.`imm_mode = 0;
dut.`rsrc1 = 0;//gpr[0]
dut.`rsrc2 = 1;//gpr[1]
dut.`oper_type = 2;
dut.`rdst = 2;    //////// 0000_0000_0000_0010  >0
#10;
 
$display("OP:Carry & Overflow Rsrc1:%0d  Rsrc2:%0d Rdst:%0d",dut.GPR[0], dut.GPR[1], dut.GPR[2] );
$display("-----------------------------------------------------------------");
 

end*/
    module tb_1();
     
     
    integer i = 0;
     
    reg clk = 0,sys_rst = 0;
    reg [15:0] din = 0;
    wire [15:0] dout;
     
     
    top dut(clk, sys_rst, din, dout);
     
    always #5 clk = ~clk;
     
initial begin
sys_rst = 1'b1;
repeat(5) @(posedge clk);
sys_rst = 1'b0;
#800;
//$stop;
end
 
endmodule