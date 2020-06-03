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
rodilla=["_1","_2", "_3"];
lenta=[];
normal=[];
rapida=[];
pL=[];
pN=[];
pR=[];
for n=1:3 
    %k=1;
    y=[];
    for p=1:7%1:size(str3,1)
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
                pL=cat(1,pL,[strcat("p",num2str(p),rodilla(sesion))]);
            elseif contains(fldn{j},"n")
                y=eval(strcat('long.',fldn{j}));
                normal=cat(1,normal,y/1000);
                pN=cat(1,pN,[strcat("p",num2str(p),rodilla(sesion))]);
            elseif contains(fldn{j},"r")
                y=eval(strcat('long.',fldn{j}));
                rapida=cat(1,rapida,y/1000);
                pR=cat(1,pR,[strcat("p",num2str(p),rodilla(sesion))]);
            else
                 y;
            end
        end
        end
       %dat.v{n}=y; 
    end
end
cd("C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut");
save('datos1.mat', 'lenta','pL', 'normal','pN', 'rapida','pR')
clear all
clc