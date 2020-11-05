function [W] = m_heat_CN(b, l, r, D, Ix, It, M, N)

%   Metodo de Crank-Nicholson para resolver la ecuacion del calor. 
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
% La salida es una matriz W cuya entrada ij es la aproximacion numerica en
% el punto i del espacio y j del tiempo de la solucion. 



%Se define el tamano del paso en el espacio:
h = (Ix(2) - Ix(1))/M;
%Se define el tamano del paso en el tiempo:
k = (It(2) - It(1))/N;

%Se define el coeficiente sigma, (s) :
s = D*(k/(h^2));

%Se definen las matrices A y B con las que se va a resolver la EDP: (A
%representa las diferencias hacia atras y B hacia adelante)

A = diag(2+2*s*ones(M-1,1)) + diag(-s*ones(M-2,1),1);
A = A + diag(-s*ones(M-2,1),-1);

B = diag(2-2*s*ones(M-1,1)) + diag(s*ones(M-2,1),1);
B = B + diag(s*ones(M-2,1),-1);

%Se definen las condiciones de fronteras:

fizq = l(It(1) + (0:N)*k);
fder = r(It(1) + (0:N)*k);

%Se construye la matriz W de soluciones: 

W(:,1) = b(Ix(1) + (1:M-1)*h)';

    for j = 1:N
        L = [fizq(j) + fizq(j+1); zeros(M-3,1);fder(j) + fder(j+1)];
        W(:,j+1) = A\(B*W(:,j) + s*L);
    end
    
W = [fizq ; W ; fder];

%Visualizacion de la solucion:

X = (0:M)*h; 
T = (0:N)*k;
mesh ( X,T, W');
view(40,30);
axis([Ix(1) Ix(2) It(1) It(2) -1 1])


end
        
        







