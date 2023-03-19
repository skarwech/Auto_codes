clear all; clc; clf; close all;

th = arx2th([1 -1.5 0.7],[0 1 0.5],1,1);  %le modele ARX

u = idinput(255,'prbs'); % la SBPA

plot(u)
title('SBPA'); %la forme du SBPA

y = idsim(th,u); %simuler la reponse de systeme avec une entree SBPA

plot(y)
title('la sortie (SBPA)'); %visualiser la reponse (SBPA)

ri = impulse(th); %la reponse impulsionnelle du sys

plot([0:length(ri)-1],ri)
title('la reponse impulsionnelle'); %visualiser la reponse (impul)

U=u;
Y=y;
F = [Y U];
save('DATA','U','Y','rir'); %enregistrer les donnees U,Y et rire dans DATA.maT


clear all; clc; clf; close all;

load DATA; %importation de donnees


n=5;m=4; % on choisi n=2 et m=2

N = 255; %Nombre de points

phi = []; %initialise la matrice phi

for i = 1:N-n  % generation de la matrice phi
    phi = [phi; [fliplr(-Y(N-n-i+1:N-i)'), fliplr(U(N-m-i+1:N-i+1)')]];
end

y = [fliplr(Y(n+1:N)')]'; %generation du vecteur Y

theta = inv(phi' * phi) * phi' * y; %calcule de thêta

a = theta(1:n)' %le coreffisions de A
b = theta(n+1:end)' %le coreffisions de B
th = arx2th([1 a],b,1,1) % generation du systeme
 
yy = idsim(th,U);
figure,plot(yy)
hold on
plot(Y,'--')
title('la réponse du systeme a une SBPA');
legend('la réponse SPBA','la reference');
hold off

yimp = impulse(th);
figure,plot(yimp);
hold on;
plot(ri,'--');
legend('la reponse impul','la reference');
title('la reponse impulsionnelle du systeme');
hold off

sys=poly2th([1 -1.5 0.7],[0 1 0.5],[1 -1 0.2]);
u=idinput(400,'prbs');
e=randn(400,1);
y=idsim([u e],sys);

n = 2;
m = 2;
p = 2;

N = 400;

for i = 0:N-n-1
    for j = 0:n-1
        Phi(i+1,j+1) = -y(N-i-j-1);
    end
    for j = 0:m-1
        Phi(i+1,j+n+1) = u(N-i-j-1);
    end
    for j = 0:p
        Phi(i+1,j+n+m+1) = e(N-i-j);
    end
end
y1= y(n+1:length(y));
y1 = flip(y1);
theta = inv(Phi'*Phi)*Phi'*y1;
a = [1 theta(1:n)'];
b = theta(n+1:n+m)';
c = [1 theta(n+m+1:end)'];


sysob = poly2th(a,b,c);
yimp = impulse(sysob);
yt = impulse(sys);

plot(yimp);
hold on;
plot(yt,'--');
legend('la reponse impul','la reference');
title('la reponse impulsionnelle du systeme bruité');
hold off


