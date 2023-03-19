clear, clc;
%on déclare les fonctions de transfert
ft1 = tf(16, [1 3 16])
ft2 = tf(0.04, [1 0.02 0.04])
pause;
%on identifie les pulsations
%la pulsation d'un système du second ordre est la racine du dernier terme
%du denominateur de la fonction de transfert
w1 = sqrt(16)
w2 = sqrt(0.04)
pause;
%le deuxieme terme du denominateur d'une fonction de transfert du second
%ordre est définie par 2*ksi*w, donc on calcul les ksi
disp('on calcul ksi à travers la relation b ( deuxieme terme du denominateur) sur 2*w')
ksi_1 = 3/(2*w1)
ksi_2 = 0.02/(2*w2)
pause;
%on cherche les TS
TS_1 = 4/(w1*ksi_1)
TS_2 = 4/(w2*ksi_2)
pause;
%on calcul les pseudo périodes
TR_1 = 2*pi/(w1*sqrt(1-ksi_1^2))
TR_2 = 2*pi/(w2*sqrt(1-ksi_2^2))
pause;
%on calcul maintenant les dépassement
OS_1 = 100*exp(-ksi_1*pi/sqrt(1-ksi_1^2))
OS_2 = 100*exp(-ksi_2*pi/sqrt(1-ksi_2^2))
pause;
%on représente les réponses indicielles
t1 = 0:0.01:5;
y1 = step(ft1,t1);
plot(t1,y1,'red')
grid on
pause;
t2 = 0:1:500;
y2 = step(ft2,t2);
plot(t2,y2,'green')
grid on




