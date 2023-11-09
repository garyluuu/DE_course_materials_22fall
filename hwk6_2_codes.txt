clear;clc;clf

subplot(1,2,1)
%explicit soln
syms xe(t)
eqn=diff(xe,t,2)+diff(xe,t,1)+9*xe==cos(3*t);
Dxe=diff(xe,t);
cond=[xe(0)==0 Dxe(0)==0];
xSol=dsolve(eqn,cond);
fplot(xSol,[0 15])
hold on

tt=0:0.1:15;
h=tt(2)-tt(1); %step
x=ones(1,length(tt));
p=ones(1,length(tt));
fx=ones(1,length(tt));
fp=ones(1,length(tt));
x(1)=0;
p(1)=0;

% RK4
i=1;
while(tt(i)<=15)
    fp1(i)=cos(3*tt(i))-p(i)-9*x(i);
    fx1(i)=p(i);
    
    fp2(i)=cos(3*(tt(i)+h/2))-(p(i)+fp1(i)*h/2)-9*(x(i)+fx1(i)*h/2);
    fx2(i)=p(i)+fp1(i)*h/2;
    
    fp3(i)=cos(3*(tt(i)+h/2))-(p(i)+fp2(i)*h/2)-9*(x(i)+fx2(i)*h/2);
    fx3(i)=p(i)+fp2(i)*h/2;
    
    fp4(i)=cos(3*(tt(i)+h))-(p(i)+fp3(i)*h)-9*(x(i)+fx3(i)*h);
    fx4(i)=p(i)+fp3(i)*h;
    if i==length(tt)
        break
    end
    p(i+1)=p(i)+h*(fp1(i)+2*fp2(i)+2*fp3(i)+fp4(i))/6;
    x(i+1)=x(i)+h*(fx1(i)+2*fx2(i)+2*fx3(i)+fx4(i))/6;
    i=i+1;
end
plot(tt,x)
title('plot of explicit soln and RK4 soln')

%global error
er_global1=zeros(1,length(tt));

for k=1:length(tt)
    er_local(k)=abs(eval(subs(xSol,t,tt(k)))-x(k));
    if k==1
        er_global1(k)=er_global1(k)+er_local(k);
    elseif k>1
        er_global1(k)=er_global1(k-1)+er_local(k);
    end
end
subplot(1,2,2)
plot(tt,er_global1)
hold on

tt=0:0.05:15;
h=tt(2)-tt(1); %step
x=ones(1,length(tt));
p=ones(1,length(tt));
fx=ones(1,length(tt));
fp=ones(1,length(tt));
x(1)=0;
p(1)=0;

% RK4
i=1;
while(tt(i)<=15)
    fp1(i)=cos(3*tt(i))-p(i)-9*x(i);
    fx1(i)=p(i);
    
    fp2(i)=cos(3*(tt(i)+h/2))-(p(i)+fp1(i)*h/2)-9*(x(i)+fx1(i)*h/2);
    fx2(i)=p(i)+fp1(i)*h/2;
    
    fp3(i)=cos(3*(tt(i)+h/2))-(p(i)+fp2(i)*h/2)-9*(x(i)+fx2(i)*h/2);
    fx3(i)=p(i)+fp2(i)*h/2;
    
    fp4(i)=cos(3*(tt(i)+h))-(p(i)+fp3(i)*h)-9*(x(i)+fx3(i)*h);
    fx4(i)=p(i)+fp3(i)*h;
    if i==length(tt)
        break
    end
    p(i+1)=p(i)+h*(fp1(i)+2*fp2(i)+2*fp3(i)+fp4(i))/6;
    x(i+1)=x(i)+h*(fx1(i)+2*fx2(i)+2*fx3(i)+fx4(i))/6;
    i=i+1;
end

er_global2=zeros(1,length(tt));
for k=1:length(tt)
    er_local(k)=abs(eval(subs(xSol,t,tt(k)))-x(k));
    if k==1
        er_global2(k)=er_global2(k)+er_local(k);
    elseif k>1
        er_global2(k)=er_global2(k-1)+er_local(k);
    end
end
plot(tt,er_global2)
title('plot of the accumulation of global error')