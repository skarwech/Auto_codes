clear all; clc; clf; close all;

load DATA; %importation de donnees

%% 

n=15;m=15; % on choisi n=2 et m=2

N = 255; %Nombre de points

phi = []; %initialise la matrice phi

for i = 1:N-n  % generation de la matrice phi
    phi = [phi; [fliplr(-Y(N-n-i+1:N-i)'), fliplr(U(N-m-i+1:N-i+1)')]];
end

y = [fliplr(Y(n+1:N)')]'; %generation du vecteur Y

theta = inv(phi' * phi) * phi' * y; %calcule de thêta

a = theta(1:n)' %le coreffisions de A
b = theta(n+1:end)' %le coreffisions de B
th = arx2th([1 a],b,1,1); % generation du systeme

%% comparer la reponse a une SBPA du systeme trouvé avec celle du systeme reel 
yy = idsim(th,U);
figure,plot(yy)
hold on
plot(Y,'--')
title('la réponse du systeme a une SBPA');
legend('la réponse SPBA','la reference');
hold off

%% comparer la reponse impulsionnelle du systeme trouvé avec celle du systeme reel
yimp = impulse(th);
figure,plot(yimp);
hold on;
plot(rir,'--');
legend('la reponse impul','la reference');
title('la reponse impulsionnelle du systeme');
hold off



