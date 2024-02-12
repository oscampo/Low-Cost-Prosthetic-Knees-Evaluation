function f=filtra(vector,fs,fc)
% C es el factor de corrección
% Para un filtro de una sola pasada C=1
% en general C = (2^(1/n)-1)^0.25, donde n es el número de pasadas

C = 1;
wc=tan(pi*(fc/fs))/C;
k1=wc*sqrt(2);
k2=wc^2;
a0=k2/(1+k1+k2);
a1=2*a0;
a2=a0;
k3=a1/k2;
b1=-a1+k3;
b2=1-a1-k3;
f=vector;

for i=3:length(vector)
    f(i)=a0*vector(i)+a1*vector(i-1)+a2*vector(i-2)+b1*f(i-1)+b2*f(i-2);
end
% Debido a las características de retardo de fase del filtro, 
% se realiza un segundo refiltrado en la dirección inversa en el tiempo, 
% lo que da como resultado un filtro con retardo cero de cuarto orden.
vector=fliplr(f);
for i=3:length(vector)
    f(i)=a0*vector(i)+a1*vector(i-1)+a2*vector(i-2)+b1*f(i-1)+b2*f(i-2);
end