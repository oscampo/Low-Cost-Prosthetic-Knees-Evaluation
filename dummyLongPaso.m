leg='l'
h=1730 ; 

disp('Velocidad lenta !') 
[long.L1 long.l1]=lpaso(leg,h);
[long.L2 long.l2]=lpaso(leg,h);
[long.L3 long.l3]=lpaso(leg,h);

%  [long.L4 long.l4]=lpaso(leg,h);
%  [long.L5 long.l5]=lpaso(leg,h);
%  [long.L6 long.l6]=lpaso(leg,h);

disp('Velocidad Normal !') 
pause;

[long.N1 long.n1]=lpaso(leg,h);
[long.N2 long.n2]=lpaso(leg,h);
[long.N3 long.n3]=lpaso(leg,h);

% 
%  [long.N4 long.n4]=lpaso(leg,h);
%  [long.N5 long.n5]=lpaso(leg,h);
%  [long.N6 long.n6]=lpaso(leg,h);

disp('Velocidad Rápida !') 
pause;

[long.R1 long.r1]=lpaso(leg,h);
[long.R2 long.r2]=lpaso(leg,h);
[long.R3 long.r3]=lpaso(leg,h);

%disp('Otras !') 
%pause;
% 
% [long.R4 long.r4]=lpaso(leg,h);
% [long.R5 long.r5]=lpaso(leg,h);
% [long.R6 long.r6]=lpaso(leg,h);

files = dir('*.mat');
save(files.name,'long','-append')
clear all
close all