clear all
close all

str1="C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS";
str2=[" PRIMERA SESION";" SEGUNDA SESION";" TERCERA SESION"];
str3=["\MARLON PRADO";...
    "\DANIEL MUÑOZ";...
    "\LUIS HERNAN LULIGO";...
    "\JULIETH MINA";...
    "\CAMILO GAMBOA";...
    "\HELMUT RUBIO";...
    "\SEBASTIAN YACUMAL"];
order=[
    {[3,3,4]},{[3,3,3]},{[3,3,3]};
    {[3,3,3]},{[3,3,3]},{[3,3,3]};
    {[3,3,3]},{[3,3,3]},{[3,3,3]};
    {[3,3,3]},{[3,3,3]},{[3,3,3]};
    {[3,3,3]},{[3,3,3]},{[3,3,3]};
    {[3,3,4]},{[3,3,3]},{[3,3,3]};
    {[3,2,3]},{[2,3,3]},{[3,3,3]}
    ];
%rodilla=["_Propia","_ATK-PA-01", "_Rodilla 3P26"];
rodilla=["_1","_2", "_3"];
GRF_L=[];
GRF_N=[];
GRF_R=[];
pL=[];
pN=[];
pR=[];
%for sesion=1:3
    for vel=1:3
        for p=1:7%1:size(str3,1)
            for sesion=1:3
            FolderPath = strcat(str1,str2(sesion),str3(p),str2(sesion));
            cd(FolderPath);
            files = dir('*.mat');
            load(files.name,'pks');
            
            maxL=0;
            maxN=0;
            maxR=0;
            
            for L=1:order{p,sesion}(1)
                GRF_L=cat(1,GRF_L,[sesion, max(pks{1,L}(:,2))]);
                pL=cat(1,pL,[strcat("p",num2str(p),rodilla(sesion))]);
            end
            for N=L+1:order{p,sesion}(2)+L
                GRF_N=cat(1,GRF_N,[sesion, max(pks{1,N}(:,2))]);
                pN=cat(1,pN,[strcat("p",num2str(p),rodilla(sesion))]);
            end
            for R=N+1:order{p,sesion}(3)+N
                GRF_R=cat(1,GRF_R,[sesion, max(pks{1,R}(:,2))]);
                pR=cat(1,pR,[strcat("p",num2str(p),rodilla(sesion))]);
            end
            end
        end
    end
%end