N0=6; %No.of bodies
Ts=50; %time steps
dt=0.05;
R0=1e-1;%0.05;
L0=2e-6;
eta=1;
mu=1;
%dragc=6*pi*eta*R0;
%k=1e-11;
X=zeros(Ts,N0); %X-coord of the N0 bodies at all the time steps
Y=zeros(Ts,N0); %Y-coord of the N0 bodies at all the time steps

% initx=[0.3922    0.6555    0.1712    0.7060    0.0318    0.2769    0.0462    0.0971    0.8235    0.6948    0.3171    0.9502    0.0344    0.4387    0.6928];
% inity=[0.5853    0.5497    0.9172    0.2858    0.7572    0.7537    0.3804    0.5678    0.0759    0.0540    0.5308    0.7792    0.9340    0.1299    0.5688];
% X(1,:)=initx(1:N0); %x-coordinates for the starting positions
% Y(1,:)=inity(1:N0); %y-coordinates for the starting positions

% X(1,:)=4*rand(N0,1)-2;
% Y(1,:)=4*rand(N0,1)-2;
X(1,:)=rand(N0,1);
Y(1,:)=rand(N0,1);


rvect=zeros(1,2); % just a temp vector
Force=zeros(2,N0); % stores the Force [F1  F2  F3...] at each time step.
r=zeros(N0,N0,2);  % is the difference matrix..contains [dx and dy]

for k=2:Ts  %for time steps

xk=X(k-1,:); %Storing X(k-1) into a dummy row vector xk to do the repmat thing
yk=Y(k-1,:);%Storing Y(k-1) into a dummy row vector yk to do the repmat thing

r(:,:,1)=repmat(xk,N0,1)-repmat(xk,N0,1)'; % this the X1-X2 difference matrix
r(:,:,2)=repmat(yk,N0,1)-repmat(yk,N0,1)'; % this the Y1-Y2 difference matrix
    
    
    for i=1:N0 %loop for each body i
        F=zeros(1,2); % resets F for each body
        
            %interactions of ith body with all the bodies------------
            for j=1: N0  
                rvect(1,1:2)=r(i,j,1:2);
                F=F+mu*rvect*(L0-norm(rvect,2));
            end
            %---------------------------   
    
    
    Force(:,i)=F; %Stores the computed force F into F(i)
    end %---------------------------   
    

    X(k,:)=X(k-1,:)+ Force(1,:)*dt/(eta);
    Y(k,:)=Y(k-1,:)+ Force(2,:)*dt/(eta);
    

    %With Boundary conditions
        xnew=X(k,:);
        ynew=Y(k,:);
    
        %I'm using Boolean variables instead of IF
        xnew=(xnew>2).*(4-xnew)  +   (xnew<=2).*xnew; %ensures all x<2 
        xnew=(xnew<-2).*(-4-xnew)+ (xnew>=-2).*xnew;  %ensures all x>-2
        
        ynew=(ynew>2).*(4-ynew)+ (ynew<=2).*ynew;   %ensures all y<2
        ynew=(ynew<-2).*(-4-ynew)+(ynew>=-2).*ynew;  %ensures all y>-2
    
        
        X(k,:)=xnew;
        Y(k,:)=ynew;

    
    
end

%-----------------------for plotting the balls
        t=-pi:0.01:pi;
        grid on;
        randcol=[1 0 1; 1 0 0; 0 1 0; 0 0 0; 0 0 1; 1 1 0];
        
        for k=1:Ts
            for i=1:N0
            axis([-2-R0 2+R0 -2-R0 2+R0]);
            grid on
            %plot(X(k,i)+R0*cos(t),Y(k,i)+R0*sin(t),'red');
            %plot(X(k,i)+R0*cos(t),Y(k,i)+R0*sin(t),'color',rand(1,3));
            plot(X(k,i)+R0*cos(t),Y(k,i)+R0*sin(t),'color',randcol(mod(i,N0+1),:),'linewidth',15);
            hold on;
            end
        pause(0.50);
        hold off;
        end
%-----------------------for plotting the balls
