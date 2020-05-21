function r=fcorte(v,fs)
n=length(v);

for i=1:20
    r(i)=sqrt((1/n)*sum(v-filtra(v,fs,i))^2);
end
plot(1:20,r)
