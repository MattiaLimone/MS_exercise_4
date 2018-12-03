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

x = (1:100) + 50*cos((1:100)*2*pi/40);
X = my_dct(x);

[XX,ind] = sort(abs(X),'descend');
i = 1;

while norm(X(ind(1:i)))/norm(X) < 0.9999
   i = i + 1;
end
needed = i;

%Reconstruct the signal and compare it to the original signal.
X(ind(needed+1:end)) = 0;
xx = my_idct(X);

plot([x;xx]')
legend('Original',['Reconstructed, N = ' int2str(needed)],'Location','SouthEast')