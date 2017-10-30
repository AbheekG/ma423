function q3
	close all
	A = csvread('data.csv');
	x = A(:, 2);
	x
	y = A(:, 1);

	figure; hold on;
	plot(x, y, '.');

	n = length(x);
	p = 10;
	A = ones(n, p+1);
	for i = 2:p+1
		A(:, i) = x.^(i-1);
	end

	% A
	[c1, r1] = part1(A, y, n, p);
	[c2, r2] = part2(A, y, n, p);
	[c3, r3] = part3(A, y, n, p);
	[c4, r4] = part4(A, y, n, p);

	[c1', c2', c3', c4']
	[r1, r2, r3, r4]

	legend('Data Points', 'matlab Backslash command', 'Pseudoinverse (pinv)', 'Normal equation', 'Certified coefficients');
	hold off;
end

function [coeff, rsd] = part1(A, y, n, p)
	l = min(A(:, 2)');
	u = max(A(:, 2)');
	x = l:0.01:u;

	coeff = (A\y)';
	rsd = norm(y - A*(coeff'));

	plot(x, fun(coeff, x), 'r');
end

function [coeff, rsd] = part2(A, y, n, p)
	l = min(A(:, 2)');
	u = max(A(:, 2)');
	x = l:0.01:u;

	coeff = ((A' * A) \ (A' * y))';
	rsd = norm(y - A*(coeff'));

	plot(x, fun(coeff, x), 'g');
end

function [coeff, rsd] = part3(A, y, n, p)
	l = min(A(:, 2)');
	u = max(A(:, 2)');
	x = l:0.01:u;

	coeff = (pinv(A)*y)';
	rsd = norm(y - A*(coeff'));

	plot(x, fun(coeff, x), 'y');
end

function [coeff, rsd] = part4(A, y, n, p)
	l = min(A(:, 2)');
	u = max(A(:, 2)');
	x = l:0.01:u;

	coeff = csvread('coeff.csv');
	coeff = coeff(:, 2)';
	rsd = norm(y - A*(coeff'));

	plot(x, fun(coeff, x), 'b');
end

function [y] = fun(coeff, x)
	n = length(x);
	p = length(coeff);

	A = ones(n, p);
	for i = 2:p
		A(:, i) = (x').^(i-1);
	end

	% size(coeff), size(A)
	y = A* (coeff');
	% y
end