clear;
clc;
close;

A = [0 1 0 0;0 0 -9 0;0 0 0 1;-1 0 0 0] 
B = [0 0 0 0.1]'
C = [1 0 0 0 ; 0 0 1 0]


Q = [1 0 0 0;0 1 0 0; 0 0 20 0; 0 0 0 20]

R = 1

k = lqr(A,B,Q,R)

x_0 =  [20 ,10 , pi/6 , 2]'
