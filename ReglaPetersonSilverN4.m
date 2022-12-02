function [ps,resp] = ReglaPetersonSilverN4(Demanda)
cont=length(Demanda); 
numerador=0;
denominador=0;

for i=1:cont
    numerador=numerador+(Demanda(i))^2;
    denominador=denominador+Demanda(i);
end

ps=((numerador*cont)/(denominador^2))-1;

if ps<0.25
    resp = sprintf('Usar EOQ');
else
    resp = sprintf('Usar Wagner');
end
