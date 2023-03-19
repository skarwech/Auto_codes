th = arx2th([1 -1.5 0.7],[0 1 0.5],1,1);
u = idinput(255,'prbs');
y = idsim(th,u);

n = 25;
m = 255;
U = [];
Y = [];
for k =m:-1:n+1
    Y = [Y;y(k)];
end
 
for i= 1:m-n
    for j = 1:n
       U(i,j)= u(m -(i+j)+1);
    end
end 

g = inv(U'*U)*U'*Y;
plot(g)

