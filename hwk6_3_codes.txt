clear;clc;clf

t=0:0.1:1;
tt=0:0.2:1;
h=t(2)-t(1); %step
x=ones(1,length(t));
y=ones(1,length(t));
fx=ones(1,length(t));
fy=ones(1,length(t));
x(1)=1;
y(1)=1;
i=1;

hold on

% Euler Method
while(t(i)<=1)
    fx(i)=-t(i)*x(i)-y(i)-1;
    fy(i)=x(i);
    if i==length(t)
        break
    end
    x(i+1)=x(i)+fx(i)*h;
    y(i+1)=y(i)+fy(i)*h;
    i=i+1;
end
for i=1:length(tt)
    xx(i)=x(2*i-1);
end
plot(tt,xx,'-*')

% RK4
i=1;
while(t(i)<=1)
    fx1(i)=-t(i)*x(i)-y(i)-1;
    fy1(i)=x(i);
    
    fx2(i)=-(t(i)+h/2)*(x(i)+fx1(i)*h/2)-(y(i)+fy1(i)*h/2)-1;
    fy2(i)=x(i)+h*fx1(i)/2;
    
    fx3(i)=-(t(i)+h/2)*(x(i)+fx2(i)*h/2)-(y(i)+fy2(i)*h/2)-1;
    fy3(i)=x(i)+h*fx2(i)/2;
    
    fx4(i)=-(t(i)+h)*(x(i)+fx3(i)*h)-(y(i)+fy3(i)*h)-1;
    fy4(i)=x(i)+h*fx3(i);
    if i==length(t)
        break
    end
    x(i+1)=x(i)+h*(fx1(i)+2*fx2(i)+2*fx3(i)+fx4(i))/6;
    y(i+1)=y(i)+h*(fy1(i)+2*fy2(i)+2*fy3(i)+fy4(i))/6;
    i=i+1;
end
for i=1:length(tt)
    xx(i)=x(2*i-1);
end
plot(tt,xx,'-*')

% RK4
h=tt(2)-tt(1); %step
x=ones(1,length(tt));
y=ones(1,length(tt));
fx=ones(1,length(tt));
fy=ones(1,length(tt));
i=1;
while(tt(i)<=1)
    fx1(i)=-tt(i)*x(i)-y(i)-1;
    fy1(i)=x(i);
    
    fx2(i)=-(tt(i)+h/2)*(x(i)+fx1(i)*h/2)-(y(i)+fy1(i)*h/2)-1;
    fy2(i)=x(i)+h*fx1(i)/2;
    
    fx3(i)=-(tt(i)+h/2)*(x(i)+fx2(i)*h/2)-(y(i)+fy2(i)*h/2)-1;
    fy3(i)=x(i)+h*fx2(i)/2;
    
    fx4(i)=-(tt(i)+h)*(x(i)+fx3(i)*h)-(y(i)+fy3(i)*h)-1;
    fy4(i)=x(i)+h*fx3(i);
    if i==length(tt)
        break
    end
    x(i+1)=x(i)+h*(fx1(i)+2*fx2(i)+2*fx3(i)+fx4(i))/6;
    y(i+1)=y(i)+h*(fy1(i)+2*fy2(i)+2*fy3(i)+fy4(i))/6;
    i=i+1;
end
plot(tt,x,'-*')

legend('Euler Method with delta_t=0.1','RK4 with delta_t=0.1','RK4 with delta_t=0.2','interpreter','none')