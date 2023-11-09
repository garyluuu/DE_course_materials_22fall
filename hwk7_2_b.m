clear;clc;clf;
syms T(x)

t=0.05:0.05:0.5;

hold on
for i=1:length(t)
    T=0;
    for n=1:30
        T=T+4*sin((2*n-1)*pi*x/2)*exp(-(((2*n-1)*pi/2)^2)*t(i))/(pi*(2*n-1));
    end
    fplot(x,T,[0,1])
end

legend('t=0','t=0.05','t=0.1','t=0.15','t=0.2','t=0.25','t=0.3','t=0.35','t=0.4','t=0.45','t=0.5')