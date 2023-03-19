syms s T;
t = 0:0.1:10;
F = 6/((s+1).*(s+2).*(s+3));
g = ilaplace(F)
h = ilaplace(F/s)
Fm = 1/(1+T*s);
gm = ilaplace(Fm,s)
hm = ilaplace(Fm/s,s)
dJ = -1/(2.*T.*T) + 6/((T+1).*(T+1)) - 24/((2.*T+1).*(2.*T+1)) + 18/((3.*T+1).*(3.*T+1))
ddJ = gradient(dJ)
T0 = 1.95;
T = [];
for i=1:4
    T = [T T0];
    T1 = T0 - subs(dJ,T,T0);
    T = [T T1];
    i=i+1;
end
T
