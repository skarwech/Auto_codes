th = arx2th([1 -1.5 0.7],[0 1 0.5],1,1);
u = idinput(255,'prbs');
y = idsim(th,u);
plot(y);
grid on
pause;
% plot(y)
m = 254;
n = 50;
% on crée la matrice U
U = [];
for i = 1:m-n+1
    for  j = 1:n+1
        U(i,j) = u(m-(i+j-3));
    end 
end
% on cree la matrice Y
Y=[];
for k = 1:m-n+1
   Y(k)=y(m-(k-1));
end
Y = Y';
g = inv(U'*U)*U'*Y;
plot(g)
grid on

