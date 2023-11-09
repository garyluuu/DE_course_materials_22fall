clear;clc;clf

h=[0.5,0.25,0.125,0.01]; %step

er_global=zeros(1,4);
subplot(1,2,1) 
for j=1:4
    t=0:h(j):10;
    x=ones(1,length(t));
    f=ones(1,length(t));
    x(1)=-1;
    
    % Explicit Soln
    xe=-0.5*cos(t)+0.5*sin(t)-0.5*exp(-t);

    % RK4
    i=1;
    while(t(i)<=10)
        f1(i)=sin(t(i))-x(i);
        f2(i)=sin(t(i)+h(j)/2)-(x(i)+h(j)*f1(i)/2);
        f3(i)=sin(t(i)+h(j)/2)-(x(i)+h(j)*f2(i)/2);
        f4(i)=sin(t(i)+h(j))-(x(i)+h(j)*f3(i));
        if i==length(t)
            break
        end
        x(i+1)=x(i)+h(j)*(f1(i)+2*f2(i)+2*f3(i)+f4(i))/6;
        i=i+1;
    end
    plot(t,x)
    hold on

%     % Heun's Method
%     i=1;
%     while(t(i)<=10)
%         f(i)=sin(t(i))-x(i);
%         if i==length(t)
%             break
%         end
%         x(i+1)=x(i)+f(i)*h(j);
%         f(i+1)=sin(t(i+1))-x(i+1);
%         x(i+1)=x(i)+(f(i)+f(i+1))*h(j)/2;
%         i=i+1;
%     end
%     plot(t,x)
%     hold on

%     % Euler Method
%     i=1;
%     while(t(i)<=10)
%         f(i)=sin(t(i))-x(i);
%         if i==length(t)
%             break
%         end
%         x(i+1)=x(i)+f(i)*h(j);
%         i=i+1;
%     end
%      plot(t,x)
%      hold on
    
    %overall error
    for k=1:length(t)
        er_local(k)=abs(xe(k)-x(k));
        er_global(j)=er_global(j)+er_local(k);
    end
end

% Plot Explicit Soln
plot(t,xe)

legend('delta_t=0.5','delta_t=0.25','delta_t=0.125','delta_t=0.01','explicit','interpreter','none')
title('plot of explicit soln and numerical soln in different time steps')

subplot(1,2,2)
plot(h,er_global) %plot of global error
title('plot of global error','interpreter','none')
xlabel('length of the time step')
ylabel('global error')