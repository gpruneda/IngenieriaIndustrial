function [v] = PetersonSilverVect(D)
n=length(D);
num=n*sum(D.^2);
den=sum(D)^2;
v=(num/den)-1;
end

