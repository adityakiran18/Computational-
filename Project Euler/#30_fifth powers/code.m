

SUM=0;
N=10000;

for i=5*N:10*N

    if (i==sumofpow(i))
    fprintf('\n %g ',i);   
    SUM=SUM+i;
    end
    
    
if (rem(i,1000)==0)    
fprintf('\n Status= %g out of %g',i,10*N);
end
    
end
