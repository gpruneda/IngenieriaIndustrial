function [Costos,RespEu,RespRec] = DistDesdeEsts(Nombres,Equis,Yes,Demanda)
%       Nombres=["A";"B";"C"]
%       Equis=[100;400;100]
%       Yes=[200;100;100]
%       Demanda=[8;4;3]
CostoTotEu=0;
CostoTotRec=0;
DistEu=0;
DistRec=0;
DistTotEu=0;
DistTotRec=0;

n=length(Nombres);

for i=1:n
    for j=1:n
    DistEu(j)=sqrt((Equis(i)-Equis(j))^2+(Yes(i)-Yes(j))^2);
    CostoEu(j)=DistEu(j)*Demanda(j);
    DistRec(j)=abs(Equis(i)-Equis(j))+abs(Yes(i)-Yes(j));
    CostoRec(j)=DistRec(j)*Demanda(j);
    j=j+1;
    end
    CostoTotEu(i)=sum(CostoEu);
    CostoTotRec(i)=sum(CostoRec);
    DistTotEu(i)=sum(DistEu);
    DistTotRec(i)=sum(DistRec);
end

CostoTotEu=CostoTotEu';
CostoTotRec=CostoTotRec';
DistTotEu=DistTotEu';
DistTotRec=DistTotRec';

LocalizacionOptimaEu=find(CostoTotEu==min(CostoTotEu));
LocalizacionOptimaRec=find(CostoTotRec==min(CostoTotRec));

Costos=table(Nombres,DistTotEu,CostoTotEu,DistTotRec,CostoTotRec);
RespEu = sprintf('Por lo tanto la mejor localización con el método Euclideano es %s',Nombres(LocalizacionOptimaEu));
RespRec = sprintf('Por lo tanto la mejor localización con el método Rectilineo es %s',Nombres(LocalizacionOptimaRec));


end