function q1
	part1
	part2
end

function [A] = wilk(n)
	A = ones(n);
	A = tril(A, -1);
	A = -A + eye(n);
	A(:, n) = 1;
end

function part1
	N = [32, 64];
	for i = 1:2
		n = N(i);
		A = wilk(n);

		x = rand([n, 1])*100 - 50;
		b = A*x;

		x1 = A\b;
		% [x, x1]
		% A

		err = norm(x - x1, Inf) / norm(x, Inf)

		cond(A)
	end
end

function part2
	N = [32, 64];
	for i = 1:2
		n = N(i);
		A = wilk(n);

		x = rand([n, 1])*100 - 50;
		b = A*x;

		[Q, R] = qr(A);
		x1 = R\(Q\b);
		% [x, x1]
		% A

		err = norm(x - x1, Inf) / norm(x, Inf)

		cond(A)
	end
end