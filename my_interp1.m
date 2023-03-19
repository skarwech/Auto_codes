function yi = my_interp1(x,y,xi)
% yi=my_interp1(x,y,xi) est une fonction d'interpolation linaire qui calcule la
% valeur de yi=f(xi). Les vecteurs x et y doivent etre de la meme taille. xi doit
% etre dans l'interval [x(1),x(n)]où n est la longueur desvecteurs x et y.

% test du nombre d'arguments d'entrée
if nargin~=3
    error('Le nombre darguments dentrée est incorrecte')
end
% test du nombre d'arguments de sortie
if nargout>1
    error('Le nombre d''arguments de sortie est incorrecte')
end
% test de la taille des vecteurs x et y
if length(x)~=length(y)
    error('Les vecteurs x et y doivent etre de la meme taille')
end
% test d'appartenance de xi
n = 1;
for k = 1:length(xi)
    if xi(k)<x(1)||xi(k)>x(end)
        error('xi est hors interval')
    else 
        v(n) = xi(k);
        n = n+1;
    end
end
xi = v;
% Interpolation d'interpolation linéaire
r = 1;
for k = 1:length(xi)    
    for i=1:length(x)-1
       if (xi(k)>=x(i))& (xi(k)<=x(i+1))
        yi(r)=y(i)+(y(i+1)-y(i))*(xi(k)-x(i))/(x(i+1)-x(i));
        r = r+1;
       end
    end
end 
