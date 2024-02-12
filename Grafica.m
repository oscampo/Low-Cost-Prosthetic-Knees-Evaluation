clear all
%close all
x=0:101/100:100;
str1="C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS";
str2=[" PRIMERA SESION";" SEGUNDA SESION";" TERCERA SESION"];
str3=["\MARLON PRADO";...
    "\DANIEL MUÑOZ";...
    "\LUIS HERNAN LULIGO";...
    "\JULIETH MINA";...
    "\CAMILO GAMBOA";...
    "\HELMUT RUBIO";...
    "\SEBASTIAN YACUMAL"];
P="P1";
leg="TetaL";
range=1:100;
limx=[80 100];
sesion=3;
% FolderPath=[ strcat(str1,str2(1),str3,str2(1));...
% strcat(str1,str2(2),str3,str2(2));...
% strcat(str1,str2(3),str3,str2(3))];

FolderPath = strcat(str1,str2(sesion),str3(sesion),str2(sesion));

%cd(FolderPath(n));
cd(FolderPath);
files = dir('*.mat');
load(files.name);
vel=["L*","N*","R*"];
figure
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
patch([x(range) fliplr(x(range))], [upperBoundary(range)  fliplr(lowerBoundary(range))], lightGray, 'LineStyle', 'none');
hold on
plot(x(range),ymean(range),'k-', 'LineWidth', 1)
ylabel('Grados')
ylim([-15 20])
xlim(limx)
hold off
end
title(s(1),{strcat('Ángulo de Flexión de Rodilla Amputada para  ',P); 'a velocidades Baja, Normal y Rápida'});
xlabel(s(3),'Porcentaje Ciclo de Marcha')
%saveas(gcf,eval(strcat("'Rodilla",P,".tif'")))
%clear all