function I=fit_GA(X)

Param={'kp1','ki1','kd1','kp2','ki2','kd2'};
NameSim='trms1';
 % boucle de simulation d'unegeneration
for i=1:size(X,1)
I(i)=fitness_GA(X(i,:),NameSim,Param);
end
