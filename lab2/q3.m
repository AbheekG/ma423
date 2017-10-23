function q3
	a = 1.95;
	b = 2.05;
	X = linspace(a, b, 151);

	figure; plot(X, p1(X)); title('Plot for polynomial by method 1'); xlabel('x'); ylabel('p1(x)');
	figure; plot(X, p2(X)); title('Plot for polynomial by method 2'); xlabel('x'); ylabel('p2(x)');

end

function [Y] = p1(X)
	P = [9, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512];
	Y = polyval(P, X);
end

function [Y] = p2(X)
	Y = (X - 2).^9;
end