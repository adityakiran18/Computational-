
function [MaxArr,PROD]=maximizer(Dig,size)


temprod=1;
%PROD=int64(1);
PROD=1;
MaxArr=zeros(size,1);
%USE LARGE VARIABLE FOR PROD AKY  
initptr=1;
 while (initptr<length(Dig)-size+1)

    %initptr=i;
    temprod=1;
    
    
    for k=0:size-1
        if  (Dig(initptr+k)==0)    
           temprod=temprod*Dig(initptr+k);
           %fprintf('\n breaks when initptr=%g, and breaks at %g',initptr,initptr+k);
           initptr=initptr+k+1;
        
           break    
        end
        
        temprod=temprod*Dig(initptr+k);
        
    end
    
     if  (k==size-1 && Dig(initptr+k)~=0)    
    Arr=Dig(initptr:initptr+size-1);
    %fprintf('\n\n Starting posi of non-zer str is at : %g',initptr);    
    %fprintf('\nCurrent non-zero string is %s',Arr);    
    %fprintf('\n Current value of product= %g',temprod);    
    
      if (temprod>PROD) 
      PROD=temprod;
      Arr=Dig(initptr:initptr+size-1);
      MaxArr=Arr;
    fprintf('\n Current Max String is:');
    Arr'
    fprintf('\n the max product is %g',PROD);
    
    fprintf('\n-------------------------');
      end
    
    initptr=initptr+1;
    end

    %fprintf('\nNext initptr position at %g',initptr);    
    


    % if (rem(initptr,100)==0)    
% fprintf('\n Status= %g percent',initptr/10);
% end

 end
 
%    MaxArr 
end


 

 
%  
%   ---------------------------------------------------
%    ---------------------------------------------------
%     ---------------------------------------------------
%  ---------------------------------------------------
 


% temprod=1;
% arr=zeros(1,4);
% PROD=1;
% 
% initptr=1;
%  while (initptr<997)
% 
%        
%     %initptr=i;
%     temprod=1;
%     
%     
%     for k=0:3
%         if  (str2double(Dig(initptr+k))==0)    
%            temprod=temprod*str2double(Dig(initptr+k));
%            initptr=initptr+k+4;
%            break    
%         end
%         
%         temprod=temprod*str2double(Dig(initptr+k));
%         
%     end
%     
%      
%     if (temprod>PROD &&(floor(initptr/50)==floor((initptr+3)/50)))
%     PROD=temprod;
%     Arr=Dig(initptr:initptr+3);
%       fprintf('\n Max at %g',initptr);    
%     end
% 
%      if  (k==3 && str2double(Dig(initptr+k))~=0)    
%          initptr=initptr+1;
%     end
% 
%     
%     
% if (rem(initptr,100)==0)    
% fprintf('\n Status= %g percent',initptr/10);
% end
%     
% end
% end
