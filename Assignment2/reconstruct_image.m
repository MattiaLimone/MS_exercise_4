function  X=reconstruct_image(I)
A=double(I);
B= my_dct2(A);
C= my_idct2(B);

subplot(3,1,1),subimage(I);title('Original');
subplot(3,1,2),imshow(log(abs(B)),[]);colormap(jet);title('After DCT');
subplot(3,1,3),imshow(abs(C),[0 255]);title('Image after IDCT');

X=C;
end