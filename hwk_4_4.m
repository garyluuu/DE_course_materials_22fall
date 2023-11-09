clear;clc;clf
t=0:0.1:10;
kxi=0:0.2:1;

omega_n=1;
x0=1;
x00=0;

hold on
for i=1:6
    omega_d=omega_n*sqrt(1-kxi(i)^2);
    if(i<6)
        x=exp(-kxi(i)*omega_n*t).*(x0*cos(omega_d*t)+(x00+kxi(i)*omega_n*x0)*sin(omega_d*t)/omega_d);
    end
    if(i==6)
        x=x0*exp(-omega_n*t)+(x00+omega_n*x0)*t.*exp(-omega_n*t);
    end
    plot(t,x)
end
legend('kxi=0.0','kxi=0.2','kxi=0.4','kxi=0.6','kxi=0.8','kxi=1.0')
