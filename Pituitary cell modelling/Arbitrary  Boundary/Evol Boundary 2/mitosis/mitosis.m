function [Fnewcell]=mitosis(mu,N,m,X,Y,tcurrent,tmit,Tstart,Inter_time)

%N is the new total no. of bodies
%m is the index of the parent
%X Y contain coordinates of all the N bodies. incl the new one
%tcurrent contains the present iteration step
%tmit keeps track of the stage of mitosis for the new cell.

%F gives the force acted upon on each body by the new cell

tprev=tcurrent-1; % coz we need the previous time steps' positions to get the current ones.
L0=2e-6;
R0=1e-6;%0.05; [m]
musis=mu*(tmit)/10;  % assuming that 10 is the time for mitosis 
Fnewcell=zeros(2,N);

for j=1:N % for each body

 MU=mu;
     if (j==m && tcurrent-(Tstart+Inter_time)<=10) %i.e. if j is the parent body
       MU=musis;    
     end
     
     %AKY, Can avoid passing the entire X,Y when only the (k-1)th is needed.
 rvect= [X(tprev,j)  Y(tprev,j)]-[X(tprev,N)  Y(tprev,N)];
 lenrvect=norm(rvect ,2);    
 lenrvect(lenrvect==0) = 1;
 
 if (lenrvect<4*R0)
     Fnewcell(1,j)= Fnewcell(1,j)+ MU*rvect(1)*(L0-norm(rvect,2))./lenrvect;
     Fnewcell(2,j)= Fnewcell(2,j)+ MU*rvect(2)*(L0-norm(rvect,2))./lenrvect;
 end
 
end

end