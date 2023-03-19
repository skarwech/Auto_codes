%% Partie 01
close all
clear all
clc
display('introduire les angles :')
alpha=input('alpha : ');
beta=input('beta : ');
gamma=input('gamma : ');
display('La matrice de rotation est :')
R=ang2rot(alpha,beta,gamma)

pause;
display('Verification des contraintes pour la matrice de rotation')
x=R(:,1)   
y=R(:,2)   
z=R(:,3)
pause;
display('on doit avoir chaque toutes les normes = 1')

Norme_X=norm(x)
Norme_Y=norm(y)
Norme_Z=norm(z)
pause;
display('on doit avoir le produit scalaire nul')
pause;
X_Y=dot(x,y)
X_Z=dot(x,z)
Y_Z=dot(y,z)
display('')
pause;
display('équivalence entre inverse et transposée de la matrice de rotation')
R_inv=inv(R);
R_t=R';
A = R_t - R_inv
pause;
%% Partie 02*
clc
R_input=input('Entrez les parametres de la matrice de rotation : ')
[a1,a2]=rot2ang(R_input)
pause;
display('Les angles d''euler (alpha,beta,gamma) sont : ')
display('# Solution 01 : ')
display(sprintf('alpha= %f ; beta= %f ; gamma= %f .',a1(1),a1(2),a1(3)))
display(' ')
display(' ')
display('# Solution 02 : ')
display(sprintf('alpha= %f ; beta= %f ; gamma= %f .',a2(1),a2(2),a2(3)))

pause;
%% Partie 02
clc
display('Entrez les angles d''euler (alpha,beta,gamma)')
alpha=input('alpha : ');
beta=input('beta : ');
gamma=input('gamma : ');
display('*****************************************************************')
display('La matrice de rotation correspondante est :')
R1=ang2rot(alpha,beta,gamma)
display('*****************************************************************')

[angle1,angle2]=rot2ang(R1);
pause;
display('Les angles d''euler (alpha,beta,gamma) sont : ')
display('# Solution 01 : ')

display(sprintf('alpha= %f ; beta= %f ; gamma= %f .',angle1(1),angle1(2),angle1(3)))
display(' ')
display(' ')
display('# Solution 02 : ')
display(sprintf('alpha= %f ; beta= %f ; gamma= %f .',angle2(1),angle2(2),angle2(3)))

pause;
display('*****************************************************************')
display(' ')
display('La matrice de rotation se calcule a l''aide de la deuxieme solution')
R2=ang2rot(angle2(1),angle2(2),angle2(3))

pause;
%% Partie 03

P_b=[1 0 1]';
Rab=ang2rot(0,20,0)
disp('Le point P dans le repere A est donnee par : ')
P_a=Rab*P_b

pause;
%% Partie 04
clc
clear all;
display('Entrez les angles d''euler (alpha,beta,gamma)')
alpha=input('alpha : ');
beta=input('beta : ');
gamma=input('gamma : ');
display('La matrice calcule manuellement : ')
R=ang2rot(alpha,beta,gamma)
display('La matrice calcule par la fonction "rpy2tr()" : ')
Tr=rpy2tr(gamma,beta,alpha);Rr=Tr(1:3,1:3)
display('La matrice calcule par les fonctions "rotx(),roty(),rotz()" : ')
Rzyx=rotz(alpha)*roty(beta)*rotx(gamma)

pause;
%%
disp('Les angles calcule a partir de la matrice de rotation precedante')
angles=tr2rpy(R)*180/pi;
display(sprintf('alpha= %f ; beta= %f ; gamma= %f .',angles(3),angles(2),angles(1)))
pause;
%%
Rab=roty(20);P_b=[1 0 1]';P_a=Rab*P_b