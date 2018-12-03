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

A=imread('A.bmp');

X=reconstruct_image(A);
% Typically this process will result in matrices with values primarily in 
% the upper left (low frequency) corner. 
% By using a zig-zag ordering to group the non-zero entries and run length 
% encoding, the quantized matrix can be much more efficiently stored than
% the non-quantized version.