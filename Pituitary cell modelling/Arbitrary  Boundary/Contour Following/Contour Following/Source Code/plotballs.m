%-----------------------for plotting the balls
        t=-pi:0.01:pi;
        grid on;
        %randcol=perms([1,1,0]);
        randcol=[1 0 1; 1 0 0; 0 1 0; 0 0 0; 0 0 1; 1 1 0];
        
        for k=1:Ts
            for i=1:N0
            axis([leftb-R0 rightb+R0 downb-R0 upb+R0]);
            grid on
            %plot(X(k,i)+R0*cos(t),Y(k,i)+R0*sin(t),'red');
            %plot(X(k,i)+R0*cos(t),Y(k,i)+R0*sin(t),'color',rand(1,3));
            plot(X(k,i)+R0*cos(t),Y(k,i)+R0*sin(t),'color',randcol(mod(i,N0+1),:),'linewidth',5);
            hold on;
            end
        pause(0.50);
        hold off;   
        end
%-----------------------for plotting the balls