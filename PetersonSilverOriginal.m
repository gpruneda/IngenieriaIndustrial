function [v,concl] = PetersonSilverOriginal(D)

n=length(D);
 
num=0;
for i=1:n
    num=num+(D(i))^2;
end
num=num*n;
 
Den=0;
for i=1:n
    Den=Den+D(i);
end
Den=Den^2;
 
v=(num/Den)-1;

if v<0.25
    concl = sprintf('Demanda constante, se recomienda usar EOQ');
else
    concl = sprintf('Demanda variable, se recomienda usar Wagner');
 
end

