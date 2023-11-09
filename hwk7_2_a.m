syms T(x)

t=0:0.025:0.2;

hold on
for i=1:length(t)
    T=sin(pi*x)*exp(-pi^2*t(i));
    fplot(x,T,[0,1])
end

legend('t=0','t=0.025','t=0.05','t=0.075','t=0.1','t=0.125','t=0.15','t=0.175','t=0.2')

