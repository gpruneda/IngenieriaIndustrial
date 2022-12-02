function [Fbar, Makespan, WIP, MaxL, LateJobs] = MenorTiempoProcesamiento(A)
%%%  MenorTiempoProcesamiento  %%%
% Es una función que te devuelve el tiempo de flujo promedio, WIP, makespan,
% máxima tardanza y número de trabajos entregados tarde. Programado por el 
% tiempo de procesamiento más corto y usando solo una máquina.
% 
%%% Parametros %%%
%       A: Una matriz de n x 3.
%           Donde: n es el número de trabajos.
%                  Las columnas siguen la siguiente estructura:
%       Trabajo i | Tiempo de procesamiento (ti) | Tiempo de entrega (di)
%%% Resultado %%%
%       Fbar: tiempo de flujo promedio.
%       Makespan: Tiempo de terminación del último trabajo.
%       WIP: Work in Procces
%       MaxL: máxima tardanza
%       LateJobs: El número de trabajos entregados tarde. 

[filas, columnas]=size(A);
Ordenada=sortrows(A,2);
Ci=[Ordenada(:,1) zeros(1,filas)'];
Li=zeros(1,filas)';
Ti=zeros(1,filas)';
Acum=0;
for i=1:filas
    if i==1
        Acum=Ordenada(i,2);
        Ci(i,2)=Acum;
        i=i+1;
    else
        Acum=Acum+Ordenada(i,2);
        Ci(i,2)=Acum;
        i=i+1;
    end
end
Fbar=sum(Ci(:,2))/filas;
Makespan=Acum;
WIP=sum(Ci(:,2))/Makespan;
Li=Ci(:,2)-Ordenada(:,3);
MaxL=max(Li);
LateJobs=0;
for i=1:filas
    if Li(i)<=0
        Ti(i)=0;
        i=i+1;
    else
        Ti(i)=Li(i);
        i=i+1;
        LateJobs=LateJobs+1;
    end
end   
end