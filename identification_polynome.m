function G = identification_polynome(fe,te,fs,ts,a,n)
Me=moments_generalisee(fe,te,a,2*n);
Ms=moments_generalisee(fs,ts,a,2*n);
Mh=Moment_impulsionnelle(Me,Ms);
% La matrice B : 
for j=n:-1:1
B(n,j)=a^(n-j);
end
for i=n-1:-1:1
for j=i:-1:1
B(i,j)=factorial(n-j)/factorial(i-j)*a^(i-j);
end
end
%Generation de la matrice B :
for j=2*n:-1:n
A(2*n,j)=a^(2*n-j);
end
for i=2*n-1:-1:n
for j=i:-1:n
A(i,j)=factorial(2*n-j)/factorial(i-j)*a^(i-j);
end
end
%Generation de la matrice M: 
for i=1:2*n
for j=i:2*n
    M(i,j)=(-1)^(j-i)*nchoosek(2*n-i,j-i)*Mh(j-i+1);
end
end
MA=M*A;
a1=zeros(n-1,1);
a1(n,1)=1;
L1=MA(1:n,1:n);
L2=MA(1:n,n+1:2*n);
L3=MA(n+1:2*n,1:n);
L4=MA(n+1:2*n,n+1:2*n);
a2=-inv(L2)*L1*a1;
b2=B\(L3*a1+L4*a2);
a2=a2';
b2=b2';
G=tf(b2,[1 a2]);
end

