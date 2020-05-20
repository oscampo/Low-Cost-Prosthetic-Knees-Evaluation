[filein, pathname] = uigetfile({'*.c3d','C3D file'}, 'C3D data file...');
file = [pathname filein];
c3d = btkReadAcquisition(file);