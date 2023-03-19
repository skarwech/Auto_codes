function []=precision_trap_simps(f,x0,xn,z)
syms x 
g=@(x) exp(4*x)
F=integral(g,x0,xn);
Xtrap=[];
Ytrap=[];
Xsimp=[];
Ysimp=[];
for j=1:z
    Xtrap=[Xtrap j];
    Ytrap=[Ytrap trapezes(f,x0,xn,j)];
    
    if mod(j,2)==0
        Xsimp=[Xsimp j];
        Ysimp=[Ysimp simpson(f,x0,xn,j)];
    else 
        Xsimp=Xsimp;
        Ysimp=Ysimp;
    end    
end
Ytrap=abs((Ytrap-F)./F);
Ysimp=abs((Ysimp-F)./F);
subplot(1,2,1)
plot(Xtrap,Ytrap)
xlabel('Nombre d iteration ')
ylabel('precision relative ')
title('Precision methode de trapezes')
subplot(1,2,2)
plot(Xsimp,Ysimp)
xlabel('Nombre d iteration ')
ylabel('precision relative ')
title('Precision methode de simpson')
end



   
        
