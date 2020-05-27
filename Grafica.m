clear all
x=0:101/100:100;
str1="C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS";
%str2=[" PRIMERA SESION";" SEGUNDA SESION"; " TERCERA SESION"];
str2=" PRIMERA SESION";
str3="\DANIEL MUÑOZ";
% FolderPath=[ strcat(str1,str2(1),str3,str2(1));...
% strcat(str1,str2(2),str3,str2(2));...
% strcat(str1,str2(3),str3,str2(3))];

FolderPath = strcat(str1,str2(1),str3,str2(1));

for n=1:3
cd(FolderPath(n));
files = dir('*.mat');
load(files.name);
y=[L1.TetaL';L2.TetaL';L3.TetaL'];
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
title(s(1),{'Ángulo de Flexión de Rodilla Amputada para P1'; 'a velocidades Baja, Normal y Rápida'});
xlabel(s(3),'Porcentaje Ciclo de Marcha')