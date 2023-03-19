% rotor bobiné
clc;
clear;
Vf=220;
Rs=0.48;
J=0.263;
F=0;
P=3;
Rf=125;
Mf=0.0236;
Ld=0.00231;
Lq=0.00231;
Lf=0.924;

R=[Rs 0 0 ; 0 Rs 0 ; 0 0 Rf];
L=[Ld 0 Mf ; 0 Lq 0 ; Mf 0 Lf];
A=[0 -Lq 0 ; Ld 0 Mf ; 0 0 0];