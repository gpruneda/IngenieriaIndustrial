function [ps,resp] = ReglaPetersonSilverN3(Demanda)
cont=length(Demanda);
numerador=0;
Denominador=0;
for i=1:cont   
    numerador=numerador+(Demanda(i))^2;
end
for i=1:cont
Denominador=Denominador+Demanda(i);
end

numerador=numerador*cont;
Denominador=Denominador^2;
ps=(numerador/Denominador)-1;

if ps<0.25
    resp = sprintf('Usar EOQ');
else
    resp = sprintf('Usar Wagner');
end
