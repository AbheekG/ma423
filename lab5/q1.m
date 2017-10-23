function q1
	% Part a
	t = (1:.5:3)';
	b = [1.1, 1.2, 1.3, 1.3, 1.4]';
	A = [Phi1(t), Phi2(t)];

	% Part b
	x = A\b

	%Part c
	plot(t, b, 'b'); hold on;
	plot(t', (A*x)', 'r'); hold off;

	% Part d
	r = A*x - b;
	norm(r)

end

function [y] = Phi1(t)
	y = t*0 + 1;
end

function [y] = Phi2(t)
	y = t;
end