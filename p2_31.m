clear;clc;clf;
t=0:1:100;
v=300.*(-3*exp(t/15)-1)./(-3*exp(t/15)+1);
y=300*ones(size(t));
hold on
plot(t,v)
plot(t,y,'r--')
axis([0 inf 200 inf])
xlabel('t/hour')
ylabel('v/(km/hour)')