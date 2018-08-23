function [g,estadoN] = randg(N,estado0)
estadoN = estado0; % Estadio inicial
g = zeros(1,N); % Prelocalizacion
for n=1:N
    [u,estadoN] = randu(2,estadoN); % Calculo de 2 numeros aleatorios. Se guarda el estado N tambien.
    s = (2*u(1)-1)^2+(2*u(2)-1)^2; % Calculo de s
    while s>=1 % Si s es mayor que 1, se vuelve a calcular con el estado generado, hasta que de menor que 1
        [u,estadoN] = randu(2,estadoN);  
        s = (2*u(1)-1)^2+(2*u(2)-1)^2;
    end
    g(n) = (2*u(1)-1)*sqrt(-2*log(s)/s); % Salida de la funcion
end
end
