/* 
    Authors : Çaðatay Sel , Þamil Ýraz
    CS223 Digital Design Project : Highway Racing
    
    Project Members : Çaðatay  Sel, Þamil Ýraz
    
    */


`timescale 1ns / 1ps

module RealMainModule(
                        input logic clk,
                        input logic [1:0]userMove,
                        input logic rst,                        
                        output logic [7:0] rowSelector,
                        output logic SH_CP, ST_CP, MR, OE, DS,
                        
                        output logic a, b, c, d, e, f, g, dp, //individual LED output for the 7-segment along with the digital point
                        output logic [3:0] an 

    );
    logic clk_game;
    logic [7:0]tempScore;
    logic [7:0]score;
    
    assign score = tempScore;
    
    logic [3:0]digit4;
    logic [3:0]digit3;
    logic [3:0]digit2;
    logic [3:0]digit1;
    
    ClockDivider (clk,score,clk_game);
    
    //logic clk_matrix;
    //ClockDividerMatrix (clk,clk_matrix);
    
    //logic [1:0] userMove;
    //PlayerInput (userInput,userMove);
    
    logic [23:0] newRow;
    logic [7:0] obstaclePlace;
    
    //Module that generates new row
    CarGenerator (clk_game,rst,newRow,obstaclePlace);      
    
    //GamePlan        
    logic [7:0][23:0] plan;
    
    
    Shifter sh(userMove,clk_game,clk,rst,plan,newRow,obstaclePlace,tempScore,rowSelector,SH_CP, ST_CP, MR, OE, DS); 
    
    always_comb begin
    case(score)  
        8'b00000000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D0; end
        8'b00000001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D1; end
        8'b00000010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D2; end
        8'b00000011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D3; end
        8'b00000100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D4; end
        8'b00000101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D5; end
        8'b00000110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D6; end
        8'b00000111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D7; end
        8'b00001000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D8; end
        8'b00001001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D0; digit1 = 4'D9; end
        8'b00001010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D0; end
        8'b00001011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D1; end
        8'b00001100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D2; end
        8'b00001101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D3; end
        8'b00001110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D4; end
        8'b00001111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D5; end
        8'b00010000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D6; end
        8'b00010001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D7; end
        8'b00010010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D8; end
        8'b00010011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D1; digit1 = 4'D9; end
        8'b00010100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D0; end
        8'b00010101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D1; end
        8'b00010110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D2; end
        8'b00010111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D3; end
        8'b00011000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D4; end
        8'b00011001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D5; end
        8'b00011010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D6; end
        8'b00011011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D7; end
        8'b00011100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D8; end
        8'b00011101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D2; digit1 = 4'D9; end
        8'b00011110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D0; end
        8'b00011111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D1; end
        8'b00100000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D2; end
        8'b00100001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D3; end
        8'b00100010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D4; end
        8'b00100011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D5; end
        8'b00100100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D6; end
        8'b00100101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D7; end
        8'b00100110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D8; end
        8'b00100111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D3; digit1 = 4'D9; end
        8'b00101000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D0; end
        8'b00101001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D1; end
        8'b00101010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D2; end
        8'b00101011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D3; end
        8'b00101100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D4; end
        8'b00101101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D5; end
        8'b00101110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D6; end
        8'b00101111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D7; end
        8'b00110000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D8; end
        8'b00110001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D4; digit1 = 4'D9; end
        8'b00110010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D0; end
        8'b00110011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D1; end
        8'b00110100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D2; end
        8'b00110101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D3; end
        8'b00110110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D4; end
        8'b00110111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D5; end
        8'b00111000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D6; end
        8'b00111001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D7; end
        8'b00111010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D8; end
        8'b00111011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D5; digit1 = 4'D9; end
        8'b00111100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D0; end
        8'b00111101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D1; end
        8'b00111110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D2; end
        8'b00111111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D3; end
        8'b01000000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D4; end
        8'b01000001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D5; end
        8'b01000010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D6; end
        8'b01000011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D7; end
        8'b01000100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D8; end
        8'b01000101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D6; digit1 = 4'D9; end
        8'b01000110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D0; end
        8'b01000111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D1; end
        8'b01001000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D2; end
        8'b01001001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D3; end
        8'b01001010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D4; end
        8'b01001011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D5; end
        8'b01001100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D6; end
        8'b01001101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D7; end
        8'b01001110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D8; end
        8'b01001111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D7; digit1 = 4'D9; end
        8'b01010000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D0; end
        8'b01010001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D1; end
        8'b01010010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D2; end
        8'b01010011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D3; end
        8'b01010100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D4; end
        8'b01010101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D5; end
        8'b01010110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D6; end
        8'b01010111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D7; end
        8'b01011000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D8; end
        8'b01011001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D8; digit1 = 4'D9; end
        8'b01011010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D0; end
        8'b01011011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D1; end
        8'b01011100: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D2; end
        8'b01011101: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D3; end
        8'b01011110: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D4; end
        8'b01011111: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D5; end
        8'b01100000: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D6; end
        8'b01100001: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D7; end
        8'b01100010: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D8; end
        8'b01100011: begin digit4 = 4'D0; digit3 = 4'D0; digit2 = 4'D9; digit1 = 4'D9; end
        8'b01100100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D0; end
        8'b01100101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D1; end
        8'b01100110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D2; end
        8'b01100111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D3; end
        8'b01101000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D4; end
        8'b01101001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D5; end
        8'b01101010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D6; end
        8'b01101011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D7; end
        8'b01101100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D8; end
        8'b01101101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D0; digit1 = 4'D9; end
        8'b01101110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D0; end
        8'b01101111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D1; end
        8'b01110000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D2; end
        8'b01110001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D3; end
        8'b01110010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D4; end
        8'b01110011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D5; end
        8'b01110100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D6; end
        8'b01110101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D7; end
        8'b01110110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D8; end
        8'b01110111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D1; digit1 = 4'D9; end
        8'b01111000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D0; end
        8'b01111001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D1; end
        8'b01111010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D2; end
        8'b01111011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D3; end
        8'b01111100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D4; end
        8'b01111101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D5; end
        8'b01111110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D6; end
        8'b01111111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D7; end
        8'b10000000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D8; end
        8'b10000001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D2; digit1 = 4'D9; end
        8'b10000010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D0; end
        8'b10000011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D1; end
        8'b10000100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D2; end
        8'b10000101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D3; end
        8'b10000110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D4; end
        8'b10000111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D5; end
        8'b10001000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D6; end
        8'b10001001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D7; end
        8'b10001010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D8; end
        8'b10001011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D3; digit1 = 4'D9; end
        8'b10001100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D0; end
        8'b10001101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D1; end
        8'b10001110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D2; end
        8'b10001111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D3; end
        8'b10010000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D4; end
        8'b10010001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D5; end
        8'b10010010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D6; end
        8'b10010011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D7; end
        8'b10010100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D8; end
        8'b10010101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D4; digit1 = 4'D9; end
        8'b10010110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D0; end
        8'b10010111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D1; end
        8'b10011000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D2; end
        8'b10011001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D3; end
        8'b10011010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D4; end
        8'b10011011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D5; end
        8'b10011100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D6; end
        8'b10011101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D7; end
        8'b10011110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D8; end
        8'b10011111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D5; digit1 = 4'D9; end
        8'b10100000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D0; end
        8'b10100001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D1; end
        8'b10100010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D2; end
        8'b10100011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D3; end
        8'b10100100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D4; end
        8'b10100101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D5; end
        8'b10100110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D6; end
        8'b10100111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D7; end
        8'b10101000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D8; end
        8'b10101001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D6; digit1 = 4'D9; end
        8'b10101010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D0; end
        8'b10101011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D1; end
        8'b10101100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D2; end
        8'b10101101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D3; end
        8'b10101110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D4; end
        8'b10101111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D5; end
        8'b10110000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D6; end
        8'b10110001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D7; end
        8'b10110010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D8; end
        8'b10110011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D7; digit1 = 4'D9; end
        8'b10110100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D0; end
        8'b10110101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D1; end
        8'b10110110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D2; end
        8'b10110111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D3; end
        8'b10111000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D4; end
        8'b10111001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D5; end
        8'b10111010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D6; end
        8'b10111011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D7; end
        8'b10111100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D8; end
        8'b10111101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D8; digit1 = 4'D9; end
        8'b10111110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D0; end
        8'b10111111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D1; end
        8'b11000000: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D2; end
        8'b11000001: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D3; end
        8'b11000010: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D4; end
        8'b11000011: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D5; end
        8'b11000100: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D6; end
        8'b11000101: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D7; end
        8'b11000110: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D8; end
        8'b11000111: begin digit4 = 4'D0; digit3 = 4'D1; digit2 = 4'D9; digit1 = 4'D9; end
        8'b11001000: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D0; end
        8'b11001001: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D1; end
        8'b11001010: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D2; end
        8'b11001011: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D3; end
        8'b11001100: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D4; end
        8'b11001101: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D5; end
        8'b11001110: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D6; end
        8'b11001111: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D7; end
        8'b11010000: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D8; end
        8'b11010001: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D0; digit1 = 4'D9; end
        8'b11010010: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D0; end
        8'b11010011: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D1; end
        8'b11010100: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D2; end
        8'b11010101: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D3; end
        8'b11010110: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D4; end
        8'b11010111: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D5; end
        8'b11011000: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D6; end
        8'b11011001: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D7; end
        8'b11011010: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D8; end
        8'b11011011: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D1; digit1 = 4'D9; end
        8'b11011100: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D0; end
        8'b11011101: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D1; end
        8'b11011110: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D2; end
        8'b11011111: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D3; end
        8'b11100000: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D4; end
        8'b11100001: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D5; end
        8'b11100010: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D6; end
        8'b11100011: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D7; end
        8'b11100100: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D8; end
        8'b11100101: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D2; digit1 = 4'D9; end
        8'b11100110: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D0; end
        8'b11100111: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D1; end
        8'b11101000: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D2; end
        8'b11101001: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D3; end
        8'b11101010: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D4; end
        8'b11101011: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D5; end
        8'b11101100: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D6; end
        8'b11101101: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D7; end
        8'b11101110: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D8; end
        8'b11101111: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D3; digit1 = 4'D9; end
        8'b11110000: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D0; end
        8'b11110001: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D1; end
        8'b11110010: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D2; end
        8'b11110011: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D3; end
        8'b11110100: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D4; end
        8'b11110101: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D5; end
        8'b11110110: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D6; end
        8'b11110111: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D7; end
        8'b11111000: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D8; end
        8'b11111001: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D4; digit1 = 4'D9; end
        8'b11111010: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D5; digit1 = 4'D0; end
        8'b11111011: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D5; digit1 = 4'D1; end
        8'b11111100: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D5; digit1 = 4'D2; end
        8'b11111101: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D5; digit1 = 4'D3; end
        8'b11111110: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D5; digit1 = 4'D4; end
        8'b11111111: begin digit4 = 4'D0; digit3 = 4'D2; digit2 = 4'D5; digit1 = 4'D5; end
                
        endcase   
    end
    
    //Driver for 4 digit display
    SevSeg_4digit(clk,digit1,digit2,digit3,digit4, a, b, c, d, e, f, g, dp,an) ; 
    
    //Driver for 8x8 matrix
    DotMatrixDriver DMD(clk,plan,rowSelector,SH_CP, ST_CP, MR, OE, DS);       
    
endmodule
