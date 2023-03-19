clc ; 
clear all ; 
%déclaration des variables symboliques 
syms x1 x2 y u ; 
%déclaration de notre modéle d'état
disp('Declaration de notre modele detat:')
x=[x1;x2]
pause 
dx=[x2;-2*sin(x1)-5*x2+u]
pause 
y=x1 
pause
%déclaration de nos points d'équilibres P0 et P1 
disp('Nos points dequilibre : Pi=[x1i,x2i,ui]')
P0=[0 , 0 , 0]
P1=[pi , 0 , 0 ] 
%calcul des modéles linéaires 
jcb=jacobian(dx,[x1,x2]);
B=jacobian(dx,u) ;
C=jacobian(y,[x1,x2]); 
%autour de P0 :  
pause
disp('Modele lineraire autour de P0:')
AP0=double(subs(jcb,[x1,x2],[0,0]))
dXP0=subs(jcb,[x1,x2,u],P0)*x+B*u
eig(AP0)
y=C*x
%autour de P1 : 
pause
disp('Modele lineraire autour de P1:')
AP1=double(subs(jcb,[x1,x2],[pi,0]))
dXP1=subs(jcb,[x1,x2,u],P1)*x+B*u
eig(AP1)
y=C*x

PP1=inv(C*inv(-AP1)*B)