function [ LB, makespan ] = LowerBounds(A)
%%%  LowerBounds  %%%
% Es una función que te devuelve los lower bounds y el makespan en un  
% "problema del taller".
% 
%%% Parametros %%%
%       A: Una matriz de n x m.
%           Donde: n es el número de trabajos.
%                  m es el número de máquinas.
%
%%% Resultado %%%
%       LB: Un vector de 1 x m que dada la posición(i) del valor, te regresa 
%       el Lower Bound de la i-ésima máquina.
%       makespan: El tiempo mínimo en que se pueden completar los n
%       trabajos. (El valor máximo de los Lower Bounds)

[fila, columna]=size(A);
Scoli=0;
AcumPos=0;
AcumAnt=0;
for i=1:columna
    if i==1
        Col1=A(:,1);
        Scoli=sum(Col1);
        for j=1:fila
            AcumPos(j)=sum(A(j,i+1:columna));
            j=j+1;
        end
        LB(i)=Scoli+min(AcumPos);
    else
       if i==columna
           Coln=A(:,columna);
            Scoli=sum(Coln);
            for j=1:fila
                AcumAnt(j)=sum(A(j,1:columna-1));
                j=j+1;
            end
            LB(i)=Scoli+min(AcumAnt);
       else
            Coli=A(:,i);
            Scoli=sum(Coli);
            for j=1:fila
                AcumPos(j)=sum(A(j,i+1:columna));
                AcumAnt(j)=sum(A(j,1:i-1));
                j=j+1;
            end
            LB(i)=Scoli+min(AcumPos)+min(AcumAnt);
       end
    end
    makespan=max(LB);
end