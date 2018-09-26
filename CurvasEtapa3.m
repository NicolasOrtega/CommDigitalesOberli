clear;
%% Curvas teoricas
EbNo_vecdB = 0:10;
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

%%
figure
semilogy(EbNo_vecdB,SERbpsk,EbNo_vecdB,SERqpsk,EbNo_vecdB,SER16qam,EbNo_vecdB,SER64qam);
legend('BPSK','QPSK','16-QAM','64-QAM')
title('Probabilidad de Error de Simbolo en AWGN')
grid on
figure
semilogy(EbNo_vecdB,BERbpsk,EbNo_vecdB,BERqpsk,EbNo_vecdB,BER16qam,EbNo_vecdB,BER64qam);
legend('BPSK','QPSK','16-QAM','64-QAM')
title('Probabilidad de Error de Bit en AWGN')
grid on
