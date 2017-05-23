clc
clear

%Permeabilidade do Vácuo

mu0 = pi*4.e-7;

%Dimensões em metros:

Ac=9e-4;
Ag=9e-4;
g = 5e-4;
lc = 0.3;

N = 500;

%Relutância do entreferro

Rg = g/(mu0*Ag);

for(n=1:101)
  mur(n) = 100 + (100000 - 100)*(n-1)/100;
  Rc(n) = lc/(mur(n)*mu0*Ac);
  Rtot = Rg + Rc(n)
  
  L(n) = (N^2)/Rtot
end

plot(mur,L)
xlabel('Permeabilidade relativa do núcleo')
ylabel('Indutância [H]')