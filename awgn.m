function [n_I, n_Q, EstadoAWGN_I, EstadoAWGN_Q] = ...
    awgn(EbNo, L, EstadoAWGN_I, EstadoAWGN_Q, M)
Eb = 1/log2(M);
No = Eb/(10^(EbNo/10));
[n_I,EstadoAWGN_I] = randg(L,EstadoAWGN_I);
n_I = sqrt(No/2)*n_I;
[n_Q,EstadoAWGN_Q] = randg(L,EstadoAWGN_Q);
n_Q = sqrt(No/2)*n_Q;
end
