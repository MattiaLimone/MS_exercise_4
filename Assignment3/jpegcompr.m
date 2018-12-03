function K = jpegcompr(I,q)
[row, coln]= size(I);
row_o = row;
coln_o = coln;
if row > coln
    out = 0;
    for i=1:100
        if out == 0
        a = row;
        b = 8;
        out = ~rem(a,b) * a/b;
        row = row+1;
        end
    end
    row = row-1;
    diffr=row-row_o;
    diffc=row-coln;
    I = padarray(I,[diffr, diffc,0],0,'post');
    Siz=row;
else
    out = 0;
    for i=1:100
        if out == 0
        a = coln;
        b = 8;
        out = ~rem(a,b) * a/b;
        coln = coln+1;
        end
    end
    coln = coln-1;
    diffr=coln-row;
    diffc=coln-coln_o;
    I = padarray(I,[diffr, diffc,0],0,'post');
    Siz=coln;
end
I1=I;
I= double(I);
I = I - (128*ones(Siz));
QX = quantization_matrix(q);
% Formulation of forward DCT Matrix and inverse DCT matrix
DCT_matrix8 = my_dct(eye(8));
iDCT_matrix8 = DCT_matrix8';   %inv(DCT_matrix8);
% Jpeg Compression
dct_restored = zeros(row,coln);
QX = double(QX);
% Jpeg Encoding
% Forward Discret Cosine Transform
for i1=[1:8:row]
    for i2=[1:8:coln]
        zBLOCK=I(i1:i1+7,i2:i2+7);
        win1=DCT_matrix8*zBLOCK*iDCT_matrix8;
        dct_domain(i1:i1+7,i2:i2+7)=win1;
    end
end
% Quantization of the DCT coefficients
for i1=[1:8:row]
    for i2=[1:8:coln]
        win1 = dct_domain(i1:i1+7,i2:i2+7);
        win2=round(win1./QX);
        dct_quantized(i1:i1+7,i2:i2+7)=win2;
    end
end
I3 = dct_quantized;

% Jpeg Decoding 
% Dequantization of DCT Coefficients
for i1=[1:8:row]
    for i2=[1:8:coln]
        win2 = dct_quantized(i1:i1+7,i2:i2+7);
        win3 = win2.*QX;
        dct_dequantized(i1:i1+7,i2:i2+7) = win3;
    end
end
% Inverse DISCRETE COSINE TRANSFORM
for i1=[1:8:row]
    for i2=[1:8:coln]
        win3 = dct_dequantized(i1:i1+7,i2:i2+7);
        win4=iDCT_matrix8*win3*DCT_matrix8;
        dct_restored(i1:i1+7,i2:i2+7)=win4;
    end
end
I2=dct_restored;
% Conversion of Image Matrix to Intensity image
K=mat2gray(I2);
%Display of Results

K=K(1:row_o,1:coln_o);
I1=I1(1:row_o,1:coln_o);

figure;
subplot(1,3,1);subimage(I1);title('Original Image');
grid off;set(gca,'xtick',[]);set(gca,'ytick',[]);
subplot(1,3,2);imshow(log(abs(I3)),[]);colormap(jet);title('Image After DCT');
subplot(1,3,3);imshow(K);title('Image After IDCT');
end