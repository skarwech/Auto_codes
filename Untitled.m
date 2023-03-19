%X=[z ; z' ; teta ; teta']
syms   x1 x2 x3 x4 ;
x=[x1 ; x2 ; x3 ;x4]
A=[0 1 0 0 ; 0 0 -9 0 ; 0 0 0 1;-1 0 0 0]
B=[0 ; 0 ; 0 ; 0.1] 
C=[1 0 0 0 ; 0 0 1 0]
D=0
sys=ss(A,B,C,D) 


Q=20.*[1 0 0 0 ; 0 1 0 0 ; 0 0 20 0; 0 0 0 20] ;
R=0.01; 
[K,P,e]=lqr(A,B,Q,R) ;
klqr=inv(R)*B'*P;
A1=A-B*klqr ;
eig(A-B*K) 
Kd = place(A',C',[-20;-21;-22;-23])
L = Kd'
      
      
 
    

