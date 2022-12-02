function [v,concl] = PetersonSilver(D)
%%%  PetersonSilver  %%%
% es una función que te devuelve el coeficiente de la regla de 
% Peterson-Silver para saber si la demanda es constante o variable.
% 
%%% Parametros %%%
%       D: El vector de los datos de la demanda.
%
%%% Resultado %%%
%       v: El coeficiente de la Regla de Peterson-Silver.
%        si v < 0.25 --> La demanda es contante, Usar EOQ.
%        si v >=0.25 --> La demanda es variable, usar Wagner.
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

