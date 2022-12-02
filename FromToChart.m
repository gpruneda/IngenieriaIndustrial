function [ResumenFlujo,FTchart] = FromToChart(C,P,R,Ests,nEsts)

Componente=C';
Produccion=P';
Ruta=R';
ResumenFlujo=table(Componente,Produccion,Ruta);

FTchart=zeros(nEsts);
n = length(R);
for i=1:n%nos movemos entre los i componentes
    rutaTemp=char(R(i));
    rutaTemp=strrep(rutaTemp,' ','');
    %if length(rutaTemp)>1
        for j=1:length(rutaTemp)-1%-1 porque el ultimo no tiene con quien checar en j+1
            from=rutaTemp(j);
            to=rutaTemp(j+1);
            indexFrom=strfind(Ests,from);%en que posición esta from en el vector Ests, nos dara el renglon
            indexTo=strfind(Ests,to);% lo mismo, nos dara la columna
            FTchart(indexFrom,indexTo)= FTchart(indexFrom,indexTo) + P(i);%0+Lo que diga el vector P(i)
            j=j+1;
        end
    %end
    i=i+1;
end
end

        
%Estaciones en letras
%C=componente C=[1,2,3,4,5,6,7,8,9,10]
%P=Produccion P=[960,1200,720,2400,1800,480,2400,3000,960,1200] 
%OJO: Equivalencias
%R=Rutas R=["ABCDEF","ABCBEDCF","ABCDEF","ABCEBCF","ACEF","ABCDEF","ABDECBF","ABDECBF","ABCDF","ABDEF"]



