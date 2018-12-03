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

value = [10];
for q=value
    QX = quantization_matrix(q);
    [zipped,INFO] = norm2huff(uint8(QX(:)));
    INFO.pad        %eventually added bits at the end of bit sequence;
    INFO.huffcodes  %Huffman codewords;
    INFO.ratio      %compression ratio;
    INFO.length     %original data length;
    INFO.maxcodelen %max codeword length;
    zipped
end
