function [t,u,v] = NEulerSED(f,g,a,b,n,u0,v0)
%NEULERSED Método de Euler para um Sistema de SED/PVI
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
    u(i+1) = u(i)+h*f(t(i),u(i),v(i));
    v(i+1) = v(i)+h*g(t(i),u(i),v(i));    
end
end

