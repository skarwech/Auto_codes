clc ; 
clear all ;
syms s x;
num = 1;
den = [1 1.4 1];
t = 0:0.01:10; 
impulse(num,den,t)
F = @(s) (1/(1+1.4*s+s^2));
Mth = [];
Mpr = [];

g = ilaplace(F,s)
for i = 0:3
    h = (s^i)*g
    v = (((-1).^i)/factorial(i))* simpson(h,0,100000,10);
    Mpr = [Mpr v];
    i=+1;
end
for i=0:3
    f = diff(F,s,i);
    v = (1/factorial(i))*subs(f,s,0);
    Mth = [Mth v];
    i=+1;
end
Mth
Mpr
