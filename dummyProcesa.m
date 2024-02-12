[TetaR, TetaL,VelR, VelL, AcelR, AcelL]=Procesa('R');
N3.TetaR=TetaR;
N3.TetaL=TetaL;
N3.VelR=VelR;
N3.VelL=VelL;
N3.AcelR=AcelR;
N3.AcelL=AcelL;
files = dir('*.mat');
save(files.name,'N3','-append')
clear all
close all

