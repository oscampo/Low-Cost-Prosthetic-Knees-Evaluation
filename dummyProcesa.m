[TetaR, TetaL,VelR, VelL, AcelR, AcelL]=Procesa('l');
L1.TetaR=TetaR;
L1.TetaL=TetaL;
L1.VelR=VelR;
L1.VelL=VelL;
L1.AcelR=AcelR;
L1.AcelL=AcelL;
files = dir('*.mat');
save(files.name,'L1','-append')
clear all
close all

