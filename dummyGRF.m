% i=6;
% w=60;
% c3d = ezc3dRead('C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS TERCERA SESION\LUIS HERNAN LULIGO TERCERA SESION\IZQ NORMAL D3.c3d');
% rate=c3d.header.analogs.frameRate;
% FP=7;
% grf=sqrt(c3d.data.analogs(:,FP).^2+c3d.data.analogs(:,FP+1).^2+c3d.data.analogs(:,FP+2).^2);
%     rango=find(grf>10);
% grf=grf(rango);
% time = (1:size(grf,1))./rate;
% F{i}=[time',grf./(w*9.81)];
% pks{i}=F{i};
% files2 = dir('*.mat');
% save(files2.name,'pks','-append')

figure;
subplot(3,1,1);
boxplot(GRF_L(:,2),pL)
grid on
title({"Fuerza de Reacción Normalizada medida a Velocidad Baja"; "con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')

subplot(3,1,2);
boxplot(GRF_N(:,2),pN)
grid on
title({"Fuerza de Reacción Normalizada medida a Velocidad Normal"; "con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')

subplot(3,1,3);
boxplot(GRF_R(:,2),pR)
grid on
title({"Fuerza de Reacción Normalizada medida a Velocidad Rápida"; "con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')

%saveas(gcf,'GRF_Total.tif')