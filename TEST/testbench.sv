`timescale 1ms/1us
`define CLKSTEP     10
`define SIMTIME     800
`define DATASTEP    77
`define RSTTIME     151

module testbench;
parameter BITS = 4;

    // sygnaly sterujace
    logic               clk, rst = '1;
    logic [BITS-1:0]    i_A;
    logic [BITS-1:0]    i_B;
    logic [1:0]         i_oper;

    // Wyjscia danych
    logic [BITS-1:0]    data_out_model;
    logic [3:0]         data_out_rtl;
    logic [BITS-1:0]    data_out_model_status;
    logic [3:0]         data_out_rtl_status;

        // Model
        exe_unit_w15 #(.ARG_BITS(BITS))
            exe_unit_w15     (.i_oper(i_oper), .i_argA(i_A), .i_argB(i_B), .i_clk(clk), .i_rsn(rst), .o_status(data_out_model_status), .o_result(data_out_model));
        // Bramki
        exe_unit_w15_rtl
            exe_unit_w15_rtl (.i_oper(i_oper), .i_argA(i_A), .i_argB(i_B), .i_clk(clk), .i_rsn(rst), .o_status(data_out_rtl_status), .o_result(data_out_rtl));

    // Generacja sygnalu zegarowego
    always #`CLKSTEP clk <= ~clk;

    // Blok generacji losowych danych
    integer seed_data = 0;
    integer delay_data = 0;
    always @(clk)
    begin
        delay_data = ($random(seed_data) % `DATASTEP) + `DATASTEP;
        #(delay_data) {i_A, i_B, i_oper, rst} = $random(seed_data);
    end

    integer liczba_testow = 0;
    integer liczba_bledow = 0;
    always @(negedge clk)
    begin
        liczba_testow = liczba_testow + 1;
        if (data_out_model === data_out_rtl)
            $display("OK @(%0d): Dane wyjsciowe modelu (1) i bramek zgodne: %d === %d", 
                            $time, data_out_rtl, data_out_model);
        else
        begin
            $display("!!! BLAD @(%0d): Dane wyjsciowe modelu (1) i bramek niezgodne: %d === %d", 
                                $time, data_out_rtl, data_out_model);
            liczba_bledow = liczba_bledow + 1;
        end 
        if (data_out_model_status === data_out_rtl_status)
            $display("OK @(%0d): Dane wyjsciowe modelu (1) i bramek zgodne: %d === %d", 
                            $time, data_out_rtl_status, data_out_model_status);
        else
        begin
            $display("!!! BLAD @(%0d): Dane wyjsciowe modelu (1) i bramek niezgodne: %d === %d", 
                                $time, data_out_rtl_status, data_out_model_status);
            liczba_bledow = liczba_bledow + 1;
        end 

    end 

    // Blok zadania wartości początkowych i czasu symulacji
    initial begin
        {clk, rst, i_A, i_B, i_oper} <= '0;
        
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);

        #`RSTTIME rst <= '1;
        #`SIMTIME;
        $display("--------------------");
        $display("Liczba testow: %0d, liczba bledow: %0d", liczba_testow, liczba_bledow);
        $display("--------------------");

         $finish;
    end

endmodule