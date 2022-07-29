tiempo=datos(:,1)-datos(1,1);

RANK = datos(:,2:4);
RKNE = datos(:,5:7);
LHIP = datos(:,8:10);
RHIP = datos(:,11:13);

% Definir Segmentos
Pelvis = RHIP-LHIP;

MusloIzq = RKNE-RHIP;
PiernaIzq = RANK-RKNE;

% Calcular ángulos 3D para las articulaciones Teta1=atan(3/2)
id=[1 2 3 1 2 3];
TetaLHIP=[];
TetaRHIP=[];
TetaLKNE=[];

for i=1:3
    TetaLHIP(:,i)=atan2d(Pelvis(:,id(i+2)),Pelvis(:,id(i+1)));
    TetaRHIP(:,i)=atan2d(MusloIzq(:,id(i+2)),MusloIzq(:,id(i+1)));
    TetaLKNE(:,i)=atan2d(PiernaIzq(:,id(i+2)),PiernaIzq(:,id(i+1)));
end

% Ajuste de datos
TetaRHIP(11:end,2)=TetaRHIP(11:end,2)+360;
TetaRHIP(33:end,3)=TetaRHIP(33:end,3)+360;

TetaLKNE(1:56,2)=TetaLKNE(1:56,2)+360;

% Debido a que para la Rodilla solo se considera el movimiento de flexo-extensión,
% se debe crear un solo vector de ángulos, el cual será la suma vectorial
% de los vectores columna de TetalKNE:

for i=1:size(TetaLKNE,1)
    Teta(i) = norm(TetaLKNE(i,:));
end

TetaLKNE=Teta';

% Remueve Offset
TetaLHIP(:,:)=TetaLHIP(:,:)-TetaLHIP(1,:);
TetaRHIP(:,:)=TetaRHIP(:,:)-TetaRHIP(1,:);
TetaLKNE(:,:)=TetaLKNE(:,:)-TetaLKNE(1,:);

TetaRHIPx = [tiempo,TetaRHIP(:,1)];
TetaRHIPy = [tiempo,TetaRHIP(:,2)];
TetaRHIPz = [tiempo,TetaRHIP(:,3)];

TetaLHIPx = [tiempo,TetaLHIP(:,1)];
TetaLHIPy = [tiempo,TetaLHIP(:,2)];
TetaLHIPz = [tiempo,TetaLHIP(:,3)];

TetaLKNE = [tiempo,TetaLKNE];





