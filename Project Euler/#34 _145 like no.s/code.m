

SUM=0;
N=10000;

for i=N:N*10

    if (i==sumoffact(i))
    fprintf('\n %g ',i);   
    SUM=SUM+i;
    end
    
    
if (rem(i,100)==0)    
fprintf('\n Status= %g out of %g',i,10*N);
end
    
end
