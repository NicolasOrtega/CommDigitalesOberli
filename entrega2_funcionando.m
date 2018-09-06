clear;
EbNo = 30;
M = 16; 
Nbits = 1e4;
EstadoPRBS = [1 0 0 0 1 1 0 1 0 0 1 0 1 0 0];
EstadoAWGN_I = 98104;
EstadoAWGN_Q = 19553;
[s, r, EstadoPRBS, EstadoAWGN_I, EstadoAWGN_Q] = ...
    tx_paquete_e2(Nbits,EbNo,M,1,1,1,1,EstadoPRBS,EstadoAWGN_I,EstadoAWGN_Q);
scatterplot(r)
