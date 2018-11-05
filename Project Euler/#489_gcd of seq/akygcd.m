function  [G] = akygcd(x,y)

if (x<y)
 z=x;
 x=y;
 y=z;
end

r=mod(x,y);

if (r==0)
G=y;
return
end


G=akygcd(y,r);

end
