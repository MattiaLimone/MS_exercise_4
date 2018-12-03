x = eye(4);
y = my_dct(my_dct(x));
y_corr = eye(4);
assert( norm( y_corr(:) - y(:)) < 1e-10 );