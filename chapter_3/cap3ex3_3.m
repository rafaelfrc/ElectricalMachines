clc
clear

%dados

xdata = [0:0.2:2];
Ldata = [2.8 2.26 1.78 1.52 1.34 1.26 1.20 1.16 1.13 1.11 1.10];

%Convertendo para SI

x = xdata*1e-2;
L = Ldata*1E-3;

len = length(x);
xmax = x(len);

%Ajuste de ordem 4 com polyfit. Os coeficientes estarão armazenados no vetor a.

a = polyfit(x,L,4);

for n = 1:101
   xfit(n) = xmax*(n-1)/100;
   Lfit(n) = a(1)*xfit(n)^4 + a(2)*xfit(n)^3 + a(3)*xfit(n)^2 + a(4)*xfit(n) + a(5);
end

%Plote os dados e em seguida o ajuste para comparação (converta xfit para cm e Lfit para mH)

plot(xdata, Ldata, '*')
hold
plot(xfit*100, Lfit*100)
hold
xlabel('x [cm]')
ylabel('y [mH]')

fprintf('\n Pausa. Aperte qualquer tecla para plotar a força. \n')
pause;

%Plote a força: \frac{i^2}{2}\frac{dL}{dx} = \frac{i^2}{2}(4a(1)x(3) + ... +a(4))

%Inicialize a corrente com 0,75A
I = 0.75;

for n = 101
   xfit(n)=0.002 + 0.016*(n-1)/100;
   F(n) = 4*a(1)*xfit(n)^3 +3*a(2)*xfit(n)^2 + 2*a(3)*xfit(n) + a(4);
   F(n) = (I^2/2)*F(n);
end

plot (xfit*100,F)
xlabel('x [cm]')
ylabel('Força [N]')

