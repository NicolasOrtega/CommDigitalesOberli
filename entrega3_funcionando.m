%% Parametros
clear;
EbNo_vec = 1:13;
EbNo = 7;
M = 64; 

Nbits = 7584*10*2;
Nsym = Nbits/log2(M);
Nerr_stop = 130;
EstadoPRBS = [0 1 0 1 1 1 0 1 0 1 0 0 1 1 0];
EstadoAWGN_I = 20180816;
EstadoAWGN_Q = 917;         

%% Prueba de cuenta de errores
% [Err_s, Err_b, EstadoPRBS, EstadoAWGN_I, EstadoAWGN_Q] = ...
%     tx_paquete_e3(Nbits, EbNo, M,1, 1, 1, 1, ...
%                   EstadoPRBS, EstadoAWGN_I, EstadoAWGN_Q);
% 
% [BER,SER] = berawgn(EbNo,'psk',M,'nondiff')
% BER_sim = Err_b/Nbits
% SER_sim = Err_s/Nsym

%% Prueba graficos
[Ps, Pb, Err_s_tot, Err_b_tot, Ns_tot, Nb_tot, tictoc] = ...
    simula_e3(EbNo_vec, M, Nbits, Nerr_stop, ...
              1, 1, 1, 1, 1, ...
              EstadoPRBS, EstadoAWGN_I, EstadoAWGN_Q, ...
              1, 1);
          
[BER,SER] = berawgn(EbNo_vec,'qam',M);
%[BER,SER] = berawgn(EbNo_vec,'psk',M,'nondiff');
semilogy(EbNo_vec,BER,EbNo_vec,Pb,'*',EbNo_vec,SER,EbNo_vec,Ps,'*');
legend('BER Teorico','BER Simulado','SER Teorico','SER Simulado')
grid on
