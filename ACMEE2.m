clear all ; 
clc ; 
syms x t ;
G=6./((x+1).*(x+2).*(x+3));
g=subs(ilaplace(G,x),x,t);
h=subs(ilaplace(G./x,x),x,t); 
F=10 ;
T0=1.95;
TT=T0;
T=[];
J=3/10-6./(t+1)+12./(2.*t+1)-6./(3.*t+1)+1./(2.*t) ;
dJ=gradient(J) ;
ddJ=gradient(dJ); 
TA=[1.95] ;
for i=1:100
    TT=TT-F.*double(subs(dJ,t,TT)) ;
    TA=[TA TT];
end
    TA
TB=[1.95];
TT=1.95;
pause
for i=1:20
    TT=TT-double(subs(dJ,t,TT))./double(subs(ddJ,t,TT)) ;
    TB=[TB TT];
end
 TB