clear;clc;clf
syms t

n=8; %number of terms that we want

a(1)=1;
a(2)=1;
a(3)=1/2;
a(4)=1/3;
x=a(1)+a(2)*t+a(3)*t^2+a(4)*t^3;

for i=1:n-4
    a(i+4)=((i+2)*a(i+3)+(i+1)*a(i+2)-a(i))/((i+3)*(i+2));
    x=x+a(i+4)*t^(i+3);
end
tt=0:0.05:4;
xx=subs(x,t,tt);
plot(tt,xx)
legend('number of terms:8')