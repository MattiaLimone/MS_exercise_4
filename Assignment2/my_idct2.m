function A = my_idct2(B)
A = my_idct(my_idct(B).').';
end