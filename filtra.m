function f=filtra(vector,fs,fc)
wc=tan(pi*(fc/fs));
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


