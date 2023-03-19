% syms a s;
s= tf('s')
% G = [2*a/(s+1) (1-a)/(s+3);2*(1-a)/(s+6) 3*a/(s+1)];
% d = det(G);
% sol = solve(d == 0,s);
% G0 = subs(G,s,0);
% G1 = inv(G0')
% gain = G0.*G1;
% l1 = 54*a^2/(53*a^2+2*a-1);
% l2 = 1 - l1 ;
% fplot(l1)
% grid on
% pause;
% fplot(l2)
% grid on 
% i = -5:0.01:5;
% ll = [];
% for j = i
%     ll = [ll subs(l,a,j)];
% end
% plot(i,ll)
% g11 = subs(G(1,1),s,0);
% g22 = subs(G(2,2),s,0);
% 
% I= (det(G0)/(g11*g22));
% 
% d1 = -G(1,2)/G(1,1);
% d2 = -G(2,1)/G(2,2);
% 
% D = [d1 0;0 d2];

G = 2/(s+1);
R = 9/(2*sqrt(2)) * (1 + 1/((9/110)*s));

sens = 1/(1 + G*R);





