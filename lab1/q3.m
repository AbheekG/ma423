for n = 3:5
	A = magic(n);
	% A
	p = randperm(n);
	q = randperm(n);
	A = A(p, q);
	% A

	sum(A), sum(A')', sum(diag(A)), sum(diag(flipud(A))), rank(A)

	% The sum of rows and columns remain same because it is just the permutation of rows and columns.
	% But, the sum of diagonals can change.
end


A = magic(4);
null(A), null(A,'r'), null(sym(A)), rref(A)

% rows of A are linearly dependent