## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	
## Switches
set_property PACKAGE_PIN V17 [get_ports {rst}]                    
     set_property IOSTANDARD LVCMOS33 [get_ports {rst}]
#set_property PACKAGE_PIN V16 [get_ports {userMove[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {userMove[0]}]
#set_property PACKAGE_PIN W16 [get_ports {userMove[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {userMove[1]}]
	
##Pmod Header JA
##Sch name = JA1
#set_property PACKAGE_PIN J1 [get_ports {userMove[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {userMove[1]}]
##Sch name = JA3
    #set_property PACKAGE_PIN J2 [get_ports {userMove[0]}]                    
        #set_property IOSTANDARD LVCMOS33 [get_ports {userMove[0]}]

	
set_property PACKAGE_PIN W19 [get_ports userMove[1]]						
            set_property IOSTANDARD LVCMOS33 [get_ports userMove[1]]
set_property PACKAGE_PIN T17 [get_ports userMove[0]]                        
            set_property IOSTANDARD LVCMOS33 [get_ports userMove[0]]
	
	
##Pmod Header JB
    ##Sch name = JB1
    set_property PACKAGE_PIN A14 [get_ports {rowSelector[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[0]}]
    ##Sch name = JB2
    set_property PACKAGE_PIN A16 [get_ports {rowSelector[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[1]}]
    ##Sch name = JB3
    set_property PACKAGE_PIN B15 [get_ports {rowSelector[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[2]}]
    ##Sch name = JB4
    set_property PACKAGE_PIN B16 [get_ports {rowSelector[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[3]}]
    ##Sch name = JB7
    set_property PACKAGE_PIN A15 [get_ports {rowSelector[4]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[4]}]
    ##Sch name = JB8
    set_property PACKAGE_PIN A17 [get_ports {rowSelector[5]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[5]}]
    ##Sch name = JB9
    set_property PACKAGE_PIN C15 [get_ports {rowSelector[6]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[6]}]
    ##Sch name = JB10 
    set_property PACKAGE_PIN C16 [get_ports {rowSelector[7]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {rowSelector[7]}]
     
    
    
    ##Pmod Header JC
    ##Sch name = JC1
    set_property PACKAGE_PIN K17 [get_ports {DS}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {DS}]
    ##Sch name = JC2
    set_property PACKAGE_PIN M18 [get_ports {OE}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {OE}]
    ##Sch name = JC3
    set_property PACKAGE_PIN N17 [get_ports {ST_CP}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {ST_CP}]
    ##Sch name = JC4
    set_property PACKAGE_PIN P18 [get_ports {SH_CP}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {SH_CP}]
    ##Sch name = JC7
    set_property PACKAGE_PIN L17 [get_ports {MR}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {MR}]
    
##Display
set_property PACKAGE_PIN W7 [get_ports {a}]					
            set_property IOSTANDARD LVCMOS33 [get_ports {a}]
        set_property PACKAGE_PIN W6 [get_ports {b}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {b}]
        set_property PACKAGE_PIN U8 [get_ports {c}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {c}]
        set_property PACKAGE_PIN V8 [get_ports {d}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {d}]
        set_property PACKAGE_PIN U5 [get_ports {e}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {e}]
        set_property PACKAGE_PIN V5 [get_ports {f}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {f}]
        set_property PACKAGE_PIN U7 [get_ports {g}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {g}]
        
        set_property PACKAGE_PIN V7 [get_ports dp]                            
            set_property IOSTANDARD LVCMOS33 [get_ports dp]
        
        set_property PACKAGE_PIN U2 [get_ports {an[0]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
        set_property PACKAGE_PIN U4 [get_ports {an[1]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
        set_property PACKAGE_PIN V4 [get_ports {an[2]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
        set_property PACKAGE_PIN W4 [get_ports {an[3]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]