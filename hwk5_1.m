t=0:0.01:50;
xh=exp(-0.1*t).*(cos(sqrt(0.99)*t)-0.9*sin(sqrt(0.99)*t)/sqrt(0.99));
xp=5*sqrt(1/(15^2+0.8^2))*cos(4*t+atan(2*0.1*1*4/15));
x=xh+xp;
plot(t,x,t,xp)
legend('transient response x(t)','steady-state response x_p(t)')