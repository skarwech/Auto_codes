clear all;clc

gama1=[0 0 0 0 0 0];
gama2=[100 100 100 100 100 100];

ConstraintFunction = [];    
options = gaoptimset('Generations',100,'PopulationSize',20,'StallGenLimit',inf,...
'StallTimeLimit',inf,'TolFun',1e-12,'TolCon',1e-12,'plotfcns',{@gaplotbestf});%,@gaplotbestindiv
[x,fval]=ga(@fit_GA,6,[],[],[],[],gama1,gama2,ConstraintFunction,options);

x
fvall