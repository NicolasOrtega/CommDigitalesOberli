function [u,estadoN] = randu(N,estado0)
estadoN = estado0; % Estadio inicial
u = zeros(1,N); % Prelocalizacion
for n=1:N
    estadoN = mod(7^5*estadoN,2^31-1); % Calculo estado
    u(n) = estadoN/(2^31-1); % Calculo numero aleatorio
end
end
