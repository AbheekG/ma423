function q2
	checkWilk;
	checkRand(1);
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

function checkRand(nn)
	for i = 1:nn
		n = 10:0.5:505;
		X = n.^(2/3);
		plot(n, X, 'r');
		hold on;

		n = 10:20:500;
		m = length(n);
		G = zeros(m, 1);
		
		for i = 1:m
			W = rand(n(i))*1000 - 500;
			[L, U, p] = lu(W);
			G(i) = max(max(abs(U))) / max(max(abs(W)));
		end

		plot(n, G, 'b*');
		hold off;
	end
end

function [A] = wilk(n)
	A = ones(n);
	A = tril(A, -1);
	A = -A + eye(n);
	A(:, n) = 1;
end