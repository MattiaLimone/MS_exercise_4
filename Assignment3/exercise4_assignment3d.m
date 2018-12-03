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

RGB= imread('colors.png');
YCBCR = rgb2ycbcr(RGB);
%Isolate Y. 
Y  = YCBCR(:,:,1);
%Isolate Cb. 
Cb = YCBCR(:,:,2);
%Isolate Cr. 
Cr = YCBCR(:,:,3);
%Changing every even matrix value with his previous odd value
Cb(:, 2:2:end) = Cb(:, 1:2:end-1);
Cr(:, 2:2:end) = Cr(:, 1:2:end-1);
%Splitting into 3 different jpeg compression
Y = jpegcompr(Y,100);
Cb = jpegcompr(Cb,30);
Cr = jpegcompr(Cr,30);
%Reconstructing the image
YCBCR2 = cat(3,Y,Cb,Cr);
figure
subplot(2,1,1);imshowpair(YCBCR,YCBCR2,'montage');title('YCbCr Original and Compressed');
%Converting reconstructed image to RGB
RGB2 = ycbcr2rgb(YCBCR2);
subplot(2,1,2);imshowpair(RGB,RGB2,'montage');title('RGB Original and Compressed');