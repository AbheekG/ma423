function q3
	checkGolub;
end

function checkWilk
	n = 10:0.5:505;
	X = 2.^(n-1);
	semilogy(n, X, 'r');
	hold on;

	n = 10:20:500;
	m = length(n);
	G = zeros(m, 1);
	
	for i = 1:m
		W = wilk(n(i));
		[L, U, p] = lu(W);
		G(i) = max(max(abs(U))) / max(max(abs(W)));
	end

	semilogy(n, G, 'b*');
	hold off;
end

function A = golub(n)
	s = 10;
	L = tril(round(s*randn(n)),-1)+eye(n);
	U = triu(round(s*randn(n)),1)+eye(n);
	A = L*U;
end