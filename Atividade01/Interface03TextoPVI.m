% Interface (vers�o03) para os PVI
% Aplica��o dos M�todos Num�ricos de Euler e de Runge-Kutta
%   10/04/2021 - Francisco Ruivo .: a2021142024@isec.pt
%   10/04/2021 - Daniel Rodrigues .: a2021142013@isec.pt
clear
primeiraVez=1;
opcao=1;
while opcao ~= 6 
    clc
    disp('------- M�TODOS NUM�RICOS PARA PVI ------')
    disp(' ')
    if(~primeiraVez)
        fprintf('1. INTRODUZIR PAR�METROS DO PVI\n')     
        fprintf('2. M�TODO DE EULER\n')
        fprintf('3. M�TODO DE EULER MELHORADO\n') 
        fprintf('4. M�TODO DE RK2\n')
        fprintf('5. M�TODO DE RK4\n')
        fprintf('6. APLICAR 3 EM SIMULT�NEO\n')
        fprintf('7. ODE45\n\n')
        fprintf('8. SAIR\n') 
        opcao=input('Op��o: ');
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
        disp('ERRO! Introduza uma fun��o em t e y');
    end
end

a=str2num(input('a = ','s'));
while 1
    b=str2num(input('b = ', 's'));
    if (isscalar(b) && isreal(b) && b > a)
        break;
    else
        errordlg('Introduza um n�mero real b, com b > a',...
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
        disp('------ AS APROXIMA��ES OBTIDAS S�O: ------')
        disp(' ')
        disp(y)
    end
    if opcao~=8
       tecla =input('\nPrima uma tecla para continuar ...');
    end
end   
