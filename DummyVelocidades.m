figure;
%subplot(3,1,1);
boxplot(lenta,pL)
grid on
title({"Velocidad Lenta normalizada"; "obtenida con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')
saveas(gcf,'TotalLenta.tif')

figure;
%subplot(3,1,2);
boxplot(normal,pN)
grid on
title({"Velocidad Normal normalizada"; "obtenida con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')
saveas(gcf,'TotalNormal.tif')

figure;
%subplot(3,1,3);
boxplot(rapida,pR)
grid on
title({"Velocidad Rápida normalizada"; "obtenida con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')
saveas(gcf,'TotalRapida.tif')

%saveas(gcf,'Vel_Total.tif')