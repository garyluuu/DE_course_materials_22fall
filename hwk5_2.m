clear;clc;clf
syms t

n=2; %number of terms that we want

a(1)=1;
a(2)=1;
x=a(1)+a(2)*t;
%n terms
for i=1:n-2
    a(i+2)=(2*(i-1)-5)/(((i-1)+2)*((i-1)+1))*a(i);
    x=x+a(i+2)*t^((i-1)+2);
end
tt=0:0.05:5;
xx=subs(x,t,tt);
plot(tt,xx)
hold on
%n+1 terms
for i=1:n-1
    a(i+2)=(2*(i-1)-5)/(((i-1)+2)*((i-1)+1))*a(i);
    x=x+a(i+2)*t^((i-1)+2);
end
xx=subs(x,t,tt);
plot(tt,xx)
%n+2 terms
for i=1:n
    a(i+2)=(2*(i-1)-5)/(((i-1)+2)*((i-1)+1))*a(i);
    x=x+a(i+2)*t^((i-1)+2);
end
xx=subs(x,t,tt);
plot(tt,xx)

legend('number of terms:5','number of terms:6','number of terms:7')