/* 
    Authors : Çaðatay Sel , Þamil Ýraz
    CS223 Digital Design Project : Highway Racing
    
    Project Members : Çaðatay  Sel, Þamil Ýraz
    
    */


`timescale 1ns / 1ps


module ClockDivider(
    input logic clk_in,
    input logic [7:0] score,    
    output logic clk_out
    
    
    );
    
logic [26:0] count = {27{1'b0}};
logic [25:0] count2 = {26{1'b0}}; 
logic [24:0] count3 = {25{1'b0}};  


logic [26:0] D = {27{1'b0}}; 

logic clk_NoBuf;

//Changing speed at score =15, and score =	48
always@ (posedge clk_in) begin
    if(score < 8'b00001111)	count <= count + 1;	  
    else if (score < 8'b00110000) count2 <= count2 + 1;
    else count3 <=count3 + 1;    
end//always

always_comb begin
 if(score < 8'b00001111) clk_NoBuf = count[26];
 else if (score < 8'b00110000)clk_NoBuf = count2[25];
 else  clk_NoBuf = count3[24];
 end


BUFG BUFG_inst (
  .I(clk_NoBuf),  // 1-bit input: Clock input
  .O(clk_out) // 1-bit output: Clock output
  
);
endmodule
