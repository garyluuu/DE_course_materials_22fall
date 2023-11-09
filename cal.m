function [lg]=cal(h)
syms hh
r1=6.25;r2=2.5;
theta1=acos((r1-r2)/h);
theta2=asin((r1-r2)/h);
lg=2*sqrt(h^2-(r1-r2)^2)+2*(pi-theta1)*r1+2*(pi-2*theta2)*r2;