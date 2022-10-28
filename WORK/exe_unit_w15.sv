module exe_unit_w15(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);

    parameter ARG_BYTES = 4;  

    input unsigned logic [1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB;
    input reg i_clk;
    input reg i_rsn;

    output logic [ARG_BYTES-1:0]o_result;
    output unsigned logic [2:0] o_status;

    always_comb
    begin
    case (i_oper)
        2'b00 :
        begin
            if (i_argB<0)
            begin
                o_result = i_argA <<< i_argB;
                o_status = 3'b000;
            end
            else
            begin
                o_result = 'bx;
                o_status = 3'b001;
            end
        end
        2'b01:
        begin
            if (i_argA>i_argB)
            begin
                o_result = 1;
                o_status = 3'b000;
            end
            else
            begin
                o_result = 0;
                o_status = 3'b000;
            end
        end
        2'b10:
        begin
            
        end
        2'b11:
        begin

        end

    end

endmodule
