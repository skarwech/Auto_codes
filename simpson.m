function [int] = simpson(f,x0,xn,n)
syms x 
%numeric integration using trapezes method 
%f(x) is the function to integrate 
%a et b are our integration limits ( integrate between a and b) 
%n is the number of iterations 
f=inline(f,'s');
step=(xn-x0)./n;
int=0;
for i=0:n
    if i==0||i==n 
        int=int+f(x0+i.*step) ;
    else
        if mod(i,2)==0 
            int=int+2.*f(x0+i.*step);
        else
            int=int+4.*f(x0+i.*step);
        end
    end
end
int=int.*step./3; 

end

