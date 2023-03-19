function [K To T n]=strej(m,a)
format short
T0=(-3*m(3)*m(2)*m(1)+2*m(2)^3+m(4)*m(1)^2)/(2*m(3)*m(1)^2-2*m(2)^2*m(1));
T=T0/(1-a*T0);
d=(m(3)*m(1)-m(2)^2)/m(1)^2;
n=d/T0^2;
n=round(n);
To=m(2)/m(1)-n*T0;
K=m(1)*exp(+a*To)*(1+a*T)^n;
end