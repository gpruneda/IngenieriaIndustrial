function [Resumen,Ar,MatDist] = CalculoAreas(numEsts,Equis,Yes)
%Entradas
%numEsts=[1,2,3,4,5]
%Equis=[6,10;6,10;4,6;0,6;0,4]
%Yes=[0,4;4,6;4,6;0,4;4,6]
%
%Salidas
%   tabla   --> te regresa una tabla con 4 columnas
%       "Estaciones" "Areas" "Xbarr" "Ybarr"
%                           Coordenadas del centroide
%   Ar      --> te regresa la suma de todas las areas
%   MatDist --> te regresa una matriz NxN con la distancia entre centroides

n=length(numEsts);
Areas=zeros(n,1);
Centroides=zeros(n,2);
MatDist=zeros(n);
for i=1:n
    Areas(i)=(Equis(i,2)-Equis(i,1))*(Yes(i,2)-Yes(i,1));
    Centroides(i,1)=(Equis(i,2)+Equis(i,1))/2;
    Centroides(i,2)=(Yes(i,2)+Yes(i,1))/2;
    i=i+1;
end
Estaciones=numEsts';
Xbarr=Centroides(:,1);
Ybarr=Centroides(:,2);
Resumen=table(Estaciones,Areas,Xbarr,Ybarr);
Ar=sum(Areas);

for i=1:n
    for j=1:n
        if j>i
            MatDist(i,j)=abs(Xbarr(i)-Xbarr(j))+abs(Ybarr(i)-Ybarr(j));
        end
        j=j+1;
    end
    i=i+1;
end

end

