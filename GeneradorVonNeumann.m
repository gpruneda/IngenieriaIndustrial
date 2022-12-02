function Z1 = GeneradorVonNeumann(semilla)

Z=semilla^2;
Z=num2str(Z);
n=length(Z);
res=mod(n,4);
if res>0
    for j=1:4-res
        for i=n:-1:1
            Z(i+1)=Z(i);
            i=i-1;
        end
        Z(1)='0';
        j=j+1;
    end
end
Z1=extractBetween(Z,3,6);
Z1=str2double(Z1);
Z1=Z1/10^4;

end