% Interface (versão03) para os PVI
% Aplicação dos Métodos Numéricos de Euler e de Runge-Kutta
%   10/04/2021 - Francisco Ruivo .: a2021142024@isec.pt
%   10/04/2021 - Daniel Rodrigues .: a2021142013@isec.pt
clear
primeiraVez=1;
opcao=1;
while opcao ~= 6 
    clc
    disp('------- MÉTODOS NUMÉRICOS PARA PVI ------')
    disp(' ')
    if(~primeiraVez)
        fprintf('1. INTRODUZIR PARÂMETROS DO PVI\n')     
        fprintf('2. MÉTODO DE EULER\n')
        fprintf('3. MÉTODO DE EULER MELHORADO\n') 
        fprintf('4. MÉTODO DE RK2\n')
        fprintf('5. MÉTODO DE RK4\n')
        fprintf('6. APLICAR 3 EM SIMULTÂNEO\n')
        fprintf('7. ODE45\n\n')
        fprintf('8. SAIR\n') 
        opcao=input('Opção: ');
    else
        opcao=1;
        primeiraVez=0;
    end
    
    y=[];
    switch opcao
        case 1
                     while 1
    strF=input('f(t,y) = ', 's');
    f=@(t,y) eval(vectorize(strF));
    try
        syms t y;
        fTeste=f(t,y);
        break;
    catch me
        disp('ERRO! Introduza uma função em t e y');
    end
end

a=str2num(input('a = ','s'));
while 1
    b=str2num(input('b = ', 's'));
    if (isscalar(b) && isreal(b) && b > a)
        break;
    else
        errordlg('Introduza um número real b, com b > a',...
                 'ERRO','modal');
    end
end

n=str2num(input('n = ','s'));
y0=str2num(input('y0 = ','s'));
        case 2 
              y=NEuler(f,a,b,n,y0);  
        case 3 
              y=NEulerMelhorado(f,a,b,n,y0); 
        case 4  
              y=NRK2(f,a,b,n,y0);                
        case 5
              y=NRK4(f,a,b,n,y0);           
        case 6
              y=METSIMULTANEOS(f,a,b,n,y0);
        case 7 
              y=N_ODE45(f,a,b,n,y0); 
    end
    
    if ~isempty(y)
        disp(' ')
        disp('------ AS APROXIMAÇÕES OBTIDAS SÃO: ------')
        disp(' ')
        disp(y)
    end
    if opcao~=8
       tecla =input('\nPrima uma tecla para continuar ...');
    end
end   
