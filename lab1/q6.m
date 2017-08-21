% (a)
A = ones(1, 16);
diag(1, 15) + diag(A(1:15), 1) + diag(-2*A) + diag(A(1:15), -1) + diag(1, -15)

% (b)
B = zeros(1, 16);
B(1) = -2;
B(2) = 1;
B(16) = 1;
toeplitz(B)

% (c)
A = zeros(1, 8);
A(1) = 1;
B = 1:8;
toeplitz(A, B)

A = ones(8);
B = toeplitz(1:8);

A./B
[N, D] = rat(A./B)