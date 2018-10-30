/* 
    Authors : Çaðatay Sel , Þamil Ýraz
    CS223 Digital Design Project : Highway Racing
      
    Project Members : Çaðatay  Sel, Þamil Ýraz
    
    */


`timescale 1ns / 1ps

module Shifter(input logic [1:0] move,
                        input logic clk_game,
                        input logic clk_matrix,
                        input logic rst,
                        output logic [7:0][23:0] plan2,
                        input logic [23:0] newRow,
                        input logic [7:0] obstaclePlace,
                        output logic [7:0] score,                                                
                        output logic [7:0] rowSelector,
                        output logic SH_CP, ST_CP, MR, OE, DS
    );
    
    typedef enum logic[1:0]{s0,s1,s2} statetype;
    statetype state,nextstate;
    
    
    logic [7:0][23:0]plan;    
    logic [7:0] carPlace;
    logic [7:0] localStore;    
    logic stop;
    //LastRowModule(plan[6],plan[7],move,clk_game,tempPlan7,stop);
    
    //State register
    always_ff@( posedge clk_game ) begin
        if(rst) state <= s0;
        else state <= nextstate;
    end      
       
    //Next state logic
    always_comb begin  
    case(state)
        s0: nextstate = s1;
        s1: if(stop) nextstate = s2; else nextstate = s1;
        s2: nextstate = s2;       
    endcase
    end
    
    //output logic 
    always@(posedge clk_game) begin   
    
       
       
       if(state == s0) begin
            plan[0] = 24'b000000000000000000000000;
            plan[1] = 24'b000000000000000000000000;
            plan[2] = 24'b000000000000000000000000;
            plan[3] = 24'b000000000000000000000000;
            plan[4] = 24'b000000000000000000000000;        
            plan[5] = 24'b000000000000000000000000;        
            plan[6] = 24'b000000000000000000000000;        
            plan[7] = 24'b000000000000000000010000;
            carPlace = 8'b00010000;            
            plan2 = plan;
            stop = 1'b0;
            localStore = 8'b00000000;
            score = localStore;
            
        
        end
        else if(state ==s1) begin        
                
                //Determining if we have crashed
                //obstacle place exactly equal to the row that is generated 8 cycles before so it must have reached to our cars row.
               case(carPlace)
                    8'b00000001: if(obstaclePlace[0:0]==1'b1)stop =1;
                    8'b00000010: if(obstaclePlace[1:1]==1'b1)stop =1;
                    8'b00000100: if(obstaclePlace[2:2]==1'b1)stop =1;
                    8'b00001000: if(obstaclePlace[3:3]==1'b1)stop =1;
                    8'b00010000: if(obstaclePlace[4:4]==1'b1)stop =1;
                    8'b00100000: if(obstaclePlace[5:5]==1'b1)stop =1;
                    8'b01000000: if(obstaclePlace[6:6]==1'b1)stop =1;
                    8'b10000000: if(obstaclePlace[7:7]==1'b1)stop =1;
               endcase
               
               //If we haven't crashed, we keep playing               
               if(~stop) begin 
                //Move right
                if(move==2'b10)begin
                    case(carPlace)
                
                        8'b00000001:begin plan[7] = plan[6]+24'b000000000000000000000010;carPlace = 8'b00000010;end
                        8'b00000010:begin plan[7] = plan[6]+24'b000000000000000000000100;carPlace = 8'b00000100;end
                        8'b00000100:begin plan[7] = plan[6]+24'b000000000000000000001000;carPlace = 8'b00001000;end
                        8'b00001000:begin plan[7] = plan[6]+24'b000000000000000000010000;carPlace = 8'b00010000;end
                        8'b00010000:begin plan[7] = plan[6]+24'b000000000000000000100000;carPlace = 8'b00100000;end
                        8'b00100000:begin plan[7] = plan[6]+24'b000000000000000001000000;carPlace = 8'b01000000;end
                        8'b01000000:begin plan[7] = plan[6]+24'b000000000000000001000000;carPlace = 8'b01000000;end
                        8'b10000000:begin plan[7] = plan[6]+24'b000000000000000001000000;carPlace = 8'b01000000;end
                    endcase              
                end
                //Move left
                else if(move==2'b01)begin
                    case(carPlace)
                    
                    8'b00000001:begin plan[7] = plan[6]+24'b000000000000000000000010;carPlace = 8'b00000010; end
                    8'b00000010:begin plan[7] = plan[6]+24'b000000000000000000000010;carPlace = 8'b00000010; end
                    8'b00000100:begin plan[7] = plan[6]+24'b000000000000000000000010;carPlace = 8'b00000010; end
                    8'b00001000:begin plan[7] = plan[6]+24'b000000000000000000000100;carPlace = 8'b00000100; end
                    8'b00010000:begin plan[7] = plan[6]+24'b000000000000000000001000;carPlace = 8'b00001000; end
                    8'b00100000:begin plan[7] = plan[6]+24'b000000000000000000010000;carPlace = 8'b00010000; end
                    8'b01000000:begin plan[7] = plan[6]+24'b000000000000000000100000;carPlace = 8'b00100000; end
                    8'b10000000:begin plan[7] = plan[6]+24'b000000000000000001000000;carPlace = 8'b01000000; end                   
                    endcase
                end
                //Stay
                else begin
                    case(carPlace)
                    8'b00000001:begin plan[7] = plan[6]+24'b000000000000000000000010;carPlace = 8'b00000010; end
                    8'b00000010:begin plan[7] = plan[6]+24'b000000000000000000000010;carPlace = 8'b00000010; end
                    8'b00000100:begin plan[7] = plan[6]+24'b000000000000000000000100;carPlace = 8'b00000100; end
                    8'b00001000:begin plan[7] = plan[6]+24'b000000000000000000001000;carPlace = 8'b00001000; end
                    8'b00010000:begin plan[7] = plan[6]+24'b000000000000000000010000;carPlace = 8'b00010000; end
                    8'b00100000:begin plan[7] = plan[6]+24'b000000000000000000100000;carPlace = 8'b00100000; end
                    8'b01000000:begin plan[7] = plan[6]+24'b000000000000000001000000;carPlace = 8'b01000000; end
                    8'b10000000:begin plan[7] = plan[6]+24'b000000000000000001000000;carPlace = 8'b01000000; end
                    endcase
                end                  
                           
                //Setting rest of the rows                  
                plan[6] = plan[5];
                plan[5] = plan[4];
                plan[4] = plan[3];
                plan[3] = plan[2];
                plan[2] = plan[1];
                plan[1] = plan[0];
                plan[0] = newRow;
                
                localStore = localStore +1;
                score = localStore;
                plan2 = plan;              
                end   
         end                     
        
        //Game over state  
        //Prints GG                    
        else if(state == s2)begin    
            plan[0] = 24'b111111110000000000000000;
            plan[1] = 24'b100000010000000000000000;
            plan[2] = 24'b100100010000000000000000;
            plan[3] = 24'b111101110000000000000000;
            plan[4] = 24'b000000000000000011111111;
            plan[5] = 24'b000000000000000010000001;
            plan[6] = 24'b000000000000000010010001;
            plan[7] = 24'b000000000000000011110111;
            plan2 = plan;        
            
            score = localStore;
        end        
     end
     
                
                
    
endmodule
