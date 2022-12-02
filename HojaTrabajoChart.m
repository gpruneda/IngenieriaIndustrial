function HojaTrabajo = HojaTrabajoChart(RelChart)

%RelChart(1,:)=' EOIOUU';
%RelChart(2,:)='  UEIIU';
%RelChart(3,:)='   UUOU';
%RelChart(4,:)='    IUU';
%RelChart(5,:)='     AI';
%RelChart(6,:)='      E';
%RelChart(7,:)='       ';

n=length(RelChart(1,:));
HojaTrabajo=string(zeros(6,n));
cadena='AEIOUX';

for i=1:n
    for j=1:n
        if RelChart(i,j)~= ' '
            valor=RelChart(i,j);
            renglon=strfind(cadena,valor);
            if HojaTrabajo(renglon,i) == "0"
                 HojaTrabajo(renglon,i)=int2str(j);
            else
                HojaTrabajo(renglon,i)=strcat(HojaTrabajo(renglon,i),',',' ',int2str(j));
            end
            if HojaTrabajo(renglon,j) == "0"
                HojaTrabajo(renglon,j)=int2str(i);
            else
                HojaTrabajo(renglon,j)=strcat(HojaTrabajo(renglon,j),',',' ',int2str(i));
            end
        end
    end
end

end
