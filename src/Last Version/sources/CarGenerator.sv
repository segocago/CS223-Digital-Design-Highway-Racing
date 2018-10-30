/* 
    Authors : Çaðatay Sel , Þamil Ýraz
    CS223 Digital Design Project : Highway Racing
    
    Project Members : Çaðatay  Sel, Þamil Ýraz
    
    */


`timescale 1ns / 1ps

module CarGenerator(
    input logic clk,
    input logic rst,
    output logic [23:0] row,
    output logic [7:0] obstaclePlace);

typedef enum logic[6:0]{s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,s41,s42,s43,s44,s45,s46,s47,s48,
s49,s50,s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,s61,s62,s63,s64,s65,s66,s67,s68,s69,s70,s71,s72,s73,s74,s75,s76,s77,s78,s79,s80} statetype;
    
statetype state,nextstate;

logic [5:0] counter;

//state register
always_ff@( posedge clk ) begin
    if(rst) state <= s11; else state <= nextstate;
end

//Next State Logic
always_comb begin 
    case(state)
        
        //Initial states that is required to set initial obstacles to 0
        s11: nextstate = s12;
        s12: nextstate = s13;
        s13: nextstate = s14;
        s14: nextstate = s15;
        s15: nextstate = s16;
        s16: nextstate = s17;
        s17: nextstate = s18;
        s18: nextstate = s19;
        s19: nextstate = s20;
        
        //Below states are loop
        s20: nextstate = s21;
        s21: nextstate = s22;
        s22: nextstate = s23;
        s23: nextstate = s24;
        s24: nextstate = s25;
        s25: nextstate = s26;
        s26: nextstate = s27;
        s27: nextstate = s28;
        s28: nextstate = s29;
        s29: nextstate = s30;
        s30: nextstate = s31;
        s31: nextstate = s32;
        s32: nextstate = s33;
        s33: nextstate = s34;
        s34: nextstate = s35;
        s35: nextstate = s36;
        s36: nextstate = s37;
        s37: nextstate = s38;
        s38: nextstate = s39;
        s39: nextstate = s40;
        s40: nextstate = s41;
        s41: nextstate = s42; 
        s42: nextstate = s43;
        s43: nextstate = s44;
        s44: nextstate = s45;
        s45: nextstate = s46;
        s46: nextstate = s47;
        s47: nextstate = s48;
        s48: nextstate = s49;                      
        s49: nextstate = s50;                      
        s50: nextstate = s51;                      
        s51: nextstate = s52;                      
        s52: nextstate = s53;                      
        s53: nextstate = s54;                      
        s54: nextstate = s55;                      
        s55: nextstate = s56;                      
        s56: nextstate = s57;                      
        s57: nextstate = s58;                      
        s58: nextstate = s59;                      
        s59: nextstate = s60;                      
        s60: nextstate = s61;                      
        s61: nextstate = s62;                      
        s62: nextstate = s63;                      
        s63: nextstate = s64;                      
        s64: nextstate = s65;                      
        s65: nextstate = s66;                      
        s66: nextstate = s67;                      
        s67: nextstate = s68;                      
        s68: nextstate = s69;                      
        s69: nextstate = s70;                      
        s70: nextstate = s71;                      
        s71: nextstate = s72;                      
        s72: nextstate = s73;                      
        s73: nextstate = s74;                      
        s74: nextstate = s75;                      
        s75: nextstate = s76;                      
        s76: nextstate = s77;                      
        s77: nextstate = s78;                      
        s78: nextstate = s79;                      
        s79: nextstate = s80;                      
        s80: nextstate = s20;                      
    endcase
end
    //output logic 
    always_comb begin
    
        case ( state )        
                                               
            //This state never happens, dont know why
            //Do not change it         
            s11:begin  row = 24'b111111100000000000000000 ; obstaclePlace = 8'b00000000; end
            
            
            
            //Obstacle place for first 8 state must be 0
            //We start generating cars
            //This first 8 state only occurs once            
            s12:begin  row = 24'b110000010000000000000000 ; obstaclePlace = 8'b00000000; end
            s13:begin  row = 24'b101000010000000000000000 ; obstaclePlace = 8'b00000000; end  
            s14:begin  row = 24'b100011010000000000000000 ; obstaclePlace = 8'b00000000; end
            s15:begin  row = 24'b101010010000000000000000 ; obstaclePlace = 8'b00000000; end
            s16:begin  row = 24'b100100110000000000000000 ; obstaclePlace = 8'b00000000; end
            s17:begin  row = 24'b110001110000000000000000 ; obstaclePlace = 8'b00000000; end
            s18:begin  row = 24'b101000110000000000000000 ; obstaclePlace = 8'b00000000; end
            s19:begin  row = 24'b111000110000000000000000 ; obstaclePlace = 8'b00000000; end
          
            //Obstacles start generating, cars keep coming
            //obstaclePlace is equal to first 8 bit of 8 state before's
            //s20 obstacles are s12's reds, s21 obstacle are s13's reds etc.            
            s20:begin  row = 24'b101010010000000000000000 ; obstaclePlace = 8'b01000000; end
            s21:begin  row = 24'b110001010000000000000000 ; obstaclePlace = 8'b00100000; end
            s22:begin  row = 24'b100100010000000000000000 ; obstaclePlace = 8'b00001100; end
            s23:begin  row = 24'b100010010000000000000000 ; obstaclePlace = 8'b00101000; end
            s24:begin  row = 24'b110000110000000000000000 ; obstaclePlace = 8'b00010010; end
            s25:begin  row = 24'b100010010000000000000000 ; obstaclePlace = 8'b01000110; end
            s26:begin  row = 24'b100100010000000000000000 ; obstaclePlace = 8'b00100010; end
            s27:begin  row = 24'b101001010000000000000000 ; obstaclePlace = 8'b01100010; end
            s28:begin  row = 24'b100110010000000000000000 ; obstaclePlace = 8'b00101000; end
            s29:begin  row = 24'b110000110000000000000000 ; obstaclePlace = 8'b01000100; end
            s30:begin  row = 24'b100110010000000000000000 ; obstaclePlace = 8'b00010000; end
            s31:begin  row = 24'b100011010000000000000000 ; obstaclePlace = 8'b00001000; end
            s32:begin  row = 24'b100111010000000000000000 ; obstaclePlace = 8'b01000010; end
            s33:begin  row = 24'b100010010000000000000000 ; obstaclePlace = 8'b00001000; end
            s34:begin  row = 24'b110000110000000000000000 ; obstaclePlace = 8'b00010000; end
            s35:begin  row = 24'b111000110000000000000000 ; obstaclePlace = 8'b00100100; end
            s36:begin  row = 24'b101000110000000000000000 ; obstaclePlace = 8'b00011000; end
            s37:begin  row = 24'b110000010000000000000000 ; obstaclePlace = 8'b01000010; end
            s38:begin  row = 24'b111000010000000000000000 ; obstaclePlace = 8'b00011000; end
            s39:begin  row = 24'b111100010000000000000000 ; obstaclePlace = 8'b00001100; end
            s40:begin  row = 24'b101001010000000000000000 ; obstaclePlace = 8'b00011100; end
            s41:begin  row = 24'b110000110000000000000000 ; obstaclePlace = 8'b00001000; end
            s42:begin  row = 24'b110010010000000000000000 ; obstaclePlace = 8'b01000010; end
            s43:begin  row = 24'b111010010000000000000000 ; obstaclePlace = 8'b01100010; end
            s44:begin  row = 24'b110000110000000000000000 ; obstaclePlace = 8'b00100010; end
            s45:begin  row = 24'b100100010000000000000000 ; obstaclePlace = 8'b01000000; end
            s46:begin  row = 24'b100110010000000000000000 ; obstaclePlace = 8'b01100000; end
            s47:begin  row = 24'b101100010000000000000000 ; obstaclePlace = 8'b01110000; end
            s48:begin  row = 24'b100000110000000000000000 ; obstaclePlace = 8'b00100100; end
            s49:begin  row = 24'b100010010000000000000000 ; obstaclePlace = 8'b01000010; end
            s50:begin  row = 24'b110000110000000000000000 ; obstaclePlace = 8'b01001000; end
            s51:begin  row = 24'b100100010000000000000000 ; obstaclePlace = 8'b01101000; end
            s52:begin  row = 24'b100001110000000000000000 ; obstaclePlace = 8'b01000010; end
            s53:begin  row = 24'b100011010000000000000000 ; obstaclePlace = 8'b00010000; end
            s54:begin  row = 24'b100110010000000000000000 ; obstaclePlace = 8'b00011000; end
            s55:begin  row = 24'b100000010000000000000000 ; obstaclePlace = 8'b00110000; end
            s56:begin  row = 24'b110000010000000000000000 ; obstaclePlace = 8'b00000010; end
            s57:begin  row = 24'b111000010000000000000000 ; obstaclePlace = 8'b00001000; end
            s58:begin  row = 24'b111100010000000000000000 ; obstaclePlace = 8'b01000010; end
            s59:begin  row = 24'b110000110000000000000000 ; obstaclePlace = 8'b00010000; end
            s60:begin  row = 24'b100000010000000000000000 ; obstaclePlace = 8'b00000110; end
            s61:begin  row = 24'b100010010000000000000000 ; obstaclePlace = 8'b00001100; end
            s62:begin  row = 24'b101000110000000000000000 ; obstaclePlace = 8'b00011000; end
            s63:begin  row = 24'b101001110000000000000000 ; obstaclePlace = 8'b00000000; end
            s64:begin  row = 24'b100100010000000000000000 ; obstaclePlace = 8'b01000000; end
            s65:begin  row = 24'b100000110000000000000000 ; obstaclePlace = 8'b01100000; end
            s66:begin  row = 24'b110001110000000000000000 ; obstaclePlace = 8'b01110000; end
            s67:begin  row = 24'b100101110000000000000000 ; obstaclePlace = 8'b01000010; end
            s68:begin  row = 24'b100100110000000000000000 ; obstaclePlace = 8'b00000000; end
            s69:begin  row = 24'b101000110000000000000000 ; obstaclePlace = 8'b00001000; end
            s70:begin  row = 24'b100010010000000000000000 ; obstaclePlace = 8'b00100010; end
            s71:begin  row = 24'b101000010000000000000000 ; obstaclePlace = 8'b00100110; end
            s72:begin  row = 24'b110001010000000000000000 ; obstaclePlace = 8'b00010000; end
            //Same car pattern of the first 8 state but different obstacles
            //s73 obstacles are s65's reds etc.
            s73:begin  row = 24'b110000010000000000000000 ; obstaclePlace = 8'b00000010; end
            s74:begin  row = 24'b101000010000000000000000 ; obstaclePlace = 8'b01000110; end
            s75:begin  row = 24'b100011010000000000000000 ; obstaclePlace = 8'b00010110; end  
            s76:begin  row = 24'b101010010000000000000000 ; obstaclePlace = 8'b00010010; end
            s77:begin  row = 24'b100100110000000000000000 ; obstaclePlace = 8'b00100010; end
            s78:begin  row = 24'b110001110000000000000000 ; obstaclePlace = 8'b00001000; end
            s79:begin  row = 24'b101000110000000000000000 ; obstaclePlace = 8'b00100000; end
            s80:begin  row = 24'b111000110000000000000000 ; obstaclePlace = 8'b01000100; end
           
        endcase    
    end
endmodule
