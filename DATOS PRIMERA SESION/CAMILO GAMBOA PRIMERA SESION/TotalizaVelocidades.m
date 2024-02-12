clear all
close all
x=0:101/100:100;
str1="C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS";
%str2=" TERCERA SESION";
str2=[" PRIMERA SESION";" SEGUNDA SESION";" TERCERA SESION"];
str3=["\MARLON PRADO";...
    "\DANIEL MUÑOZ";...
    "\LUIS HERNAN LULIGO";...
    "\JULIETH MINA";...
    "\CAMILO GAMBOA";...
    "\HELMUT RUBIO";...
    "\SEBASTIAN YACUMAL"];


vel=["l","n","r"];
spd=[];
dat=[];
k=1;
for n=1:3 
    %k=1;
    y=[];
    for p=1:1%1:size(str3,1)
        for sesion=1:3
            FolderPath = strcat(str1,str2(sesion),str3(p),str2(sesion));
            cd(FolderPath);
            files = dir('*.mat');
            load(files.name);
            fldn=fieldnames(long);
        for j=1:size(fldn,1)
            if contains(fldn{j},"l")
                y=eval(strcat('long.',fldn{j}));
                lenta=cat(1,lenta,y/1000);
                dat.per(k,n)=strcat("P",num2str(p),"_",num2str(n));
                k=k+1;
            elseif contains(fldn{j},"n")
                y=eval(strcat('long.',fldn{j}));
                dat.v(k,n)=y/1000;
                dat.per(k,n)=strcat("P",num2str(p),"_",num2str(n));
                k=k+1;
            elseif contains(fldn{j},"r")
                y=eval(strcat('long.',fldn{j}));
                dat.v(k,n)=y/1000;
                dat.per(k,n)=strcat("P",num2str(p),"_",num2str(n));
                k=k+1;
            else
                 y;
            end
        end
        end
       %dat.v{n}=y; 
    end
end
% cd("C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut");
% dat3=dat;
% save('datos7.mat', 'dat3','-append')
% clear all
clc