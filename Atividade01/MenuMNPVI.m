%MENUMNPVI  Menu de M�todos Num�ricos para um PVI
%   y = MenuMNPVI(f,a,b,n,y0)
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condi��o inicial  
%
%INPUT:
%   f - fun��o do 2.� membro da Equa��o Diferencial
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   y0 - condi��o inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das solu��es aproxima��es
%Alunos:
%   10/04/2021 - Francisco Ruivo .: a2021142024@isec.pt
%   10/04/2021 - Daniel Rodrigues .: a2021142013@isec.pt

function y=MenuMNPVI(f,a,b,n,y0)
y=[];
menuMNPVI = 1;
while menuMNPVI~=5
    clc
    disp('--------------------------------------------------')
    disp('           M�todos Num�ricos para PVI             ')
    disp('--------------------------------------------------')
    menuMNPVI=menu('M�todos Num�ricos para PVI', ...
                   'M�todo de Euler',...
                   'M�todo RK2',...
                   'M�todo RK4',...
                   'Aplicar 3 M�todos em simultaneo',...
                   'Todos',...
                   'Sa�r');
    switch menuMNPVI
        case 1
             f=@(t,y)y+exp(3*t)
              y=NEuler(f,a,b,n,y0);
               disp('-----------M�todo de Euler---------')
        case 2  
             f=@(t,y)y+exp(3*t)
              y=NRK2(f,a,b,n,y0);  
              disp('-----------M�todo RK2---------')
        case 3
             f=@(t,y)y+exp(3*t)
              y=NRK4(f,a,b,n,y0);  
               disp('-----------M�todo RK4---------')
        case 4
             f=@(t,y)y+exp(3*t)
              y=METSIMULTANEOS(f,a,b,n,y0); 
               disp('-----------3 M�todos em simultaneo---------')
                
        case 5
             % Abrir sub-menu dos M�todos
             auxiliar = menuMetodos(f,a,b,n,y0);
             if auxiliar
                 return;
             end                 
    end
    disp('-----------Solu��o aproximada do PVI---------')
    disp(y)
    input('Prima numa tecla para continuar �')
end






            