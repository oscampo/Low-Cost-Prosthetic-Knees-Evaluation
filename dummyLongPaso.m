leg='r'
h=1900 ; 

disp('Velocidad lenta !') 

long.L1=lpaso(leg,h);
long.L2=lpaso(leg,h);
long.L3=lpaso(leg,h);

long.L4=lpaso(leg,h);
% long.L5=lpaso(leg,h);
% long.L6=lpaso(leg,h);

disp('Velocidad Normal !') 
pause;

long.N1=lpaso(leg,h);
long.N2=lpaso(leg,h);
long.N3=lpaso(leg,h);

% long.N4=lpaso(leg,h);
% long.N5=lpaso(leg,h);
% long.N6=lpaso(leg,h);

disp('Velocidad Rápida !') 
pause;

long.R1=lpaso(leg,h);
long.R2=lpaso(leg,h);
long.R3=lpaso(leg,h);

%disp('Otras !') 
%pause;

% long.R4=lpaso(leg,h);
% long.R5=lpaso(leg,h);
% long.R6=lpaso(leg,h);

files = dir('*.mat');
save(files.name,'long','-append')
clear all
close all