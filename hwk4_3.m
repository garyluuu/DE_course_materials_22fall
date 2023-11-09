t=0:0.01:10;

coe1=2;
coe2=36;
coe3=6;
coe4=20;

omiga=coe4;
omiga_n=sqrt(coe2);
r=omiga/omiga_n;
kxi=coe1/2/omiga_n;
sigma=coe3/coe2;
phi=atan(2*kxi*r/(1-r^2));

x=sigma*sqrt(1/((1-r^2).^2+4*kxi^2*r^2))*cos(omiga*t+phi);
plot(t,x)

xlabel('t')
ylabel('x_p(t)')