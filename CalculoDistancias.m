function [fpIndividual,fpTotal] = CalculoDistancias(flowChartL,R,Ests)
%Estaciones en letra
%
%Entradas
%
%   flowChartL --> FlowPathLineal
%   R          --> Rutas R=["ABCDE","ACED"]
%   Ests       --> Estaciones Ests=['ABCDE'] (Estaciones2)
%
%Salidas
%
%   fpIndividual  --> Tabla con 2 columnas
%           "Ruta"          "DistaciaTot"
%       rutas actuales   Distancia recorrida en la ruta
%   fpTotal       --> Suma de las distancias de todas las rutas
n = length(R);
D=zeros(1,n);
for i=1:n
    rutaTemp=char(R(i));
    for j=1:length(rutaTemp)-1
        from=rutaTemp(j);
        to=rutaTemp(j+1);
        indexFrom=strfind(Ests,from);
        indexTo=strfind(Ests,to);
        D(i)=D(i)+flowChartL(indexFrom,indexTo);
        j=j+1;
    end
    i=i+1;
end

Ruta=R';
DistanciaTot=D';
fpIndividual=table(Ruta,DistanciaTot);
fpTotal=sum(D);
end


    
