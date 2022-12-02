function [Valores,Resp] = BrownGibson(Nombres,MatObjet,MatSubj,W,MatCrit,alpha)
%BrownGibson es una funcion que te devuelve una tabla con los valores
%finales Objetivos, Subjetivos y Criticos, además de la Localización
%optima.
%
%   Copiar y pegar en CommandWindow
%         [Valores,Resp] = BrownGibson(Nombres,MatObjet,MatSubj,W,MatCrit,alpha)
%
%Parametros:
%Nombres: Un vector en forma de columna con el número de posibles
%localizaciones.
%        Codigo:    Nombres=["A","B","C"]
%MatObjet: Son los costos objetivos
%               Localizacion  C1  C2  C3
%                   A         3.2 9.1 10.7
%                   B         3.8 9.7 10.3
%                   C         3.9 8.9 11.8
%        Codigo:     MatObjet=[3.2,9.1,10.7;3.8,9.7,10.3;3.9,8.9,11.8]
%MatSubjt: Son los valores subjetivos
%        Codigo: Igual que en la MatObjet
%W: son los pesos, deben estar con decimal, si el ejercicio dice que el peso
%es 40, se pone 0.4
%        Codigo:     W=[0.2,0.4,0.4]
%MatCrit: metes todos los valores criticos en filas ejemplo,si el primero es
%               Localizacion FC1 FC2 FC3
%                   A         1   0   0
%                   B         0   1   1
%                   C         1   1   1 
%        Codigo: MatCrit=[1,0,1;0,1,1;0,1,1]
% Los metes por factores, no por localizaciones
%alpha: Un valor que te da el problema.valor entre 0 y 1.


n=length(Nombres);

for i=1:n
    Localizaciones(i)=i;
    i=i+1;
end
Localizaciones=Localizaciones';
m=length(W);
MatCrit=MatCrit';
c=length(MatCrit(1,:));

Suma=0;

for i=1:n
    Suma(i)=sum(MatObjet(i,:));
    i=i+1;
end
Max=max(Suma(1,:));
Min=min(Suma(1,:));

for i=1:n
    OFM(i)=(Max-Suma(i))/(Max-Min);
    i=i+1;
end

SFM=zeros(1,n);
for i=1:n
    for j=1:m
        SFM(i)=SFM(i)+MatSubj(i,j)*W(j);
        j=j+1;
    end
    i=i+1;
end

if c>1
    FCM=ones(n,1);
    for i=1:n
        for j=1:c-1
            FCM(i)=FCM(i)*MatCrit(i,j)*MatCrit(i,j+1);
            j=j+1;
        end
    end
else
    FCM=MatCrit;
end

for i=1:n
    LMi(i)=FCM(i)*(alpha*OFM(i)+(1-alpha)*SFM(i));
    i=i+1;
end

OFM=OFM';
SFM=SFM';
LMi=LMi';
LocF=max(LMi);
LocalizacionOptima=find(LMi==LocF);
Localizaciones=Nombres';
Valores=table(Localizaciones,OFM,SFM,FCM,LMi);

Resp = sprintf('Por lo tanto la mejor localización con el método Brown-Gibson es %s',Nombres(LocalizacionOptima));

end



