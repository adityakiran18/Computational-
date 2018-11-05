function  [sum] = sumofdiv(x)

int x;

sum=0;


for i=1:floor(x/2)+2

if (rem(x,i)==0)
    
    
    sum=sum+i;
end


end
