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

I=imread('coins.png');
I=I(90:150,140:210);
A=double(I)
B= my_dct2(A);
C= my_idct2(B);
%OUTPUT
figure,
subplot(3,1,1);subimage(I);title('Original Image');
grid off;set(gca,'xtick',[]);set(gca,'ytick',[]);
subplot(3,1,2),imshow(log(abs(B)),[]);colormap(jet);title('After DCT');
subplot(3,1,3),imshow(abs(C),[0 255]);title('Image after IDCT');