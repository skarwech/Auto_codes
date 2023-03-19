function m = moments_generalisee(y,t,a,N)
%Cette fonction calcul les moments generalisees avec :
%y : la fonction en question 
%t:notre support temporel 
%a : un parametre strictement positif 
%N : nombre de moments a calculer
n =length(t);
m=[];
for i=0:N-1
 f=(t.^i).*y.*exp(-a.*t);
 m =[m simpson(f,t)];
end

