function  [val] = Gab(a,b)

%a=142;b=89;
%a=1;b=1;

vect=zeros(200,1);
for n = 1: 50000
  vect(n)=gcd(n^3+b, (n+a)^3+b);
end   

v=find(vect==max(vect));
val=v(1);




end
