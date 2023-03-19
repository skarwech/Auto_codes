a=input('entrer la valeur de a=');
b=input('entrer la valeur de b=');
c=input('entrer la valeur de c=');
d=input('entrer la valeur de d=');
f=input('entrer votre fonction comancer par @ (x,y) ');
h1=(a+b)/2;
h2=(c+d)/2;
k=(b-a)*(d-c)/16;
I=k*(f(a,c)+f(a,d)+f(b,c)+f(b,d)+2*(f(h1,c)+f(h1,d)+f(a,h2)+f(b,h2))+4*f(h1,h2));
fprintf ('la valeure dintegrale est I= %f\n ',I) 
