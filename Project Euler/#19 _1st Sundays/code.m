
cnt=0;
for N=1901:2000
    
 x=rem(1+rem(N,100)+  floor(rem(N,100)/4)+ 6*floor(N/2000),7);
 
 if ((rem(N,4) ==0&&rem(N,400) ==0)||(rem(N,4) ==0&&rem(N,100)~=0))
     leap=-1;
 else
     leap=0;
 end
 
 
 
 
        if rem(x+1+leap,7)==1
            cnt=cnt+1;
        end

         if rem(x+4+leap,7)==1
            cnt=cnt+1;
         end
         
         if rem(x+4,7)==1
            cnt=cnt+1;
         end
     
         if rem(x+0,7)==1
            cnt=cnt+1;
         end
         
         if rem(x+2,7)==1
            cnt=cnt+1;
         end
    
          if rem(x+5,7)==1
            cnt=cnt+1;
          end
         
         if rem(x+0,7)==1
            cnt=cnt+1;
         end
         
         if rem(x+3,7)==1
            cnt=cnt+1;
         end
         
         if rem(x+6,7)==1
            cnt=cnt+1;
         end
         
         if rem(x+1,7)==1
            cnt=cnt+1;
         end
         
         if rem(x+4,7)==1
            cnt=cnt+1;
         end
         
         if rem(x+6,7)==1
            cnt=cnt+1;
         end
         
         
end
 
     
       

 
   
     
     
     %-------------------------------------
 
 if ((rem(N,4) ==0&&rem(N,400) ==0)||(rem(N,4) ==0&&rem(N,100)~=0))
    %Leap year
     if x==2
         cnt=cnt+1;
     fprintf('\n%g',N);
     end

     
 else

    %Not a Leap year     
     if x==1
         cnt=cnt+1;
     fprintf('\n%g',N);
     end
     
 end
    
end

disp(cnt)