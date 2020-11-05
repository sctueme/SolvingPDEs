 function [W] = m_transp_LF(f,c,Ix,It,M,N)
 
%   Esquema de LAX-FRIEDRICHS

% Entradas: 
% f es la condicion de frontera periodica
% c es el coeficiente de la velocidad del transporte
% Ix intervalo de x (espacio)
% It intervalo del tiempo
% M es el numero de pasos en el intervalo de x
% N es el numero de pasos en el intervalo de t
%
% La salida es una matriz W cuya entrada ij es la aproximacion numerica en
% el punto i del espacio y j del tiempo de la solucion. 



%Se define el tamano del paso en el espacio:
h = (Ix(2) - Ix(1))/M;
%Se define el tamano del paso en el tiempo:
k = (It(2) - It(1))/N;

%Se define el coeficiente sigma, (s) :
s = (c*k)/h;

%Se define la matriz A 
A =  diag((s/2+1/2)*ones(M,1),-1) + diag((-s/2+1/2)*ones(M,1),1);
A(1,M+1) = s/2+1/2;
A(M+1,1) = -s/2+1/2;

%Se define la condicion de frontera 
dom = linspace(Ix(1) , Ix(2), M+1);
frontera = f(dom);


W(:,1) = frontera; 

%Se construye la matriz de soluciones
for i=1:N
    
    W(:,i+1) = A*W(:,i);
    
end

end
