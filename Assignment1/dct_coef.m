function M=dct_coef(N)
[mm,nn] = meshgrid(0:N-1);

M = sqrt(2 / N) * cos(pi * (2*mm + 1) .* nn / (2 * N));
M(1,:) = M(1,:) / sqrt(2);
end
