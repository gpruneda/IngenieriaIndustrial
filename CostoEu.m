function [CGEu,CostoEuMin] = CostoEu(CG,Equis,Yes,Peso)

X=Equis';
Y=Yes';
scatter(X,Y)

n=length(Peso);
sumaX=0;
sumaY=0;
sumaW=0;
error=0;

for i=1:n
    DistEu(i)=sqrt((CG(1)-Equis(i))^2+(CG(2)-Yes(i))^2);
    sumaX=sumaX+(Equis(i)*Peso(i)/DistEu(i));
    sumaY=sumaY+(Yes(i)*Peso(i)/DistEu(i));
    sumaW=sumaW+(Peso(i)/DistEu(i));
end
Xn=sumaX/sumaW;
Yn=sumaY/sumaW;
error=abs(Xn-CG(1))+abs(Yn-CG(2));

while error >= 0.00001
   CG(1)=Xn;
   CG(2)=Yn;
   for i=1:n
    DistEu(i)=sqrt((CG(1)-Equis(i))^2+(CG(2)-Yes(i))^2);
    sumaX=sumaX+(Equis(i)*Peso(i)/DistEu(i));
    sumaY=sumaY+(Yes(i)*Peso(i)/DistEu(i));
    sumaW=sumaW+(Peso(i)/DistEu(i));
end
Xn=sumaX/sumaW;
Yn=sumaY/sumaW;
error=abs(Xn-CG(1))+abs(Yn-CG(2));

end

CGEu(1)=Xn;
CGEu(2)=Yn;
hold
scatter(CGEu(1),CGEu(2),'r');

CostoEu=0;
for i=1:n
    DistEu(i)=sqrt((CGEu(1)-Equis(i))^2+(CGEu(2)-Yes(i))^2);
    CostoEu(i)=DistEu(i)*Peso(i);
end
CostoEuMin=sum(CostoEu);

end

%CostosEu es una funcion que devuelve el centro de gravedad con el metodo
%Weisfeld
%Parámetros:    CG es el centro de gravedad que devuelve la función
%CentroGravedad
%               Demanda: el peso