%Ejercicio 3.2.2 (Ecuacion de Calor con metodo Crank-Nicholson).

 clear all; 
 close all; 
 clc;

%Se definen los intervalos y las condiciones iniciales de la EDP:

Ix = [0,1];
It = [0,1];
M = 20;
N = 200;
h = (Ix(2)-Ix(1))/M;
k = (It(2)-It(1))/N;

b = @(x) cos (2*pi*x);
l = @(t) exp (-4*t);
r = l;                  
D = 1/(pi^2);

%Solucion Exacta;
SolEx = @(x,t) exp(-4*t)*cos(2*pi*x);

%Metodo Crank-Nicholson:

W = m_heat_CN(b,l,r,D,Ix,It,M,N);

%Plot con la solucion numerica del metodo Crank Nicholson:

X = (0:M)*h; 
T = (0:N)*k;
mesh ( X,T, W');
view(70,30);
axis([Ix(1) Ix(2) It(1) It(2) -1 1])

%Errores:
[ ~, pos_03] = min(abs(linspace(Ix(1), Ix(2), M+1) - 0.3));
x0 = pos_03;

ValorExacto = SolEx(0.3,1);
aprox = W(x0,N+1)
Error = abs(SolEx(0.3,1)-aprox)
















