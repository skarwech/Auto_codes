function M = Moment_impulsionnelle(Me,Ms)
%Cette fonction calcul les moments a partir des moments d'entrée et de sortie:
n=length(Ms);
M=Ms(1)/Me(1);
for k=1:n-1
S=0;
for i=0:k-1
S=S+nchoosek(k,i)*M(i+1)*Me(k-i+1);
end
M=[M (Ms(k+1)-S)/Me(1)];
end


