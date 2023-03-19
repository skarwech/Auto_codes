clear,clc

num1 = 10;
den1 = [1 2 10];
num2 = 15;
den2 = [1 1 15];
num3 = [9 2];
den3 = [1 0.8 5 1];
num4 = [1 1];
den4 = [1 2 2 7];

printsys(num1,den1)
printsys(num2,den2)
printsys(num3,den3)
printsys(num4,den4)

t = 0:0.1:10;

y1 = step(num1,den1,t);
y2 = step(num2,den2,t);
y3 = step(num3,den3,t);
y4 = step(num4,den4,t);
plot(t,y1,t,y2,t,y3,t,y4)
legend('F(s)','H(s)','G(s)','T(s)')
grid on


