clear all
close all

str1="C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS";
str2=" TERCERA SESION";
str3=["\MARLON PRADO";...
    "\DANIEL MUÑOZ";...
    "\LUIS HERNAN LULIGO";...
    "\JULIETH MINA";...
    "\CAMILO GAMBOA";...
    "\HELMUT RUBIO";...
    "\SEBASTIAN YACUMAL"];
weight=[79, 60, 60, 56, 75, 70, 76];
leg=["l","l","l","l","l","r","r",];
for n=1:3
    for p=7:7%1:size(str3,1)
        FolderPath = strcat(str1,str2,str3(p),str2(1));
        cd(FolderPath);
        files = dir('*.mat');
        load(files.name);
        L=who('-regexp','^L\d{1}$');
        L=size(L,1);
        N=who('-regexp','^N\d{1}$');
        N=size(N,1);
        R=who('-regexp','^R\d{1}$');
        R=size(R,1);
        CalculaGRF(char(FolderPath), weight(p),leg(p));
    end
end


figure
plot(pks{1}(:,1),pks{1}(:,2))
hold on
plot(pks{2}(:,1),pks{2}(:,2))
plot(pks{3}(:,1),pks{3}(:,2))

figure
hold on
plot(pks{4}(:,1),pks{4}(:,2))
plot(pks{5}(:,1),pks{5}(:,2))
plot(pks{6}(:,1),pks{6}(:,2))

figure
hold on
plot(pks{7}(:,1),pks{7}(:,2))
plot(pks{8}(:,1),pks{8}(:,2))
plot(pks{9}(:,1),pks{9}(:,2))