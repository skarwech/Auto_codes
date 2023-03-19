%do_fdf to solve BVP2 by the finite difference method

clear, clf
t0 = 1; x0 = 5; tf = 2; xf = 3; N = 100;
a1 = inline('2./t','t'); a0 = inline('-2./t./t','t'); u = 0; %Eq.(6.6.10)
[tt,x] = bvp2_fdf(a1,a0,u,t0,tf,x0,xf,N);

%use the MATLAB built-in command ’bvp4c()’

df = inline('[x(2); 2./t.*(x(1)./t - x(2))]','t','x');
fbc = inline('[x0(1) - 5; xf(1) - 3]','x0','xf');
solinit = bvpinit(linspace(t0,tf,5),[1 10]);

%initial solution interval

sol = bvp4c(df,fbc,solinit,bvpset('RelTol',1e-4));
x_bvp = deval(sol,tt); xbv = x_bvp(1,:)';

%use the symbolic computation command ’dsolve()’

xo = dsolve('D2x + 2*(Dx - x/t)/t=0','x(1) = 5, x(2) = 3')
xot = subs(xo,'t',tt); 

%xot=4./tt./tt +tt; 
%true analytical solution

err_fd = norm(x - xot)/(N+1)

%error between numerical/analytical solution

err_bvp = norm(xbv - xot)/(N + 1)
plot(tt,x,'b',tt,xbv,'r',tt,xot,'k')

%compare with analytical solution