%MENUMNPVI  Menu de Métodos Numéricos para um PVI
%   y = MenuMNPVI(f,a,b,n,y0)
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das soluções aproximações
%Alunos:
%   10/04/2021 - Francisco Ruivo .: a2021142024@isec.pt
%   10/04/2021 - Daniel Rodrigues .: a2021142013@isec.pt

function y=MenuMNPVI(f,a,b,n,y0)
y=[];
menuMNPVI = 1;
while menuMNPVI~=5
    clc
    disp('--------------------------------------------------')
    disp('           Métodos Numéricos para PVI             ')
    disp('--------------------------------------------------')
    menuMNPVI=menu('Métodos Numéricos para PVI', ...
                   'Método de Euler',...
                   'Método RK2',...
                   'Método RK4',...
                   'Aplicar 3 Métodos em simultaneo',...
                   'Todos',...
                   'Saír');
    switch menuMNPVI
        case 1
             f=@(t,y)y+exp(3*t)
              y=NEuler(f,a,b,n,y0);
               disp('-----------Método de Euler---------')
        case 2  
             f=@(t,y)y+exp(3*t)
              y=NRK2(f,a,b,n,y0);  
              disp('-----------Método RK2---------')
        case 3
             f=@(t,y)y+exp(3*t)
              y=NRK4(f,a,b,n,y0);  
               disp('-----------Método RK4---------')
        case 4
             f=@(t,y)y+exp(3*t)
              y=METSIMULTANEOS(f,a,b,n,y0); 
               disp('-----------3 Métodos em simultaneo---------')
                
        case 5
             % Abrir sub-menu dos Métodos
             auxiliar = menuMetodos(f,a,b,n,y0);
             if auxiliar
                 return;
             end                 
    end
    disp('-----------Solução aproximada do PVI---------')
    disp(y)
    input('Prima numa tecla para continuar »')
end






            