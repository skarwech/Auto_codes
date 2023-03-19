clear;
clc;
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
theta = inv(Phi'*Phi)*Phi'*y1
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
