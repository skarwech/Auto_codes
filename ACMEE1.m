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
pause
%II-Simulations : 
t0=0;
Tf = 20;
delta = 0.1;
t = [0:0.1:20];

xxx=[]
xx=[0.5;0.5]
for i=t0:delta:Tf 
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1,x2,u],[xx',0.5]));
end
subplot(4,4,1)
plot(t,xxx)
title('Simulation du systéme NL avec comme entrées (0.5,0.5) et une commande u=0.5')
xxx=[]
xx=[0.5;0.5]
for i=t0:delta:Tf
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dXP0,[x1,x2,u],[xx',0.5]));
    
end
subplot(4,4,2)
plot(t,xxx)
title('Simulation du systéme linéaire autour de P0 avec comme entrées (0.5,0.5) et une commande u=0.5')

xxx=[]
xx=[pi-0.5;0.5]
for i=t0:delta:Tf 
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1,x2,u],[xx',0.5]));
end
subplot(4,4,3)
plot(t,xxx)
title('Simulation du systéme NL avec comme entrées (pi-0.5,0.5) et une commande u=0.5')

xxx=[];
xx=[pi-0.5;0.5];
for i=t0:delta:Tf 
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dXP1,[x1,x2,u],[xx',0.5]));
end
subplot(4,4,4)
plot(t,xxx)
title('Simulation du systéme linéarisé autour de P1 avec comme entrées (pi-0.5,0.5) et une commande u=0.5')

    
%on remarque que le systéme linéarisé autour de P0 converge peu importe la
%valeur initiale qu'on lui donne , alors que le second autour de P1 diverge
%peu importe la valeur initiale qu'on lui donne 

%III-Commande par retour d'état pour imposer la dynamique : s^2+2*eps*wn*s
%+ wn^2=0

display('Nous voulons imposer la dynamique : s^2+2eps.wn.s+wn^2=0')
syms s ; 
wn=input('Entrez la valeur de wn ') 
eps=input('Entrez la valeur de epsilon ') 
sol=solve(s^2+2*wn*eps*s+wn^2,s) ;
sol=double(sol);
%Commande par retour d'état sur L(P0), calucl de K :
L=double(AP0);
M=double(B);
k1=place(L,M,sol) ;

%Commande par retour d'état sur L(P1), calucl de K :
L=double(AP1);
M=double(B);
k2=place(L,M,sol) ;

%simulation 
xxx=[];
xx=[0.1;0.1];
for i=t0:delta:Tf
    uu=-k1*x+u;
    uuu=subs(uu,[x1,x2,u],[xx', 0]);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*subs(dXP0,[x1 x2 u],[xx' ,uuu]);
end
  
subplot(4,4,5)
plot(t,xxx)
title('Simulation du systéme linéarisé autour de P0 stabilisé par retour detat avec wn=100 et eps=0.01 pour imposer  avec comme entrées (0.1,0.1) et une commande u=0.1')

xxx=[];
xx=[0.1;0.1];
for i=t0:delta:Tf
    uu=-k1*x+u;
    uuu=subs(uu,[x1,x2,u],[xx', 0]);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1 x2 u],[xx' ,uuu]));
end

subplot(4,4,6)
plot(t,xxx)
title('Simulation du systéme NL autour de P0 stabilisé par retour detat avec wn=100 et eps=0.01 pour imposer  avec comme entrées (0.1,0.1) et une commande u=0.1')

%simulation 
xxx=[];
xx=[pi-0.1;0.1];
for i=t0:delta:Tf
    uu=-k2*x+u;
    uuu=subs(uu,[x1,x2,u],[xx', 0]);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dXP1,[x1 x2 u],[xx' ,uuu]));
end
  
subplot(4,4,7)
plot(t,xxx)
title('Simulation du systéme linéarisé autour de P1 stabilisé par retour detat avec wn=100 et eps=0.01 pour imposer  avec comme entrées (0.1,0.1) et une commande u=0.1')

xxx=[];
xx=[pi-0.1;0.1];
for i=t0:delta:Tf
    uu=-k2*x+u;
    uuu=subs(uu,[x1,x2,u],[xx', 0]);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1 x2 u],[xx' ,uuu]));
end

subplot(4,4,8)
plot(t,xxx)
title('Simulation du systéme NL autour de P1 stabilisé par retour detat avec wn=100 et eps=0.01 pour imposer  avec comme entrées (0.1,0.1) et une commande u=0.1')

%Stabilisation par retour d'état + précompensateur : 
%Nous avons : dx=(A-B*k)x+B*P*yr ; P=inv(C*inv(-Abf)*B)
%Calcul de PP0: 
PP0=inv(C*inv(-AP0)*B)
%Calcul de PP1:
PP1=inv(C*inv(-AP1)*B)
%simulation : 

