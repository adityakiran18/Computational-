function  [sum] = sumofpow(x)

int x;
sum=0;

while x>=1
    
sum=sum+ (rem(x,10))^5;
x=floor(x/10);
    
end


end
