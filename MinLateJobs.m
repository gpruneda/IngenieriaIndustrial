function [Fbar, Makespan, WIP, MaxL, LateJobs] = MinLateJobs(A)
%%%  MinLateJobs  %%%
% Es una función que te devuelve el tiempo de flujo promedio, WIP, makespan,
% máxima tardanza y número de trabajos entregados tarde. Programado para 
% minimizar el tiempo de flujo sujeto a que el retraso máximo sea cero.
% Este código sigue el algoritmo para ordenar la secuencia. 
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


Pos=filas;
Ordenada=A;
i=1;
while i<=filas   
    Tau=sum(A(:,2));
    index=find(A(:,3)>=Tau);
    if index ~= 0 
        Mayores=[A(index,2)];
        MaxG=max(Mayores);
        index=find(Ordenada(:,2)==MaxG);
        indexA=find(A(:,2)==MaxG);
        Ordenada([index Pos],:)=Ordenada([Pos index],:);
        A(indexA,:)=0;
        Pos=Pos-1;
        i=i+1;
    else
        Indices=find(A(:,1)>0);
        NumRest=numel(Indices);
        for j=1:NumRest
            A=sortrows(A,3, 'descend');
            Ordenada(Pos,:)=A(1,:);
            A(1,:)=0;
            Pos=Pos-1;
            j=j+1;
        end
        i=i+NumRest;
    end    
end

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