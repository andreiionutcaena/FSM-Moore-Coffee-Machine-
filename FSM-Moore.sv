`timescale 1ns / 1ps

module FSM
(
    input  logic reset,
    input  logic clock,
    input  logic bani50,
    input  logic bani100,
    output logic cafea  
);
localparam BANI_0   = 3'b000;
localparam BANI_50  = 3'b001;
localparam BANI_100 = 3'b010;
localparam BANI_150 = 3'b011;
localparam BANI_200 = 3'b100;
localparam BANI_250 = 3'b101;
localparam BANI_300 = 3'b111;

logic [2:0] next_state; //combinational circuit (input + state register)
logic [2:0] state; //state register


//FSM - Moore
always_ff@(posedge clock or posedge reset)
begin
    if(reset) state <= BANI_0;
    else      state <= next_state;
end
//



always_comb
begin
    next_state = state; //case for no input
    case(state)
        BANI_0:
        begin
            case({bani100,bani50})        
            2'b01:  next_state = BANI_50;
            2'b10:  next_state = BANI_100;
            2'b11:  next_state = BANI_150;
            endcase
        end
        BANI_50:
        begin
            case({bani100,bani50})
            2'b01:  next_state = BANI_100;
            2'b10:  next_state = BANI_150;
            2'b11:  next_state = BANI_200;
            endcase
        end
        BANI_100:
        begin
            case({bani100,bani50})
            2'b01:  next_state = BANI_150;
            2'b10:  next_state = BANI_200;
            2'b11:  next_state = BANI_250;
            endcase
        end
        BANI_150:
        begin
            case({bani100,bani50})
            2'b01:  next_state = BANI_200;
            2'b10:  next_state = BANI_250;
            2'b11:  next_state = BANI_300;
            endcase
        end
        BANI_200: next_state = BANI_0;

        BANI_250: next_state = BANI_50;
 
        BANI_300: next_state = BANI_100;
    endcase
end

always_comb
begin
    cafea=0;
    case(state)
        BANI_200: cafea=1;
        BANI_250: cafea=1;
        BANI_300: cafea=1;
    endcase
end



endmodule
