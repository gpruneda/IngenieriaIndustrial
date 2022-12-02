function [Ests,nEsts] = NumEstaciones(R)
%R en letras R=["ABCDEF","ABCBEDCF","ABCDEF","ABCEBCF","ACEF","ABCDEF","ABDECBF","ABDECBF","ABCDF","ABDEF"]

n = length(R);
Ests = '';
ruta1=char(R(1));
Ests(1)=ruta1(1);
nEsts=1;
for i=1:n
    rutaTemp=char(R(i));
    for j=1:length(rutaTemp)
            if ~contains(Ests,rutaTemp(j))
                nEsts=nEsts+1;
                Ests(nEsts)=rutaTemp(j);
            end
        j=j+1;
    end
    i=i+1;
end
Ests=sort(Ests);
end

