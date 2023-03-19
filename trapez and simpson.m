f=input('donner la function');
n=input('donner le nomber de les intervalle: ');
a=input('donner la valeure de a: ');
b=input('donner la valeure de b: ');
h=(b-a)/n;
I1 =0;
for i=1:n-1
  I1=I1+f(a+i*h);
end
trap=(h/2)*(f(a)+2*I1+f(b));
fprintf ('I de trapez=%.6f\n',trap) 

num=0;
for j=2:2:n-1
    num=num+f(a+j*h);
end
num1=0;
for k=2:2:n-2
    num1=num1+f(a+k*h);
end
sim1=(h/3)*(f(a)+4*I1 +2*num1 +f(b));
fprintf('I de simpson 1/3eme =%.6f\n',sim1)


num3 =0;
for l=3:3:n-1
    num3=num3 +f(a+l*h);
end
SUM=0;
for m=1:n-1
    SUM=SUM+f(a+m*h);
end
su3 = SUM-num3;
    simpson38=(3*h/8)*(f(a)+3*su3+2*num3+f(b));
    fprintf('I de simpson 3/8eme =%.6f\n',simpson38)
