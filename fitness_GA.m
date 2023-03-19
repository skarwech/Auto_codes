function I = fitness_GA(a, NameSim, varargin)
%Calcule de la fonction cout et simulation pour chaque individu 
LoadParamV1(a,varargin{:,:});
[t,xy,yx] =sim(NameSim);

I=error_quad; %Fonction cout 



function LoadParamV1(X,varargin)
Nparam=length(varargin{:,:});
dd=varargin{:,:};
if Nparam~=length(X)
    error('La dimention d''entrées/sorties ne sont pas les mêmes .')
else
    for i=1:length(X)
        assignin('base',dd{i} ,X(i))
    end
end