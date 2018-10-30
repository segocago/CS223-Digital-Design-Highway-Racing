/* 
    Author : Serhat Akdað
    CS223 Digital Design Project : Highway Racing
    
    Project Members : Çaðatay  Sel, Þamil Ýraz
    
    */

`timescale 1ns / 1ps

module DotMatrixDriver( input logic clk,
                        input logic [7:0][23:0] plan,                          
                        output logic [7:0] rowSelector,
                        output logic SH_CP, ST_CP, MR, OE, DS);
    
    logic k;
    logic [23:0] DScollector;    
    
    
    int i; logic [2:0] a = 0;
    
    logic [7:0] counter = 0;
        
    always_ff@(posedge clk)
        counter <= counter+1;
        
    assign k = counter[ 7];
        
    always_ff @( negedge k)
    if(i == 410)
        i <= 1;
    else
        i <= i+1;
        
    always_ff@(negedge clk)
    begin
        if( i < 28)
        begin
            SH_CP <= k;
            ST_CP <= ~k;
        end
        else
        begin
            SH_CP <= 0;
            ST_CP <= 1;
        end
    end
    
    always_ff @( negedge k)
    begin
        if(i<3)
            MR<=0;
        else
            MR<=1;
        if(i > 2 && i <27)
            DS <= DScollector[i-3];
        else
            DS <=0;
    end
    
    always_ff @( negedge k)
        if( i == 410)
            a <= a+1;
    
    always_comb
    begin
        DScollector = plan[ a];
    end
    
    
    always_comb begin   
    case(a)
    0: rowSelector = 8'b00000001;
    1: rowSelector = 8'b00000010;
    2: rowSelector = 8'b00000100;
    3: rowSelector = 8'b00001000;
    4: rowSelector = 8'b00010000;
    5: rowSelector = 8'b00100000;
    6: rowSelector = 8'b01000000;
    7: rowSelector = 8'b10000000;
    default: rowSelector = 8'b00000001;
    endcase
    end
    
    
    
endmodule
