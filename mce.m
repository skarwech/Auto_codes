function [a b c]= mce(n,m,p,y,u,e,N)
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
end