% th = arx2th([1 -1.6 0.8],[0 1.1 0.4],1,1);
% u = idinput(255,'prbs');
% y = idsim(th,u);
% % plot(y)
% % grid on
% % pause;
% 
m = 2;
n = 2;
N = 255;
% x = [];
% z = [];
% for i = 1:N-n
%     for j = 1:n
%         z(i,j) = y(N-(i+j-1));
%     end
% end
% for h = 1:N-n
%     for k = 1:m
%         x(h,k) = u(N-(h+k)+1);
%     end
% end
% Y = [];
% for r = 1:N-n
%     Y(r) = y(N-r+1);
% end
% Y = Y';
% phi = [-z x];
% teta = inv(phi'*phi)*phi'*Y
% th2 = arx2th([1 teta(1) teta(2)],[0 teta(3) teta(4)],1,1);
% y2 = idsim(th2,u);
% plot(y2)
% grid on
modele = poly2th([1 -1.6 0.8],[0 1.1 0.4],[1 -1 0.2]);
u2 = idinput(255,'prbs');
e = randn(255,1);
y2 = idsim([u2,e],modele);
i1  = impulse(modele);
x2 = [];
z2 = [];
for i = 1:N-n
    for j = 1:n
        z2(i,j) = y2(N-(i+j-1));
    end
end
for h = 1:N-n
    for k = 1:m
        x2(h,k) = u2(N-(h+k)+1);
    end
end
Y2 = [];
for r = 1:N-n
    Y2(r) = y2(N-r+1);
end
Y2 = Y2';
phi2 = [-z2 x2];
teta3 = [-1.6 0.8 1.1 0.4]';
teta2 = inv(phi2'*phi2)*phi2'*Y2;
modele2 = arx2th([1 teta(1) teta(2)],[0 teta(3) teta(4)],1,1);
y3 = idsim(u2,modele2);
err = teta3 - teta2;
% grid on 
% hold on 
% plot(y2)
% plot(y3)
% hold off
i1 = impulse(modele);
i2 = impulse(modele2);
grid on 
hold on 
plot(i1)
plot(i2)
hold off



