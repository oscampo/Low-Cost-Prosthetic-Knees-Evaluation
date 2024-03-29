function [TetaRodillaR, TetaRodillaL,VelRodillaR, VelRodillaL, AcelRodillaR, AcelRodillaL]=Procesa(Leg)
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

%prompt = 'Pierna amputada (L/R)? ';
%Leg = input(prompt);

for i=1:markers
    label=strrep(c3d.parameters.POINT.LABELS.DATA{i},' ','');
    datos.(label)=reshape(c3d.data.points(:,i,:),3, frames)';
end


if strcmp(Leg,'R')||strcmp(Leg,'r')
   [~,loc] = findpeaks(-datos.RHEE(:,3),'MinPeakDistance',100);
   loc
   findpeaks(-datos.RHEE(:,3),'MinPeakDistance',100)
    prompt = 'Determine Posici�n de CI y TO en pierna Derecha: ';
    ev = input(prompt);
    vertR=datos.RASI;
    vertR(ev(1):ev(2),3)=vertR(ev(1):ev(2),3)+1;    
    TetaTorsoR=atan2d(vertR(ev(1):ev(2),3)-datos.RASI(ev(1):ev(2),3), vertR(ev(1):ev(2),2)-datos.RASI(ev(1):ev(2),2));
    TetaMusloR=atan2d((datos.RASI(ev(1):ev(2),3)-datos.RKNE(ev(1):ev(2),3)),(datos.RASI(ev(1):ev(2),2)-datos.RKNE(ev(1):ev(2),2)));
    TetaPiernaR=atan2d((datos.RKNE(ev(1):ev(2),3)-datos.RANK(ev(1):ev(2),3)),(datos.RKNE(ev(1):ev(2),2)-datos.RANK(ev(1):ev(2),2)));
    TetaPieR=atand((datos.RANK(ev(1):ev(2),3)-datos.RTOE(ev(1):ev(2),3))./(datos.RANK(ev(1):ev(2),2)-datos.RTOE(ev(1):ev(2),2)));
    
    TetaCaderaR=TetaTorsoR-TetaMusloR;
    TetaRodillaR=TetaMusloR-TetaPiernaR;
    TetaTobilloR=TetaPiernaR-TetaPieR;
    % Se filtran los �ngulos porque se van a calcular las velocidades angulares
    TetaRodillaR=filtra(TetaRodillaR,120,6);
    
    j=1;
    dt=1/120;
    for i=2:length(TetaRodillaR)-1
        VelRodillaR(j)=(TetaRodillaR(i+1)-TetaRodillaR(i-1))*pi/180/(2*dt);
        j=j+1;
    end
        j=1;
    for i=2:length(VelRodillaR)-1
        AcelRodillaR(j)=(VelRodillaR(i+1)-VelRodillaR(i-1))/(2*dt);
        j=j+1;
    end
    
    TetaRodillaR = acond(TetaRodillaR);
    VelRodillaR = acond(VelRodillaR);
    AcelRodillaR = acond(AcelRodillaR);
    TetaRodillaL = [];
    VelRodillaL = [];
    AcelRodillaL = [];
    
elseif strcmp(Leg,'L')||strcmp(Leg,'l')
    [~,loc]=findpeaks(-datos.LHEE(:,3),'MinPeakDistance',100);
    loc
    findpeaks(-datos.LHEE(:,3),'MinPeakDistance',100)
    prompt = 'Determine Posici�n de CI y TO en pierna Izquierda: ';
    evL = input(prompt);
    vertL=datos.LASI;
    vertL(evL(1):evL(2),3)=vertL(evL(1):evL(2),3)+1;
    TetaTorsoL=atan2d(vertL(evL(1):evL(2),3)-datos.LASI(evL(1):evL(2),3), vertL(evL(1):evL(2),2)-datos.LASI(evL(1):evL(2),2));
    TetaMusloL=atan2d((datos.LASI(evL(1):evL(2),3)-datos.LKNE(evL(1):evL(2),3)),(datos.LASI(evL(1):evL(2),2)-datos.LKNE(evL(1):evL(2),2)));
    TetaPiernaL=atan2d((datos.LKNE(evL(1):evL(2),3)-datos.LANK(evL(1):evL(2),3)),(datos.LKNE(evL(1):evL(2),2)-datos.LANK(evL(1):evL(2),2)));
    TetaPieL=atand((datos.LANK(evL(1):evL(2),3)-datos.LTOE(evL(1):evL(2),3))./(datos.LANK(evL(1):evL(2),2)-datos.LTOE(evL(1):evL(2),2)));
    
    TetaCaderaL=TetaTorsoL-TetaMusloL;
    TetaRodillaL=TetaMusloL-TetaPiernaL;
    TetaTobilloL=TetaPiernaL-TetaPieL;
    % Se filtran los �ngulos porque se van a calcular las velocidades angulares
    TetaRodillaL=filtra(TetaRodillaL,120,6);
    j=1;
    dt=1/120;
    for i=2:length(TetaRodillaL)-1
        VelRodillaL(j)=(TetaRodillaL(i+1)-TetaRodillaL(i-1))*pi/180/(2*dt);
        j=j+1;
    end

    j=1;
    for i=2:length(VelRodillaL)-1
        AcelRodillaL(j)=(VelRodillaL(i+1)-VelRodillaL(i-1))/(2*dt);
        j=j+1;
    end

    TetaRodillaL = acond(TetaRodillaL);
    VelRodillaL = acond(VelRodillaL);
    AcelRodillaL = acond(AcelRodillaL);
    TetaRodillaR = [];
    VelRodillaR = [];
    AcelRodillaR = [];
end

end
function NewSignal = acond(signal)
  NewSignal = resample(signal, 100, length(signal));
end
