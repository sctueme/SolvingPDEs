function [W] = m_heat_exp(b, l, r, D, Ix, It, M, N)

%   Metodo explicito para resolver la ecuacion del calor (FTCS) 
%   (las funciones que son entradas del metodo deben estar asignadas por 
%   'function handle'). Se usan condiciones de Dirichlet. 

% Entradas: 
% b es la condicion inicial
% l es la condicion de la frontera izquierda y r la derecha
% D es el coeficiente de difusion de calor
% Ix intervalo de x (espacio)
% It intervalo del tiempo
% M es el numero de pasos en el intervalo de x
% N es el numero de pasos en el intervalo de t
%
% La salida es una matriz W cuya entrada ij es la aproximacion numerica de la solucion. 


%Se define el tamano del paso en el espacio:
h = (Ix(2) - Ix(1))/M;
%Se define el tamano del paso en el tiempo:
k = (It(2) - It(1))/N;

%Se define el coeficiente sigma, (s) :
s = D*(k/(h^2));

%Se define la matriz A con la que se va a resolver la EDP: (diferencias hacia adelante en el tiempo)

A = diag(1-2*s*ones(M-1,1)) + diag(s*ones(M-2,1),1);
A = A+diag(s*ones(M-2,1),-1);

%Se definen las condiciones de fronteras:

fizq = l(It(1) + (0:N)*k);
fder = r(It(1) + (0:N)*k);


%Se construye W, la matriz con soluciones:

W(:,1) = b(Ix(1) + (1:M-1)*h)';

    for j =1:N
        W(:,j+1) = A*W(:,j) + s*[fizq(j);zeros(M-3,1);fder(j)];
    end

W = [fizq;W;fder]; %Se agregan las fronteras a la matriz de sols




end