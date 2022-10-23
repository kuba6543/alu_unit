module exe_unit_w15(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);

    parameter ARG_BYTES = m; 
    parameter OPER_BYTES = 2; // there will be four operations, so it will be describes as two byte input 

    input logic [OPER_BYTES-1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB;
    input reg i_clk;
    input reg i_rsn;

    output logic o_result;
    output logic [2:0] o_status;

    always_comb
    begin
    priority if (i_oper == 0)

    else if (i_oper == 1)

    else if (i_oper == 2)

    else if (i_oper == 3)        
    end

endmodule
