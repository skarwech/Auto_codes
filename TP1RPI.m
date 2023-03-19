% TP 1 RPI
%% Partie 1 : Correcteur P 
%% Fonction G1
s = tf('s');
G1 = tf(1, [0.5 1 0])
% margin(G1)
% nichols(G1)
% grid on

% Valeur déduite à travers le lieu de Bode
Kp = 10^(9.05/20)

% Fonction de transfert corrigée
Tc1 = Kp*G1
% margin(Tc1)
% grid on
% 
% Boucle fermée 
F1 = feedback(Tc1,1);
step(F1)
hold on
fplot(1.05,'r')
fplot(0.95,'r')
hold off
grid on 

%% Fonction G2
s = tf('s');
G2 = tf(2, [0.2^3 3*0.2^2 0.6 1])
% margin(G2)
nichols(G2)
grid on
%%
Ff2 = feedback(G2,1)
step(Ff2)
grid on 
%%
% Valeur déduite à travers le lieu de Bode
Kp = 10^(-10.97/20)

% Fonction de transfert corrigée
Tc2 = Kp*G2
margin(Tc2)
%  grid on
%%
% Boucle fermée 
F2 = feedback(Tc2,1) 
step(F2)
hold on
y1 = 0.74 + 0.74*0.05;
y2 = 0.74 - 0.74*0.05;
fplot(y1,'r')
fplot(y2,'r')
% plot(0.74- 0.74*0.05, 'r')
hold off
grid on



%% Partie 2 : Correcteur PI
%% Fonction G3
s = tf('s');

G3 = tf(15, [0.001 0.11 1])
Kp = 1
Ti = 0.1
C =Kp*(1+Ti*s)/(Ti*s)
Tc = C*G3
margin(Tc)
% nichols(Tc)
grid on
%%
% Valeur déduite à travers le lieu de Bode
Kp = 10^(1.8/20)

% Fonction de transfert corrigée
Tc3 = Kp*G3
margin(Tc3)
grid on
%%
% Boucle fermée 
F3 = feedback(Tc3,1) 
step(F3)
hold on
fplot(0.95*1.05, 'r')
fplot(0.95*0.95, 'r')
grid on 
hold off


%% Fonction G4 
s = tf('s');

G4 = tf(10, [0.2^3 3*0.2^2 0.6 1])
% Kp = 1
Ti = 0.2

Kp = 10^(-26.28/20)
C =Kp*(1+Ti*s)/(Ti*s)
Tc4 = C*G4


margin(Tc4)
grid on
%%
% Boucle fermée 
F4 = feedback(Tc4,1) 
step(F4)
hold on
fplot(1+ 1*0.05, 'r')
fplot(1- 1*0.05, 'r')
grid on 
%% Fonction G5
s = tf('s');

G5 = tf(0.1 , [1/40000, 3/800, 27/200, 1])
% x = 0.04939
x = 0.03
Kp = (1-x)/(x*0.1)
b = 10^(16.8/20)
% To = 5/32.5
To = 0.35
C =Kp*(1+To*s)/(1+To*b*s)

Tc5 = C*G5
margin(Tc5)
grid on
%%
% Boucle fermée 
F5 = feedback(Tc5,1) 
step(F5)
hold on
fplot(0.961*1.05, 'r')
fplot(0.961*0.95, 'r')
grid on 
hold off
%% Fonction G6
s = tf('s');

G6 = tf(0.1 , [1/40000, 3/800, 27/200, 1]) 
x = 0.03
Kp = (1-x)/(x*0.1)
b = 10^(32.3/20)
To = 0.1
C =Kp*(1+To*s)/(1+To*b*s)

Tc6 = C*G6

margin(Tc6)
grid on
%%
% Boucle fermée 
F6 = feedback(Tc6,1) 
step(F6)
hold on
fplot(0.967*0.95, 'r')
fplot(0.967*1.05, 'r')
grid on 
%%
syms b w

s = vpasolve([(1+(0.01*w)^2)*(1+(0.025*w)^2)*(1+(0.1*b*w)^2) == 32.333^2, atan(0.01*w)+atan(0.025*w)+atan(0.1*b*w) == 3*pi/4 ],[b,w])
b=s.b
w=s.w
%%
s = tf('s');

G6 = tf(0.1 , [1/40000, 3/800, 27/200, 1]) 
x = 0.03
Kp = (1-x)/(x*0.1)
To = 0.1
C =Kp*((1+To*s)/(1+To*double(b)*s))

Tc6 = C*G6

% margin(Tc6)
% grid on

