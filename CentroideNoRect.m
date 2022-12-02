function [Mx,My,Centroide] = CentroideNoRect(numEsts,Equis,Yes,Ar)

k=length(numEsts);
Mx=0;
My=0;
Centroide=[0,0];
for i=1:k
    Mx=Mx+(((Equis(i,2)^2)-(Equis(i,1)^2))/2)*(Yes(i,2)-Yes(i,1));
    My=My+(((Yes(i,2)^2)-(Yes(i,1)^2))/2)*(Equis(i,2)-Equis(i,1));
    i=i+1;
end
Centroide=[Mx/Ar,My/Ar];
end

%Ests --> aqui representa el numero de bloques regulares en el que divides la
%superficie irregular
%Ar --> lo obtienes con CalculoAreas para saber el area total de la
%superficie irregural

    