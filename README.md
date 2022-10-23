# Projekt indywidualny - Jakub Bartuszek, 318490

## 1. Wejścia i wyjścia 
Projekt zawiera zmienne wejściowe:
1. i_oper (2 bity) - Kontroluje jakie operacje są wykonywane.
2. i_argA i i_argB (dowolna ilość bitów - domyślnie 4) - Dane wejściowe argumentów A i B.
3. i_clk (1 bit) - Wejście zegara - przy narastaniu tego zbocza jest wykonywana większość operacji w module.
4. i_rsn (1 bit)- Reset synchroniczny - powoduje wyzerowanie rejestrów i watości funkcji, gdy wartość bitu wynosi 0.

Projekt zawiera zmienne wyjściowe:
1. o_result (tyle samo bitów co wejścia i_argA i i_argB) - Dane wyjściowe modułu.
2. o_status (3 bity) - wyjście informujące o ewentualnych błędach lub innych informacjach:
    * 000 - OK - brak błędów lub innych informacji.
    * 001 - ERROR - błąd operacji, wartość o_result jest nieokreślona.
    * 010 - ONES - wszystkie bity wyjścia o_result to 1.
    * 011 - OVERFLOW - nastąpiło przepełnienie wyjścia, przez co nie można zapisać prawidłowej wartości wyjścia.
    * 100 - ODD - w wyniku jest nieparzysta ilość jedynek.

---

##  2. 