clear;clc;clf

syms Te(x)
eqn=diff(Te,x,2)-0.15*Te==0;
cond=[Te(0)==240 Te(10)==150];
tSol=dsolve(eqn,cond);
fplot(tSol,[0,10])
hold on

x=0:0.1:10;
h=x(2)-x(1);

p=zeros(3,length(x));
t=zeros(3,length(x));
t(:,1)=ones(3,1)*240;
p(1,1)=5;
p(2,1)=10;

i=1;
f=@(t)0.15*t;
g=@(p)p;
while(x(i)<=10)
    kp1(1,i)=f(t(1,i));
    kp1(2,i)=f(t(2,i));
    kt1(1,i)=g(p(1,i));
    kt1(2,i)=g(p(2,i));
    
    kp2(1,i)=f(t(1,i)+kt1(1,i)*h/2);
    kp2(2,i)=f(t(2,i)+kt1(2,i)*h/2);
    kt2(1,i)=g(p(1,i)+kp1(1,i)*h/2);
    kt2(2,i)=g(p(2,i)+kp1(2,i)*h/2);
    
    kp3(1,i)=f(t(1,i)+kt2(1,i)*h/2);
    kp3(2,i)=f(t(2,i)+kt2(2,i)*h/2);
    kt3(1,i)=g(p(1,i)+kp2(1,i)*h/2);
    kt3(2,i)=g(p(2,i)+kp2(2,i)*h/2);
    
    kp4(1,i)=f(t(1,i)+kt3(1,i)*h);
    kp4(2,i)=f(t(2,i)+kt3(2,i)*h);
    kt4(1,i)=g(p(1,i)+kp3(1,i)*h);
    kt4(2,i)=g(p(2,i)+kp3(2,i)*h);
    if i==length(x)
        break
    end
    p(1,i+1)=p(1,i)+h*(kp1(1,i)+2*kp2(1,i)+2*kp3(1,i)+kp4(1,i))/6;
    p(2,i+1)=p(2,i)+h*(kp1(2,i)+2*kp2(2,i)+2*kp3(2,i)+kp4(2,i))/6;
    t(1,i+1)=t(1,i)+h*(kt1(1,i)+2*kt2(1,i)+2*kt3(1,i)+kt4(1,i))/6;
    t(2,i+1)=t(2,i)+h*(kt1(2,i)+2*kt2(2,i)+2*kt3(2,i)+kt4(2,i))/6;
    i=i+1;
end

p(3,1)=p(1,1)+(p(2,1)-p(1,1))/(t(2,length(x))-t(1,length(x)))*(150-t(1,length(x)));
i=1;
while(x(i)<=20)
    kp1(3,i)=f(t(3,i));
    kt1(3,i)=g(p(3,i));
    
    kp2(3,i)=f(t(3,i)+kt1(3,i)*h/2);
    kt2(3,i)=g(p(3,i)+kp1(3,i)*h/2);
    
    kp3(3,i)=f(t(3,i)+kt2(3,i)*h/2);
    kt3(3,i)=g(p(3,i)+kp2(3,i)*h/2);
    
    kp4(3,i)=f(t(3,i)+kt3(3,i)*h);
    kt4(3,i)=g(p(3,i)+kp3(3,i)*h);
    if i==length(x)
        break
    end
    p(3,i+1)=p(3,i)+h*(kp1(3,i)+2*kp2(3,i)+2*kp3(3,i)+kp4(3,i))/6;
    t(3,i+1)=t(3,i)+h*(kt1(3,i)+2*kt2(3,i)+2*kt3(3,i)+kt4(3,i))/6;
    i=i+1;
end
plot(x,t(3,:))

legend('explicit soln','numerical soln')
title('Plot of tempertature distribution')
ylabel('T(x)')
xlabel('x')