syms x 
%exemple avec : f(x)=exp(4x) 
%si tu veux changer de fonction , changes la également dans la fonction
%precision ( g=@(x) f ) sinon tout va bien 
int_trap=trapezes(exp(4*x),0,2,10)
int_simpson=simpson(exp(4*x),0,2,10)
precision_trap_simps(exp(4*x),0,2,8) 