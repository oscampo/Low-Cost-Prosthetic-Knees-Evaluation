[filein, pathname] = uigetfile({'*.c3d','C3D file'}, 'C3D data file...');
file = [pathname filein];
h = btkReadAcquisition(file);