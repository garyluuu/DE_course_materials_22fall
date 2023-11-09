x0=1;
x00=1;

fun=@(t)-abs(8*(cos(2*t(1))/(4+t(2))+(x0-1/(4+t(2)))*cos(sqrt(8+t(2))*t(1))+x00*sin(sqrt(8+t(2))*t(1))/sqrt(8+t(2))));

s0=[10,10];
s=fminsearch(fun,s0)