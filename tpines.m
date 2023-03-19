% partie 1 
p = tf('p');
G1 = 1/(1+0.5*p);
G2 = 0.8/(1+0.5*p);
G3 = 0.5/(1+0.5*p);

t = 0:0.1:10;
y1 = step(G1,t);
y2 = step(G2,t);
y3 = step(G3,t);

plot(t,y1,t,y2,t,y3)
grid on
pause ;

G4 = 1/(1+0.5*p);
G5 = 1/(1+1.5*p);
G6 = 1/(1+3.5*p);

t = 0:0.1:10;
y4 = step(G4,t);
y5 = step(G5,t);
y6 = step(G6,t);

plot(t,y4,t,y5,t,y6)
grid on
pause;

%partie 2 
H1 = 200^2/((p^2) + 2*0.1*200*p + 200^2);
H2 = 200^2/((p^2) + 2*0.5*200*p + 200^2);
H3 = 200^2/((p^2) + 2*(sqrt(2)/2)*200*p + 200^2);
H4 = 200^2/((p^2) + 2*1*200*p + 200^2);
H5 = 200^2/((p^2) + 2*2*200*p + 200^2);

t2 = 0:0.001:0.3 ;
z1 = step(H1,t2);
z2 = step(H2,t2);
z3 = step(H3,t2);
z4 = step(H4,t2);
z5 = step(H5,t2);

plot(t2,z1,t2,z2,t2,z3,t2,z4,t2,z5)
grid on
pause;

H6 = 200^2/((p^2) + 2*0.43*200*p + 200^2);
H7 = 2*(200^2)/((p^2) + 2*0.43*200*p + 200^2);
H8 = 3*(200^2)/((p^2) + 2*0.43*200*p + 200^2);

z6 = step(H6,t2);
z7 = step(H7,t2);
z8 = step(H8,t2);

plot(t2,z6,t2,z7,t2,z8)
grid on