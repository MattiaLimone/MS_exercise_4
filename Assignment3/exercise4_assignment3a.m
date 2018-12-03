% Author: Mattia Limone
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

for q=1:100
R(:,:,q) = quantization_matrix(q);
end
subplot(3,1,1);
plot(R(:,:,1))
subplot(3,1,2);
plot(R(:,:,35))
subplot(3,1,3);
plot(R(:,:,80))