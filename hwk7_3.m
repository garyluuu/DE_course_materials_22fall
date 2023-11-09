[X,Y]=meshgrid(0:0.2:2,0:0.1:1);

u=sin(pi*X/2).*(exp(pi*Y/2)-exp(pi)*exp(-pi*Y/2))/(1-exp(pi));

mesh(X,Y,u)