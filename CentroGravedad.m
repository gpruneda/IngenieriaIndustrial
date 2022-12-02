function [CG,Costos,CostoEuTot,CostoRecTot] = CentroGravedad(P,Equis,Yes,Peso)
%Centro de gravedad regresa el Centro de gravedad y devuelve una tabla
%con las distancias tanto euclidianas como rectilineas y sus costos
%asociados. 
%       P=[1,2,3,4]
%       Equis=[60;80;100;40]
%       Yes=[70;60;30;20]
%       Peso=[7;10;8;12]

X=Equis';
Y=Yes';
sumaX=0;
sumaY=0;
DistEu=0;
DistRec=0;
CostoEu=0;
CostoRec=0;

DemTotal=sum(Peso);

n=length(P);
for i=1:n
    sumaX=sumaX+Equis(i)*Peso(i);
    sumaY=sumaY+Yes(i)*Peso(i);
end
CG(1)=sumaX/DemTotal;
CG(2)=sumaY/DemTotal;

for i=1:n
    DistEu(i)=sqrt((CG(1)-Equis(i))^2+(CG(2)-Yes(i))^2);
    CostoEu(i)=DistEu(i)*Peso(i);
    DistRec(i)=abs(CG(1)-Equis(i))+abs(CG(2)-Yes(i));
    CostoRec(i)=DistRec(i)*Peso(i);
end

CostoEuTot=sum(CostoEu);
CostoRecTot=sum(CostoRec);

CostoEu=CostoEu';
CostoRec=CostoRec';
DistEu=DistEu';
DistRec=DistRec';

P=P';
Costos=table(P,DistEu,CostoEu,DistRec,CostoRec);

scatter(X,Y)
hold
scatter(CG(1),CG(2),'r')

end

