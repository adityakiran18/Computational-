function  [sum] = sumoffact(x)

int x;
sum=0;

while x>=1
    
sum=sum+ factorial(rem(x,10));
x=floor(x/10);
    
end


end
