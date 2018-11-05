function  [val,t] =Hmn(m,n)


sum=0;
t=zeros(m,n);
for i=1:m
    for j=1:n
        
     t(i,j)=Gab(i,j);
     sum=sum+t(i,j);
    end
end

val=sum;
end     