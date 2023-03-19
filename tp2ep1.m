% aimant permanant

Rs = 1.4; 
Ld = 0.0066;
Lq = 0.0058;
Phf = 0.1546;
J=0.00146;
F=0.00038818;
P=3;

% Rs=0.6;
% Ld=1.4e-3;
% Lq=0.8e-3;
% F=0.0014;
% J=0.02;
% P=4; 
% Phf = 0.2;

phf=[0 ; Phf];
R=[Rs 0; 0 Rs ];


A=[0 -Lq  ; Ld 0 ];
L=[Ld 0 ; 0 Lq ];