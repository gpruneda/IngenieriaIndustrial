function [LocX,LocY,CostoRecMin] = CostoRect(P,Equis,Yes,Peso)

n=length(P);
MitadDem=sum(Peso)/2;
Xs=Equis;
Ys=Yes;
acumX=0;
acumY=0;
coorx=0;
coory=0;
VectDem=Peso;

X=Equis';
Y=Yes';

while acumX<=MitadDem
    coorx=min(Xs);
    k=find(Xs==coorx);
    acumX=acumX+VectDem(k);
    Xs(k)=[];
    VectDem(k)=[];
end

VectDem=Peso;
while acumY<=MitadDem
    coory=min(Ys);
    k=find(Ys==coory);
    acumY=acumY+VectDem(k);
    Ys(k)=[];
    VectDem(k)=[];
end

LocX=coorx;
LocY=coory;

scatter(X,Y);

hold
scatter(LocX,LocY,'r');

CostoRecMin=0;
CostoRec=0;
for i=1:n
    DistRec(i)=abs(LocX-Equis(i))+abs(LocY-Yes(i));
    CostoRec(i)=DistRec(i)*Peso(i);
end 
CostoRecMin=sum(CostoRec);
end
    
%CostosEu es una funcion que devuelve el centro de gravedad con el metodo
%de las medianas
