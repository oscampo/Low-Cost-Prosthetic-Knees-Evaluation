figure;
subplot(3,1,1);
boxplot(lenta,pL)
grid on
title({"Velocidad de marcha Lenta en m/s"; "con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')

subplot(3,1,2);
boxplot(normal,pN)
grid on
title({"Velocidad de marcha Normal en m/s"; "con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')

subplot(3,1,3);
boxplot(rapida,pR)
grid on
title({"Velocidad de marcha Rápida en m/s"; "con las Rodillas Propia (1), ATK-PA-01 (2) y 3P26 (3) para cada Paciente"});
xlabel('Pacientes')

saveas(gcf,'Vel_Total.tif')