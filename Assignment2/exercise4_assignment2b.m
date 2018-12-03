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

A=dct2_coeff(8,'grid'); %8x8 DCT basic functions, display it with e.g.
for i=1:numel(A(:,:,1))
    subplot(8,8,i);imshow(A(:,:,i));
end