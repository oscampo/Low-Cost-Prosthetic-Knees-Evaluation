function pks=CalculaGRF(folderPath1,w)
% folderPath1 = actualFile folder
% w = peso de la persona
cd(folderPath1); % path of the folder
files1 = dir('*D*.c3d');
%files1(1:2) = [];
totalFiles = numel(files1);

for i =1:totalFiles
    Fileaddress{i,1}=strcat(folderPath1,'\',files1(i).name);
    c3d = ezc3dRead(Fileaddress{i,1});
    frames = c3d.header.analogs.lastFrame-c3d.header.analogs.firstFrame+1;

    event.labels = c3d.parameters.EVENT.LABELS.DATA;
    event.context = c3d.parameters.EVENT.CONTEXTS.DATA;
    event.times = c3d.parameters.EVENT.TIMES.DATA(2,:);
    rate=c3d.header.analogs.frameRate;
    event.frames = fix(event.times*rate-c3d.header.analogs.firstFrame);
    %rango=event.frames(1):event.frames(3)-50;
    if event.frames(1)>event.frames(2)
        rango = event.frames(2):event.frames(3);
    else
        rango = event.frames(1):event.frames(2);
    end
    time = (rango-rango(1))./rate;
    F{i}=[time',sqrt(c3d.data.analogs(rango,1).^2+c3d.data.analogs(rango,2).^2+c3d.data.analogs(rango,3).^2)./(w*9.81)];
    %[pks,~] = findpeaks(F{i},'MinPeakHeight',500,'MinPeakDistance',80);
    %GRFn(i)=pks(1)/(w*9.81);
    pks{i}=F{i};
end
files2 = dir('*.mat');
save(files2.name,'pks','-append')
%save('pks.mat','pks');
clear all
clc

