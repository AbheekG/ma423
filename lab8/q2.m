R = triu(randn(50));	% compute a 50-by-50 random upper triangular matrix.
[Q, X] = qr(randn(50));	% compute a 50-by-50 random unitary matrix.
A = Q*R; 				% A is a matrix with known QR factors.
[S, T] = qr(A);			% Compute Householder QR factorization of A.

[norm( Q - S ), norm( R - T )]
norm(A - S*T)
[norm(A - S*T)/norm(A), eps]