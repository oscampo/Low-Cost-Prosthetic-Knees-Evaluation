function pks=CalculaGRF(folderPath1,w,leg)
% folderPath1 = actualFile folder
% w = peso de la persona
% leg = pierna amputada
if strcmp(leg,'R')||strcmp(leg,'r')
    leg="Right";
else
    leg="Left";
end
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
    idx=find(event.context==leg);
    
    %if strcmp(event.context{1,1}, leg) && strcmp(event.labels{1,1},'Foot Strike')
        if size(idx,1)==0
            idx=[1,1];
            FP=1;
        else
            if idx(1) ~= 1
                FP=7;%ForcePlatform id
            else
                FP=1; %ForcePlatform id
            end
        end
        rango = event.frames(idx(1)):event.frames(idx(2));
%     elseif strcmp(event.context{2,1}, leg) && strcmp(event.labels{2,1},'Foot Strike')
%         rango = event.frames(2):event.frames(3);
%     elseif strcmp(event.context{3,1}, leg) && strcmp(event.labels{3,1},'Foot Strike')
%         rango = event.frames(3):event.frames(4);
%         FP=7; %ForcePlatform id
%     else
%         break
%     end
    grf=sqrt(c3d.data.analogs(:,FP).^2+c3d.data.analogs(:,FP+1).^2+c3d.data.analogs(:,FP+2).^2);
    rango=find(grf>10);
     if size(rango,1)==0
            rango=1;
     end
    grf=grf(rango);

    time = (1:size(grf,1))./rate;
    F{i}=[time',grf./(w*9.81)];
    %[pks,~] = findpeaks(F{i},'MinPeakHeight',500,'MinPeakDistance',80);
    %GRFn(i)=pks(1)/(w*9.81);
    pks{i}=F{i};
end
files2 = dir('*.mat');
save(files2.name,'pks','-append')
%save('pks.mat','pks');
clear all
clc

