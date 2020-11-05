%Animacion de la ecuacion de transporte.

clear all; 
close all; 
clc;

%Definimos variables

G = @(x) U0 (x)
Ix = [-1,1];
It = [0,10];
M = 40;
N = 400;

%Metodo deseado

W = m_transp_LF(G, 2, Ix,It,M,N);

%Animacion
solEx = @(x,t) sol_e(x,t);
    gridSpace = linspace(Ix(1), Ix(2), M+1);
    TimeGrid = linspace(It(1), It(2), N+1);
    DeltaTime = (It(2) - It(1))/N;
    minY = min( solEx(gridSpace, 0) ) - 1;
    maxY = max( solEx(gridSpace, 0) ) + 1;
   for i = 1:N
       plot(gridSpace,solEx(gridSpace, (i-1)*DeltaTime), gridSpace, W(:,i),'--rs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
        axis([Ix(1) Ix(2) minY maxY]);
        pause(0.1);
   end 