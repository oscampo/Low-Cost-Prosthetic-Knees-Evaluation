c3d = ezc3dRead();
c3d = ezc3dRead('NORMAL D1.c3d');
frames = c3d.header.points.lastFrame-c3d.header.points.firstFrame+1;
markers = c3d.header.points.size;
for i=1:markers
    label=strrep(c3d.parameters.POINT.LABELS.DATA{i},' ','');
    datos.(label)=reshape(c3d.data.points(:,1,:),3,frames);
end
