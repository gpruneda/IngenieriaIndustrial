function NumAl = GeneradorVonNeumannHorizonte(semilla,H)
NumAl=zeros(H,1);
for i=1:H
    NumAl(i)=GeneradorVonNeumann(semilla);
    semilla=GeneradorVonNeumann(semilla)*10^4;
    i=i+1;
end

