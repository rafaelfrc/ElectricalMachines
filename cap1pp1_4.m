clc
clear

%Permeabilidade do Vácuo

mu0 = pi*4.e-7;
mur = 70000

%Dimensões em metros:

Ac=9e-4;
Ag=9e-4;
lc = 0.3;

N = 500;

%Relutância do núcleo

Rc = lc/(mu0*Ac*mur);


%Relutãncia do entreferro
for(n=1:101)
  g(n) = 0.01 + (0.1 - 0.01)*(n-1)/100;
  Rg(n) = g(n)/(mu0*Ag);
  Rtot = Rg(n) + Rc;
  
  L(n) = (N^2)/Rtot;
end

plot(g,L)
xlabel('Gap')
ylabel('Indutância [H]')