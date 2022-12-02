function betChart = BetweenChart(FTchart)
trans=FTchart';
Completa=FTchart+trans;
betChart=triu(Completa);
end
%FromToChart 

