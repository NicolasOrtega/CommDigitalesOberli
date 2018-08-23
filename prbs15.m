function [prbs,estadoN] = prbs15(N,estado0)
prbs = zeros(1,N);
estadoN = estado0;
for i = 1:N
    prbs(i) = xor(estado0(1),estado0(15));
    ii = 1;
    while ii<15
        estadoN(ii+1) = estado0(ii);
        ii = ii+1;
    end
    estadoN(1) = prbs(i);
    estado0 = estadoN;
end    
end
