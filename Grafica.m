clear all
close all
x=0:101/100:100;
str1="C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS";
%str2=[" PRIMERA SESION";" SEGUNDA SESION"; " TERCERA SESION"];
str2=" TERCERA SESION";
str3="\JULIETH MINA";
leg="TetaL";
% FolderPath=[ strcat(str1,str2(1),str3,str2(1));...
% strcat(str1,str2(2),str3,str2(2));...
% strcat(str1,str2(3),str3,str2(3))];

FolderPath = strcat(str1,str2(1),str3,str2(1));

%cd(FolderPath(n));
cd(FolderPath);
files = dir('*.mat');
load(files.name);
vel=["L*","N*","R*"];
for n=1:3
y=[];
speed=who(vel(n));
for j=1:size(speed,1)
y=[y;eval(strcat(speed{j},".",leg))'];
end

ymean=mean(y);
upperBoundary = max(y);
lowerBoundary = min(y);
lightGray = [0.8, 0.8, 0.8];
%figure

s(n)=subplot(3,1,n);
grid on; 
patch([x fliplr(x)], [upperBoundary  fliplr(lowerBoundary)], lightGray, 'LineStyle', 'none');
hold on
plot(x,ymean,'k-', 'LineWidth', 1)
ylabel('Grados')
hold off
end
title(s(1),{'Ángulo de Flexión de Rodilla Amputada para P7'; 'a velocidades Baja, Normal y Rápida'});
xlabel(s(3),'Porcentaje Ciclo de Marcha')