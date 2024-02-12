function [lstep gaitspeed]=lpaso(Leg,height)
% Devuelve la longitud del paso normalizada con la altura de la persona
% Leg = pierna amputada
% height = altura de la persona
clc
[filein, pathname] = uigetfile({'*.c3d','C3D file'}, 'C3D data file...');
file = [pathname filein];
c3d = ezc3dRead();
c3d = ezc3dRead(file);
frames = c3d.header.points.lastFrame-c3d.header.points.firstFrame+1;
markers = c3d.header.points.size;
event.labels = c3d.parameters.EVENT.LABELS.DATA;
event.context = c3d.parameters.EVENT.CONTEXTS.DATA;
event.times = c3d.parameters.EVENT.TIMES.DATA(2,:);
event.frames = fix(event.times*120-c3d.header.points.firstFrame);

% prompt = 'Pierna amputada (L/R)? ';
% Leg = input(prompt);

    for i=1:markers
        label=strrep(c3d.parameters.POINT.LABELS.DATA{i},' ','');
        datos.(label)=reshape(c3d.data.points(:,i,:),3, frames)';
    end


    if strcmp(Leg,'R')||strcmp(Leg,'r')
        Leg
        [~,loc] = findpeaks(-datos.RHEE(:,3),'MinPeakDistance',100)
        findpeaks(-datos.RHEE(:,3),'MinPeakDistance',100)
        prompt = 'Determine Posición de CI y TO en pierna Derecha: ';
        ev = input(prompt);
        lstep = mean(diff(datos.RHEE(ev,2)))/height;
        gaitspeed = mean(diff(datos.RHEE(ev,2)))*120/mean(diff(ev));
    
    elseif strcmp(Leg,'L')||strcmp(Leg,'l')
        [~,loc]=findpeaks(-datos.LHEE(:,3),'MinPeakDistance',100)
        findpeaks(-datos.LHEE(:,3),'MinPeakDistance',100)
        prompt = 'Determine Posición de CI y TO en pierna Izquierda: ';
        ev = input(prompt);
        lstep = mean(diff(datos.LHEE(ev,2)))/height;
        gaitspeed = mean(diff(datos.RHEE(ev,2)))*120/mean(diff(ev));
    end
    close all
end