%-------------------------------------------------------------------------
% Programmed by Asad Ali
% Graduate Student, Faculty of Computer Science & Engineering
% GIK Institute of Engineering Sciences & Technology
% Pakistan.
% email :-  asad_82@yahoo.com
% August 2006.
%-------------------------------------------------------------------------

function [sp_x] = affine_contour_trace(BW,row,col,xx1,yy1)


% Contour Tracing of a Black White Image (Binary Image).
%
% This function takes as input an image having white background and black 
% foreground and traces the entire contour and returns the row and column
% coordinate values of all the points which lie on the contour
%
% This can be used in Line Following Algorithms and for parameterizing 
% affine distorted contours. 
%
% Syntax : 
% cpixels = affine_contour_trace(BW,r,c,xx1,yy1)
%
%   Input :
%   BW - Black & White Image (Binary Image).
%   row,col - row, column value of a single pixel on the contour, serves as
%             the starting point of parameterization
%   xx1,yy1 - listing of all the boundary points of the object obtained  
%             using the command:  [xx1,yy1,p] = find(originalImage);
%
%
%   Output : 
%   sp_x  - N x 2 matrix which stores the coordinate values of the contour,
%           column1 gives the rows & column2 the corresponding column.
% 
%   See the SampleUsage file for an example 

xx = xx1; yy = yy1;
k=1;loop=0;
C(1:size(BW,1),1:size(BW,2))=255;      
sp_x(1,1)=row; sp_x(1,2)=col;
C(row,col) = 0;

while(1)
    xxTemp = xx; yyTemp = yy;
    prev_size=size(sp_x,1);

    % check the central pixel
    if BW(sp_x(k,1),sp_x(k,2)) < 255
        index = 0;
        % extract the coordinates of active neighbours in 3x3 + a padded
        % area
        if BW(sp_x(k,1),sp_x(k,2)-1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1);  neighbours(index,2) = sp_x(k,2)-1; %0,-1
        end

        if BW(sp_x(k,1),sp_x(k,2)+1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1);  neighbours(index,2) = sp_x(k,2)+1; %0,+1
        end

        if BW(sp_x(k,1)-1,sp_x(k,2)) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)-1;  neighbours(index,2) = sp_x(k,2); %-1,0
        end

        if BW(sp_x(k,1)+1,sp_x(k,2)) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)+1;  neighbours(index,2) = sp_x(k,2); %+1,0
        end

        if BW(sp_x(k,1)-1,sp_x(k,2)-1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)-1;  neighbours(index,2) = sp_x(k,2)-1; %-1,-1
        end

        if BW(sp_x(k,1)-1,sp_x(k,2)+1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)-1;  neighbours(index,2) = sp_x(k,2)+1; %-1,+1
        end

        if BW(sp_x(k,1)+1,sp_x(k,2)-1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)+1;  neighbours(index,2) = sp_x(k,2)-1; %+1,-1
        end
        
        if BW(sp_x(k,1)+1,sp_x(k,2)+1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)+1;  neighbours(index,2) = sp_x(k,2)+1; %+1,+1        
        end
        
        %neighbours that are two pixels away but have priority
        if BW(sp_x(k,1),sp_x(k,2)-2) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1);  neighbours(index,2) = sp_x(k,2)-2; %0,-2        
        end

        if BW(sp_x(k,1),sp_x(k,2)+2) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1);  neighbours(index,2) = sp_x(k,2)+2; %0,+2        
        end
        
        if BW(sp_x(k,1)-2,sp_x(k,2)) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)-2;  neighbours(index,2) = sp_x(k,2); %-2,0        
        end
        
        if BW(sp_x(k,1)+2,sp_x(k,2)) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)+2;  neighbours(index,2) = sp_x(k,2); %+2,0        
        end

        if BW(sp_x(k,1)-2,sp_x(k,2)-1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)-2;  neighbours(index,2) = sp_x(k,2)-1; %-2,-1        
        end

        if BW(sp_x(k,1)-2,sp_x(k,2)+1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)-2;  neighbours(index,2) = sp_x(k,2)+1; %-2,+1        
        end
        
        if BW(sp_x(k,1)+2,sp_x(k,2)-1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)+2;  neighbours(index,2) = sp_x(k,2)-1; %+2,-1        
        end

        if BW(sp_x(k,1)+2,sp_x(k,2)+1) < 255
            index = index + 1;
            neighbours(index,1) = sp_x(k,1)+2;  neighbours(index,2) = sp_x(k,2)+1; %+2,+1        
        end
        
        % add the coordinates which are unique in priority order
        for i=1:index
            if (C(neighbours(i,1),neighbours(i,2))~=0)
                sp_x(k+1,1) = neighbours(i,1);
                sp_x(k+1,2) = neighbours(i,2);                
                k = k+1;
                C(neighbours(i,1),neighbours(i,2)) = 0;
                break; 
            end
        end
    
    end % end of if

    curr_size=size(sp_x,1);
    if curr_size == prev_size
          %-----------------------
          % find unique points
            index = 1; newX = 0; newY = 0;
            for i=1:size(sp_x,1)
                pX = sp_x(i,1); pY = sp_x(i,2);
                count = 0;
                for j=1:size(sp_x,1)
                    if pX == sp_x(j,1) && pY == sp_x(j,2)
                        count = count + 1;
                        if count > 1
                           sp_x(j,1) = -1; sp_x(j,2) = -1;   
                        end
                    end
                end
                if pX ~= -1 && pY ~= -1
                    newX(index) = pX; newY(index) = pY;
                    index = index + 1;
                end    
            end
            clear sp_x;
            sp_x(:,1) = newX'; sp_x(:,2) = newY';
            curr_size=size(sp_x,1); k = size(sp_x,1);
            %------------------------       
          
          if (curr_size + 0) < size(xx,1)            
              % retry to get the boundary
              for i=1:size(xx,1)
                  cX = xxTemp(i);  cY = yyTemp(i);
                  for j=1:size(sp_x,1)
                       if cX == sp_x(j,1) && cY == sp_x(j,2) 
                           xxTemp(i) = 1000; yyTemp(i) = 1000;
                           break;
                       end
                  end
              end
              
              distX = abs(xxTemp - sp_x(k,1));
              distY = abs(yyTemp - sp_x(k,2));
              tDist = abs(distX + distY);           
              minT = tDist(1);
              rIndex = 1;
              for i=1:size(distX,1)
                  if minT > tDist(i)
                        rIndex = i;
                        minT = tDist(i);
                  end          
              end
              sp_x(k+1,1) = xxTemp(rIndex);
              sp_x(k+1,2) = yyTemp(rIndex);                
              k = k+1;             
          else
            break;
        end
    end
    
    neighbours = 0;
end % end of while









