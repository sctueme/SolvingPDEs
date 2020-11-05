%Ejercicio de la Ecuacion de Transporte, Metodo de Lax-Friedrichs y
%Leapfrog


clear all; 
close all; 
clc;


%Definimos variables

G = @(x) U0 (x);
Ix = [-1,1];
It = [0,10];
M = 40;
N = 400;

%Aplicamos el metodo deseado
W = m_transp_Leapfrog(G,2,Ix,It,M,N);

%Grafica

X = linspace(Ix(1) , Ix(2), M+1); 
T = linspace(It(1) , It(2), N+1);
mesh ( X,T, W');
view(50,20);
axis([Ix(1) Ix(2) It(1) It(2) -3 3]);



%Errores de aproximacion:

%Encontramos los indices que queremos de la matriz de soluciones.
[ ~, pos_08] = min(abs(linspace(Ix(1), Ix(2), M+1) - 0.8));

x0 = pos_08;
T0 = linspace(It(1),It(2),N+1);
y0 = find(T0 == 0.5);



%Obtenemos el error.
aprox = W(x0,y0)
Error = abs(aprox-0.6)

%Instrucciones para generar la tabla.

T1 = linspace(It(1),It(2),N+1);
y1 = find(T1 == 10);
aMaxima = max(W(:,y1))
x1 = find(W(:,y1) == aMaxima);
PosX = X(x1)

Vol = trapz(X,W(:,y1)) %Se utiliza una funcion de MATLAB para integrar usando el metodo del trapecio.



%Primer tiempo para el cual la aproximacion excede el valor 5:


for j = 1:N+1
    
    Max = max(W(:,j));
    Min = min(W(:,j));
    if (Max > 5 || Min < -5)
    break
    end 
    j+1;
   
    
end




