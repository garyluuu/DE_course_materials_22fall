clear;clc;clf
r=0:0.01:5;
kxi=0.2:0.2:0.8;
PS1=atan(2*kxi(1)*r./(1-r.^2))+pi/2;
PS2=atan(2*kxi(2)*r./(1-r.^2))+pi/2;
PS3=atan(2*kxi(3)*r./(1-r.^2))+pi/2;
PS4=atan(2*kxi(4)*r./(1-r.^2))+pi/2;

plot(r,PS1,'k-')
hold on
plot(r,PS2,'r-')
plot(r,PS3,'g-')
plot(r,PS4,'b-')

legend('kxi=0.2','kxi=0.4','kxi=0.6','kxi=0.8')
xlabel('r (omega/omega_n)','interpreter','none')
ylabel('Phase Shift')