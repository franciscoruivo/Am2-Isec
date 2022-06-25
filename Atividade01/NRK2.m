%NRK2 Método de Runge-Kutta de ordem 2 para resolução numérica de EDO/PVI
%   y'=f(t,y), t=[a,b], y(a)=y0
%   y(i+1)=y(i)+ 1/2*(k1+k2)
% No Input/entrada temos:
% f - funcao da equacao diferencial em t e y
% a - limite esquerdo do intervalo da função
% b - limite direito do intervalo da função
% n - nº de subintervalos da função
% y0 - Valor inicial do PVI

% No OUTPUT/Saida 
% y-obtemos o valor das soluções aproximadas

%Alunos:
%   10/04/2021 - Francisco Ruivo .: a2021142024@isec.pt
%   10/04/2021 - Daniel Rodrigues .: a2021142013@isec.pt
function y = NRK2(f,a,b,n,y0)
h = (b-a)/n;
t = a:h:b;
y = zeros(1,n+1);
y(1) = y0;
for i = 1:n
    k1 = h*f(t(i),y(i));
    k2 = h*f(t(i+1),y(i)+k1);
    y(i+1) = y(i)+(k1+k2)/2;
end