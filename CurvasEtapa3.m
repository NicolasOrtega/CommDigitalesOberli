clear;
%% Curvas teoricas
EbNo_vecdB = 0:9;
EbNo_vec = 10.^(EbNo_vecdB/10);

% BPSK
BERbpsk = qfunc(sqrt(2*EbNo_vec));
SERbpsk = BERbpsk;

% QPSK
M = 4;
EsNo_vecdB = EbNo_vecdB + 10*log10(log2(M));
EsNo_vec = 10.^(EsNo_vecdB/10);
k = sqrt(1/((2/3)*(M-1)));
SERqpsk = 2*(1-1/sqrt(M))*erfc(k*sqrt(EsNo_vec))-(1-2/sqrt(M)+1/M)*(erfc(k*sqrt(EsNo_vec))).^2;
BERqpsk = qfunc(sqrt(2*EbNo_vec));

% 16-QAM
M = 16;
EsNo_vecdB = EbNo_vecdB + 10*log10(log2(M));
EsNo_vec = 10.^(EsNo_vecdB/10);
k = sqrt(1/((2/3)*(M-1)));
SER16qam = 2*(1-1/sqrt(M))*erfc(k*sqrt(EsNo_vec))-(1-2/sqrt(M)+1/M)*(erfc(k*sqrt(EsNo_vec))).^2;
BER16qam = (4*(sqrt(M)-1)/(sqrt(M)*log2(M)))*qfunc(sqrt(3*EbNo_vec*log2(M)/(M-1)));

% 64-QAM
M = 64;
EsNo_vecdB = EbNo_vecdB + 10*log10(log2(M));
EsNo_vec = 10.^(EsNo_vecdB/10);
k = sqrt(1/((2/3)*(M-1)));
SER64qam = 2*(1-1/sqrt(M))*erfc(k*sqrt(EsNo_vec))-(1-2/sqrt(M)+1/M)*(erfc(k*sqrt(EsNo_vec))).^2;
BER64qam = (4*(sqrt(M)-1)/(sqrt(M)*log2(M)))*qfunc(sqrt(3*EbNo_vec*log2(M)/(M-1)));

%% Curvas simuladas
Nbits = 7584;
Nerr_stop = 130;
SemillaPRBS = [0 1 0 1 1 1 0 1 0 1 0 0 1 1 0];
SemillaAWGN_I = 20180816;
SemillaAWGN_Q = 917;

M = 2;
[PsBPSK, PbBPSK] = ...
    simula_e3(EbNo_vecdB, M, Nbits, Nerr_stop, 1, 1, 1, 1, 1, ...
              SemillaPRBS, SemillaAWGN_I, SemillaAWGN_Q, 1, 1);

M = 4;
[PsQPSK, PbQPSK] = ...
    simula_e3(EbNo_vecdB, M, Nbits, Nerr_stop, 1, 1, 1, 1, 1, ...
              SemillaPRBS, SemillaAWGN_I, SemillaAWGN_Q, 1, 1);
          
M = 16;
[Ps16QAM, Pb16QAM] = ...
    simula_e3(EbNo_vecdB, M, Nbits, Nerr_stop, 1, 1, 1, 1, 1, ...
              SemillaPRBS, SemillaAWGN_I, SemillaAWGN_Q, 1, 1);
          
M = 64;
[Ps64QAM, Pb64QAM] = ...
    simula_e3(EbNo_vecdB, M, Nbits, Nerr_stop, 1, 1, 1, 1, 1, ...
              SemillaPRBS, SemillaAWGN_I, SemillaAWGN_Q, 1, 1);          
          
%%
figure % Probabilidades de simbolo teoricas
semilogy(EbNo_vecdB,SERbpsk,EbNo_vecdB,SERqpsk,EbNo_vecdB,SER16qam,EbNo_vecdB,SER64qam);
legend('BPSK','QPSK','16-QAM','64-QAM')
title('Probabilidad de Error de Simbolo en AWGN')
grid on
figure % Probabilidades de bit teoricas
semilogy(EbNo_vecdB,BERbpsk,EbNo_vecdB,BERqpsk,EbNo_vecdB,BER16qam,EbNo_vecdB,BER64qam);
legend('BPSK','QPSK','16-QAM','64-QAM')
title('Probabilidad de Error de Bit en AWGN')
grid on
figure % Probabilidades de simbolo teoricas vs simuladas
semilogy(EbNo_vecdB,SERbpsk,EbNo_vecdB,PsBPSK,'*',EbNo_vecdB,SERqpsk,...
    EbNo_vecdB,PsQPSK,'square',EbNo_vecdB,SER16qam,EbNo_vecdB,Ps16QAM,'d',...
    EbNo_vecdB,SER64qam,EbNo_vecdB,Ps64QAM,'o');
legend('BPSK Teorico','BPSK Simulado','QPSK','QPSK Simulado','16-QAM',...
    '16-QAM Simulado','64-QAM','64-QAM Simulado')
title('Probabilidad de Error de Simbolo en AWGN, simulacion y teoricas')
grid on
figure % Probabilidades de bit teoricas vs simuladas
semilogy(EbNo_vecdB,BERbpsk,EbNo_vecdB,PbBPSK,'*',EbNo_vecdB,BERqpsk,...
    EbNo_vecdB,PbQPSK,'square',EbNo_vecdB,BER16qam,EbNo_vecdB,Pb16QAM,'d',...
    EbNo_vecdB,BER64qam,EbNo_vecdB,Pb64QAM,'o');
legend('BPSK Teorico','BPSK Simulado','QPSK','QPSK Simulado','16-QAM',...
    '16-QAM Simulado','64-QAM','64-QAM Simulado')
title('Probabilidad de Error de Bit en AWGN, simulacion y teoricas')
grid on
