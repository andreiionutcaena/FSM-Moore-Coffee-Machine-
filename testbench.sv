`timescale 1ns / 1ps

module testbench();

logic reset  ;
logic clock  ;
logic bani50 ;
logic bani100;
logic cafea  ;

logic cafea_golden_model;
logic ok;

FSM DUT                                          
(                                                    
    .reset  (reset  ),                            
    .clock  (clock  ),                            
    .bani50 (bani50 ),                            
    .bani100(bani100),                            
    .cafea  (cafea  )
);                                                   

initial
begin
    clock = 0;
    forever #1 clock = ~clock;
end

initial
begin
    cafea_golden_model = 0; // l-am modelat eu sa verific FSM-ul
    reset = 0;
    #7  reset = 1;
    #13 reset = 0;
    bani100 = 0;
    bani50  = 0;
        
    @(negedge clock);
    //STATE = BANI_0;
    bani50 = 1; bani100 = 1; // NEXT_STATE = BANI_150
    
    @(negedge clock);
    // STATE = BANI_150
    bani50 = 1; bani100 = 1; // NEXT_STATE = BANI_300
    
    @(negedge clock);
    // STATE = BANI_300
    cafea_golden_model = 1; // NEXT_STATE = BANI_100
    bani100 = 0;
    bani50  = 0;
    
    @(negedge clock);
    // STATE = BANI_100
    cafea_golden_model = 0;
    bani50  = 1; // NEXT_STATE = BANI_150
    bani100 = 0;
    
    @(negedge clock);
    // STATE = BANI_150
    cafea_golden_model = 0;
    bani100 = 1; // NEXT_STATE = BANI_250
    bani50  = 0;
    
    @(negedge clock);
    // STATE = BANI_250
    cafea_golden_model = 1;
    bani100 = 0;
    bani50  = 0;
    
    @(negedge clock);
    // STATE = BANI_50
    cafea_golden_model = 0;
    bani100 = 0;
    bani50  = 0;
    #100;
    $stop();
end

always_ff@(posedge clock)
begin
    ok <= (cafea == cafea_golden_model);
end

endmodule
