A = [0 1 2/3;-1 -2 1;0 -3 1];
B = [1;2;3];
C = [0 1 0];
syms s;

C*inv(s*eye(3)- A)*B

a1 = [-10; -10+5j; -10-5j];
a2 = [-15; -15+5j; -15-5j];

K = place(A,B,a1);
L = place(A',C',a2)';

A1 = A-B*K;
A2 = A-L*C;
A3 = B*K;

C1 = [0 1 0 0 0 0];
B1 = [1 2 3 0 0 0]';

Abf = [A1 A3;zeros(3) A2];

P = 1/(C1*inv(-Abf)*B1)
