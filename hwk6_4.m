clear;clc;clf

syms xe(t)
eqn=7*diff(xe,t,2)-2*diff(xe,t,1)-7+xe==0;
cond=[xe(0)==5 xe(20)==8];
xSol=dsolve(eqn,cond);
fplot(xSol,[0,20])
hold on

x=0:0.01:20;
h=x(2)-x(1); %step
y=ones(1,length(x));
p=ones(1,length(x));

p(1,1)=1;  
p(2,1)=0.5;

y(1,1)=5;
y(2,1)=5;
y(3,1)=5;

% RK4
i=1;
while(x(i)<=20)
    fp1(1,i)=(2*p(1,i)+7-x(i))/7;
    fp1(2,i)=(2*p(2,i)+7-x(i))/7;
    fy1(1,i)=p(1,i);
    fy1(2,i)=p(2,i);
    
    fp2(1,i)=(2*(p(1,i)+fp1(1,i)*h/2)+7-(x(i)+h/2))/7;
    fp2(2,i)=(2*(p(2,i)+fp1(2,i)*h/2)+7-(x(i)+h/2))/7;
    fy2(1,i)=p(1,i)+fp1(1,i)*h/2;
    fy2(2,i)=p(2,i)+fp1(2,i)*h/2;
    
    fp3(1,i)=(2*(p(1,i)+fp2(1,i)*h/2)+7-(x(i)+h/2))/7;
    fp3(2,i)=(2*(p(2,i)+fp2(2,i)*h/2)+7-(x(i)+h/2))/7;
    fy3(1,i)=p(1,i)+fp2(1,i)*h/2;
    fy3(2,i)=p(2,i)+fp2(2,i)*h/2;
    
    fp4(1,i)=(2*(p(1,i)+fp3(1,i)*h)+7-(x(i)+h))/7;
    fp4(2,i)=(2*(p(2,i)+fp3(2,i)*h)+7-(x(i)+h))/7;
    fy4(1,i)=p(1,i)+fp3(1,i)*h;
    fy4(2,i)=p(2,i)+fp3(2,i)*h;
    if i==length(x)
        break
    end
    p(1,i+1)=p(1,i)+h*(fp1(1,i)+2*fp2(1,i)+2*fp3(1,i)+fp4(1,i))/6;
    p(2,i+1)=p(2,i)+h*(fp1(2,i)+2*fp2(2,i)+2*fp3(2,i)+fp4(2,i))/6;
    y(1,i+1)=y(1,i)+h*(fy1(1,i)+2*fy2(1,i)+2*fy3(1,i)+fy4(1,i))/6;
    y(2,i+1)=y(2,i)+h*(fy1(2,i)+2*fy2(2,i)+2*fy3(2,i)+fy4(2,i))/6;
    i=i+1;
end

p(3,1)=p(1,1)+(p(2,1)-p(1,1))/(y(2,length(x))-y(1,length(x)))*(8-y(1,length(x)));
i=1;
while(x(i)<=20)
    fp1(3,i)=(2*p(3,i)+7-x(i))/7;
    fy1(3,i)=p(3,i);
    
    fp2(3,i)=(2*(p(3,i)+fp1(3,i)*h/2)+7-(x(i)+h/2))/7;
    fy2(3,i)=p(3,i)+fp1(3,i)*h/2;
    
    fp3(3,i)=(2*(p(3,i)+fp2(3,i)*h/2)+7-(x(i)+h/2))/7;
    fy3(3,i)=p(3,i)+fp2(3,i)*h/2;
    
    fp4(3,i)=(2*(p(3,i)+fp3(3,i)*h)+7-(x(i)+h))/7;
    fy4(3,i)=p(3,i)+fp3(3,i)*h;
    if i==length(x)
        break
    end
    p(3,i+1)=p(3,i)+h*(fp1(3,i)+2*fp2(3,i)+2*fp3(3,i)+fp4(3,i))/6;
    y(3,i+1)=y(3,i)+h*(fy1(3,i)+2*fy2(3,i)+2*fy3(3,i)+fy4(3,i))/6;
    i=i+1;
end
plot(x,y(3,:))