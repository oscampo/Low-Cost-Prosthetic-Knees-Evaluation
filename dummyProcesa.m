[TetaR, TetaL,VelR, VelL, AcelR, AcelL]=Procesa('r');
R3.TetaR=TetaR;
R3.TetaL=TetaL;
R3.VelR=VelR;
R3.VelL=VelL;
R3.AcelR=AcelR;
R3.AcelL=AcelL;
files = dir('*.mat');
save(files.name,'R3','-append')
clear all
close all

