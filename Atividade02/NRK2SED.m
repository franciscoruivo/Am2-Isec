function [t,u,v] = NRK2SED(f,g,a,b,n,u0,v0)
%NRK2SED Método de Runge-Kutta de prdem 2 para um Sistema de SED/PVI
%Alunos:
%   15/05/2021 - Francisco Ruivo .: a2021142024@isec.pt
%   15/05/2021 - Daniel Rodrigues .: a2021142013@isec.pt
h = (b-a)/n;
t = a:h:b;
u = zeros(1,n+1);
v = zeros(1,n+1);
u(1) = u0;
v(1) = v0;
for i = 1:n
    k1u = h*f(t(i),u(i),v(i));
    k1v = h*g(t(i),u(i),v(i));  
    k2u = h*f(t(i+1),u(i)+k1u,v(i)+k1v);
    k2v = h*g(t(i+1),u(i)+k1u,v(i)+k1v);    
    u(i+1) = u(i)+(k1u+k2u)/2;
    v(i+1) = v(i)+(k1v+k2v)/2;    
end
end

