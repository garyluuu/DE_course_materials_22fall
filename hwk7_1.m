syms u(x)

t=[0,1,3,5,7,9];

hold on
for i=1:length(t)
    u=0;
    for n=1:100
        u=u+20*(10*sin(3*pi*n/10)/3-sin(pi*n))*sin(n*pi*x/10)*cos(3*n*pi*t(i)/10)/(7*pi^2*n^2);
    end
    fplot(x,u,[0,10])
end

legend('t=0','t=1','t=3','t=5','t=7','t=9')
title('Solution(100 terms)')
