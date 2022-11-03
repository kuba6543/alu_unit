module exe_unit_w15_case0(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);
    
    parameter ARG_BYTES = 4;  

    input unsigned logic [1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB;
    input logic i_clk;
    input logic i_rsn;

    output logic [ARG_BYTES-1:0]o_result;
    output unsigned logic [3:0] o_status;
    begin

    end
endmodule

module exe_unit_w15_case1(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);
    
    parameter ARG_BYTES = 4;  

    input unsigned logic [1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB;
    input logic i_clk;
    input logic i_rsn;

    output logic [ARG_BYTES-1:0]o_result;
    output unsigned logic [3:0] o_status;
    begin

    end
endmodule

module exe_unit_w15_case2(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);
    
    parameter ARG_BYTES = 4;  

    input unsigned logic [1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB;
    input logic i_clk;
    input logic i_rsn;

    output logic [ARG_BYTES-1:0]o_result;
    output unsigned logic [3:0] o_status;
    begin

    end
endmodule

module exe_unit_w15_case3(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);
    
    parameter ARG_BYTES = 4;  

    input unsigned logic [1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB;
    input logic i_clk;
    input logic i_rsn;

    output logic [ARG_BYTES-1:0]o_result;
    output unsigned logic [3:0] o_status;
    begin

    end
endmodule

module exe_unit_w15(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);

    parameter ARG_BYTES = 4;  
    input unsigned logic [1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB;
    input logic i_clk;
    input logic i_rsn;
    output logic [ARG_BYTES-1:0] o_result;
    output unsigned logic [3:0] o_status;

    always_comb
    begin
    case (i_oper)
        0 :
        begin
            exe_unit_w15_case0 #(.ARG_BYTES(ARG_BYTES)) case0
            (.i_oper(i_oper), .i_argA(i_argA), .i_argB(i_argB), .i_clk(i_clk), .i_rsn(i_rsn), .o_result(o_result), .o_status(o_status));
        end
        1:
        begin
            exe_unit_w15_case1 #(.ARG_BYTES(ARG_BYTES)) case1
            (.i_oper(i_oper), .i_argA(i_argA), .i_argB(i_argB), .i_clk(i_clk), .i_rsn(i_rsn), .o_result(o_result), .o_status(o_status));
        end
        2:
        begin
            exe_unit_w15_case2 #(.ARG_BYTES(ARG_BYTES)) case2
            (.i_oper(i_oper), .i_argA(i_argA), .i_argB(i_argB), .i_clk(i_clk), .i_rsn(i_rsn), .o_result(o_result), .o_status(o_status));    
        end
        3:
        begin
            exe_unit_w15_case3 #(.ARG_BYTES(ARG_BYTES)) case3
            (.i_oper(i_oper), .i_argA(i_argA), .i_argB(i_argB), .i_clk(i_clk), .i_rsn(i_rsn), .o_result(o_result), .o_status(o_status));
        end
        default:
        begin
            o_result ='0;
            o_status[3] = 1;
        end
    endcase
    end

endmodule
