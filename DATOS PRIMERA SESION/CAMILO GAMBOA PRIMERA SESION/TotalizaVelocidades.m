clear all
close all
x=0:101/100:100;
str1="C:\Users\oscam\OneDrive\Documentos2\GitHub\Proyecto-Helmut\DATOS";
str2=" SEGUNDA SESION";
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
for n=1:3 
    k=1;
    y=[];
    for p=7:7%1:size(str3,1)
        FolderPath = strcat(str1,str2,str3(p),str2(1));
        cd(FolderPath);
        files = dir('*.mat');
        load(files.name);
        fldn=fieldnames(long);
        for j=1:size(fldn,1)
            if contains(fldn{j},vel(n))
                %y=[y;eval(strcat('long.',fldn{j}))];
                y=eval(strcat('long.',fldn{j}));
                dat.v(k,n)=y;
                dat.per(k,n)=strcat("P",num2str(p))';
                k=k+1;
            else
                y;
            end
        end
       %dat.v{n}=y; 
    end
end