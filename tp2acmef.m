s = tf('s');
Gn = 2*pi/s^2;
dG = 4*pi/(s^2+0.707*s+28);

%R = 500*(s+10)/(s+100);
R = 5*10^(-4)*(s+0.01)/(s+0.1);
Gbo = R*Gn;
Sy = 1/(1+Gbo);
Ty = 1 - Sy;
RSy = R*Sy;
SyGn = Sy*Gn;
sigma(Sy,Ty,RSy,SyGn)
sigma(Sy)
grid on
pause;

sigma(Ty)
grid on
pause;

sigma(RSy)
grid on
pause;

sigma(SyGn)
grid on

pause;

Gr = Gn + dG;
bode(dG)
title('diagramme réquenciel de l"erreur de modélisation')
grid on
pause;
sigma(RSy*dG)
grid on

sigma(dG*Ty)
grid on

