xi=[0,5773502692 -0,5773502692 0,7745966692 0 -0,7745966692 0,8611363116 0,3399810436 -0,3399810436 -0,8611363116 0,9061798459 0,53846931010 0 -0,53846931010 -0,9061798459];
ci=[1 1 0,555555555556 0,888888889 0,555555555556 0,3478548451 0,6521451549 0,6521451549 0,3478548451 0,2369268850 0,4786286705 0,5688888889 0,4786286705 0,2369268850];
n=input('donne le nombre des point compremé entre [2,5] n=');
f=@(x) exp(10*x) ;
I=0;
if n==2
    for i=1 : 2
        I=I+ci(i)*f(xi(i));
    end
    fprintf('la valeur dntegrale est I=%f',I);
end
if n==3
    for i=3 : 5
        I=I+ci(i)*f(xi(i));
    end
    fprintf('la valeur dntegrale est I=%f',I);
end
if n==4
    for i=6 : 9
        I=I+ci(i)*f(xi(i));
        
    end
    fprintf('la valeur dntegrale est I=%f',I);
end
if n==5
    for i=10 : 14
        I=I+ci(i)*f(xi(i));
        
    end
    fprintf('la valeur dntegrale est I=%f',I);
end
               
               
           
    
    

