% TP 3 RPI 
%% Partie 1 : Correcteur P
%% Fonction G1
s = tf('s');
G1 = tf(0.1, [4 112/5 61/5 1])
margin(G1)
grid on
%%
% Après compensation de 10p + 1
T1 = 10;
T2 = 10^(21/20)/6;
Ti = 0.01;
C1 = (1+T1*s)/(Ti*s);

C2 = (1+T1*s)*(1+T2*s)/(Ti*s);


G1c = C2*G1

margin(G1c)
grid on 

%% Correcteur parallèle G1
Td = 1870
Ti = 0.01
Kp = 1187


C_pid = Kp + 1/(Ti*s) + Td*s

G1c_pid = C_pid*G1

margin(G1c_pid)
hold on 
margin(G1c)
grid on 

%% Boucle fermée 
F1 = feedback(G1c,1)
step(F1)
hold on
fplot(1- 1*0.05, 'r')
fplot(1+ 1*0.05, 'r')
grid on 
%%
T1 = 10;
T2 = 10^(11.3/20)/3.81;
Ti = 0.01;
C1 = (1+T1*s)/(Ti*s);

C2 = (1+T1*s)*(1+T2*s)/(Ti*s);


G1c = C2*G1
% nichols(G1c)
margin(G1c)
grid on 

%% Fonction G2 - avance-retard de pahase
s = tf('s');
G2 = tf(0.1, [4 112/5 61/5 1])
margin(G2)
grid on
%%
wmax = 4.6
Kp = 9990
b = 10^(32/20)
T2 = 10*1/wmax
T2 = 1.22*T2
a = (1+sin(85*pi/180))/(1-sin(85*pi/180))
T1 = 1/(sqrt(a)*wmax)

% 
C = Kp*(1+a*T1*s)*(1+T2*s)/((1+b*T2*s)*(1+T1*s))

Gc2 =C*G2
margin(Gc2)
grid on


%% Boucle fermée 
F2 = feedback(Gc2,1)
step(F2)
hold on
fplot(1- 1*0.05, 'r')
fplot(1+ 1*0.05, 'r')
grid on 


