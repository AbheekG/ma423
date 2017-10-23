function q1
	a = 1;
	b = -10^7 - 10^-7;
	c = 1;

	[x1, x2] = quadroot1(a, b, c);
	fprintf('Method 1, root1 = %e, root2 = %e\n', x1, x2);
	
	[x1, x2] = quadroot2(a, b, c);
	fprintf('Method 2, root1 = %e, root2 = %e\n', x1, x2);
end

function [x1, x2] = quadroot1( a, b, c)
	d = sqrt (b^2 - 4*a*c);
	x1 = (-b + d)/(2*a);
	x2 = (-b - d)/(2*a);
end

function [x1, x2] = quadroot2(a, b, c)
	d = sqrt (b^2 - 4*a*c);
	x1 = (-b - sign(b)*d) / (2*a);
	x2 = c / (a*x1);
end