function [vaN,hist,parametros] = VaNormalSumUnif(Media,Varianza,H)
vaN=zeros(H,1);
for i=1:H
    uniformes=rand(12,1);
    va=sum(uniformes)-6;
    vaN(i)=Media+Varianza*va;
end
hist=histfit(vaN);
parametros=fitdist(vaN,'Normal');
end



