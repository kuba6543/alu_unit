`timescale 1ns/1ps          // Ustawienie skal czasu w symulacji: krok_czasowy/rozdzielczosc_kroku
module testbench;
    parameter BITS = 4;     // Parametr modulu testbench

    logic [BITS-1:0] s_in;          // sygnaly wewnetrzne modulu testbench
    logic [BITS-1:0] s_model_out;  //
    logic [BITS-1:0] s_synth_out;  //

//  Nazwa modulu  |  Przypisanie   | Nazwa      |  Przypisanie jawne portow
//                |  parametrow    | instancji  |
    exe_unit_w15     #(.NUM(BITS))   projekt        (.i_argA(s_in), .o_result(s_model_out));    // model oryginalny
    exe_unit_w15_rtl                 projekt_rtl    (.i_argA(s_in), .o_result(s_synth_out));    // model po syntezie
                                                                                        //   logicznej
    initial 
        begin // Blok initial
                //-- Makra systemowe
                $dumpfile("signals.vcd");   // signals.vcd - plik gdzie zapisane zostana sygnaly
                                            //    zarejestrowane w symulacji
                $dumpvars(0,testbench);     // Wskazania ze wszystkie sygnaly z testbench i nizej
                                            //    maja byc rejestrowane podczas symulacji
            s_in = '0;
            #1  
                s_in = '1;
            #1  s_in = '0;
            #1  s_in = '1;
            
            #1       // Opoznienie o 1 krok czasowy

            $finish; // Makro systemowe - zakonczenie symulacji
        
        end   // koniec bloku initial
endmodule