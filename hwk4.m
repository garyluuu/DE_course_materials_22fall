clear;clc;clf
r=0:0.01:5;
kxi=0.2:0.2:0.8;
MF1=sqrt(1./((1-r.^2).^2+4*kxi(1)^2*r.^2));
MF2=sqrt(1./((1-r.^2).^2+4*kxi(2)^2*r.^2));
MF3=sqrt(1./((1-r.^2).^2+4*kxi(3)^2*r.^2));
MF4=sqrt(1./((1-r.^2).^2+4*kxi(4)^2*r.^2));
%MF5=sqrt(1./((1-r.^2).^2+4*r.^2));
%MF6=sqrt(1./((1-r.^2).^2+4*1.2^2*r.^2));
plot(r,MF1,'k-')
hold on
plot(r,MF2,'r-')
plot(r,MF3,'g-')
plot(r,MF4,'b-')
%plot(r,MF5,'b--')
%plot(r,MF6,'r--')
legend('kxi=0.2','kxi=0.4','kxi=0.6','kxi=0.8')
xlabel('r (omega/omega_n)','interpreter','none')
ylabel('Magnitude Factor')