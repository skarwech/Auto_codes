clc ;
syms x s k;
f = exp(-4*x);
M = []
for k = 0:3 
    a = ((-1)^k)/factorial(k);
    g = x^k * f;
    int = simpson(g,0,1000000000000000,1000);
    M = [M a*int];
end
M