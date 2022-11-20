module exe_unit_w15(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);

    parameter                                   ARG_BITS = 4;  
    input logic unsigned    [1:0]               i_oper;
    input logic signed      [ARG_BITS-1:0]     i_argA;
    input logic signed      [ARG_BITS-1:0]     i_argB;
    input logic                                 i_clk;
    input logic                                 i_rsn;

    output logic signed     [ARG_BITS-1:0]     o_result = '0;
    output logic unsigned   [3:0]               o_status = '0;

    logic signed            [ARG_BITS-1:0]     s_result = '0;
    logic                   [3:0]               s_status = '0;

    always_comb
    begin
        s_status = '0;
        s_result = '0;
        case (i_oper)
            0 :
            begin
                if (i_argB < 0)
                begin
                    s_result = i_argA <<< i_argB; // moving to left, because i_argB is negative number
                    s_status = '0;
                end

                else
                begin
                    s_result = '0;
                    s_status[3] = 1;
                end
            end
            1 :
            begin
                if (i_argA > i_argB)
                begin
                    s_result[0] = 1;
                    s_status = '0;
                end

                else
                begin
                    s_result = '0;
                    s_status = '0;
                end 
            end
            2 :
            begin
                if (i_argB > 0 && i_argB < ARG_BITS)
                begin
                    s_result = i_argA;
                    s_result[i_argB] = 1;
                    s_status = '0;
                end

                else
                begin
                    s_result = '0;
                    s_status[3] = 1;
                end
	        end
            3 :
            begin
                if (i_argA[ARG_BITS-1] == 1) // in case if number is negative
                begin
                    s_result[ARG_BITS-1]=i_argA[ARG_BITS-1];
                    for (int i=0; i<ARG_BITS-1; i++)
                    s_result[i] = ~ i_argA[i];
                    
                    s_result++;
                end

                else
                    s_result = i_argA;
            end
            default:
            begin
                s_result ='0;
                s_status[3] = 1;
            end
        endcase

        if (^ s_result == 1) s_status[0]=1; // when you XOR all of arguments, s_result has odd number of ones
        if (& s_result == 1) s_status[2]=1; // when you AND all of arguments, s_result has only ones 

    end

    always_ff @ (posedge i_clk)
    begin
	    if (i_rsn == 1'b0) 
	    begin
		o_result <= '0;
		o_status <= '0;
	    end

	    else
	    begin
		    o_result <= s_result;
		    o_status <= s_status;
	    end
    end


endmodule