xxx=[];
xx=[0.1;0.1];
for i=t0:delta:Tf
    uu=-k1*x+PP0;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dXP0,[x1 x2 u],[xx',uuu]));
end
  
subplot(4,4,9)
plot(t,xxx)
title('Simulation du systéme linéarisé autour de P0 stabilisé par retour  detat et précompensateur avec wn=3 et eps=1.5 pour imposer  avec comme entrées (0.1,0.1) et une commande yr=1')

xxx=[];
xx=[0.1;0.1];
for i=t0:delta:Tf
    uu=-k1*x+PP0;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1 x2 u],[xx' ,uuu]));
end

subplot(4,4,10)
plot(t,xxx)
title('Simulation du systéme NL autour de P0 stabilisé par retour  detat et précompensateur avec wn=3 et eps=1.5 pour imposer  avec comme entrées (0.1,0.1) et une commande yr=1')

%simulation 
xxx=[];
xx=[pi-0.1;0.1];
for i=t0:delta:Tf
    uu=-k2*x+PP1;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dXP1,[x1 x2 u],[xx' ,uuu]));
end
  
subplot(4,4,11)
plot(t,xxx)
title('Simulation du systéme linéarisé autour de P1 stabilisé par retour  detat et précompensateur avec wn=3 et eps=1.5 pour imposer  avec comme entrées (pi-0.1,0.1) et une commande yr=1')

xxx=[];
xx=[pi-0.1;0.1];
for i=t0:delta:Tf
    uu=-k2*x+PP1;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1 x2 u],[xx' ,uuu]));
end
subplot(4,4,12)
plot(t,xxx)
title('Simulation du systéme NL autour de P1 stabilisé par retour  detat et précompensateur avec wn=3 et eps=1.5 pour imposer  avec comme entrées (pi-0.1,0.1) et une commande yr=1')

%commande par retour d'etat et action integrale :
%pour le point P0 :
Ki = input('introduire la valeur propre que vous voulez : Ki=')
sol=double([sol;Ki])
Ae0 = double([AP0 0*ones(2,1);C 0*ones(1,1)])
Be0 = double([B; 0*ones(1,1)])
Ke0 = place(Ae0,Be0,[sol;-2])
K0 = [Ke0(1),Ke0(2)]
Ki0 = Ke0(3)
%pour le point P1 : 
Ae1 = double([AP1 0*ones(2,1);C 0*ones(1,1)])
Be1 = double([B; 0*ones(1,1)])
Ke1 = place(Ae1,Be1,[sol;-2])
K1 = [Ke1(1),Ke1(2)]
Ki1= Ke1(3)
%simulation :
%premier système P0
yr = input('introduire la valeur de réference');
xxx=[];
ie = 0
xx=[0.1;0.1];
for i=t0:delta:Tf
    e = C*x-yr;
    e=double(subs(e,[x1,x2],[xx']));
    ie = ie + e*delta;
    uu=-K0*x+Ki0*ie;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dXP0,[x1 x2 u],[xx' ,uuu]));
end
subplot(4,4,13)
plot(t,xxx)
title('Simulation du systéme linéarisé autour de P0 avec régulation par retour detat et integrale , avec wn=3 , eps=1.5 , Ki=-3 et yr=1')

%deuxième système
xxx=[];
ie = 0
xx=[pi-0.1;0.1];
for i=t0:delta:Tf
    e = C*x-yr;
    e=double(subs(e,[x1,x2],[xx']));
    ie = ie + e*delta;
    uu=-K1*x+Ki1*ie;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dXP1,[x1 x2 u],[xx' ,uuu]));
end
subplot(4,4,14)
plot(t,xxx)
title('Simulation du systéme linéarisé autour de P1 avec régulation par retour detat et integrale , avec wn=3 , eps=1.5 , Ki=-3 et yr=1')



%pour le système non linéaire
%autour de P0
xxx=[];
ie = 0
xx=[0.1;0.1];
for i=t0:delta:Tf
    e = C*x-yr;
    e=double(subs(e,[x1,x2],[xx']));
    ie = ie + e*delta;
    uu=-K0*x+Ki0*ie;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1 x2 u],[xx' ,uuu]));
end
subplot(4,4,15)
plot(t,xxx)
title('Simulation du systéme NL autour de P0 avec régulation par retour detat et integrale , avec wn=3 , eps=1.5 , Ki=-3 et yr=1')


%autour de P1
xxx=[];
ie = 0
xx=[pi-0.1;0.1];
for i=t0:delta:Tf
    e = C*x-yr;
    e=double(subs(e,[x1,x2],[xx']));
    ie = ie + e*delta;
    uu=-K1*x+Ki1*ie;
    uuu=subs(uu,[x1,x2],[xx']);
    uuu=double(uuu);
    xxx=[xxx xx];
    xx=xx+delta.*double(subs(dx,[x1 x2 u],[xx' ,uuu]));
end
subplot(4,4,16)
plot(t,xxx)
title('Simulation du systéme NL de P1 avec régulation par retour detat et integrale , avec wn=3 , eps=1.5 , Ki=-3 et yr=1')