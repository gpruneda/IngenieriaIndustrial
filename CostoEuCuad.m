function [CGEuCuad,CostoEuCuadMin] = CostoEuCuad(CG,Equis,Yes,Demanda)
%CostosEu es una funcion que devuelve el centro de gravedad con el metodo
%Weisfeld
%Parámetros:    CG es el centro de gravedad que devuelve la función
%CentroGravedad
X=Equis';
Y=Yes';
scatter(X,Y)

n=length(Demanda);
sumaX=0;
sumaY=0;
sumaW=0;
error=0;

for i=1:n
    DistEu(i)=(CG(1)-Equis(i))^2+(CG(2)-Yes(i))^2;
    sumaX=sumaX+(Equis(i)*Demanda(i)/DistEu(i));
    sumaY=sumaY+(Yes(i)*Demanda(i)/DistEu(i));
    sumaW=sumaW+(Demanda(i)/DistEu(i));
end
Xn=sumaX/sumaW;
Yn=sumaY/sumaW;
error=abs(Xn-CG(1))+abs(Yn-CG(2));

while error >= 0.00001
   CG(1)=Xn;
   CG(2)=Yn;
   for i=1:n
    DistEu(i)=(CG(1)-Equis(i))^2+(CG(2)-Yes(i))^2;
    sumaX=sumaX+(Equis(i)*Demanda(i)/DistEu(i));
    sumaY=sumaY+(Yes(i)*Demanda(i)/DistEu(i));
    sumaW=sumaW+(Demanda(i)/DistEu(i));
end
Xn=sumaX/sumaW;
Yn=sumaY/sumaW;
error=abs(Xn-CG(1))+abs(Yn-CG(2));

end

CGEuCuad(1)=Xn;
CGEuCuad(2)=Yn;
hold
scatter(CGEuCuad(1),CGEuCuad(2),'r');

CostoEu=0;
for i=1:n
    DistEu(i)=(CGEuCuad(1)-Equis(i))^2+(CGEuCuad(2)-Yes(i))^2;
    CostoEu(i)=DistEu(i)*Demanda(i);
end
CostoEuCuadMin=sum(CostoEu);


end