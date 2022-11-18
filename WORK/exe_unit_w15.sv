module exe_unit_w15(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);

    parameter ARG_BYTES = 4;  
    input unsigned logic [1:0]i_oper;
    input logic [ARG_BYTES-1:0]i_argA;
    input logic [ARG_BYTES-1:0]i_argB
    ;
    input logic i_clk;
    input logic i_rsn;

    output logic [ARG_BYTES-1:0] o_result;
    output unsigned logic [3:0] o_status;

    logic [ARG_BYTES-1:0] q_result;
    logic [3:0] q_status;

    always_comb
    begin
    case (i_oper)
        0 :
        begin

        end
        1:
        begin

        end
        2:
        begin

	end
        3:
        begin

        end
        default:
        begin
            q_result ='0;
            q_status[3] = 1;
    end
    endcase

    if (q_result ^ == 1) q_status[0]=1;
    if (q_result && == 1) q_status[2]=1;
    end

    always_ff (posedge i_clk)
    begin
	    if (i_rsn == 0) 
	    begin
		o_result <= '0;
		o_status <= '0;
	    end

	    else
	    begin
		    o_result <= q_result;
		    o_status <= q_status;
	    end
    end


endmodule
