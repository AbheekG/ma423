function q2
	format long e
	m = 23;
	n = 20;
	t = (-5:.5:6)';
	b = sin(pi*t/5) + t/5;
	A = zeros(m, n);
	for i = 1:n
		A(:, i) = t.^i;
	end

	% Part a
	p1 = A\b;
	cond(A)
	r1 = A*p1 - b;
	norm(r1)

	% Part b
	p2 = (A'*A)\(A'*b);
	cond(A'*A)
	r2 = A*p2 - b;
	norm(r2)

	% Part c
	B = zeros(m + n, m + n);
	B(1:m, 1:m) = eye(m);
	B(1:m, m+1:m+n) = A;
	B(m+1:m+n, 1:m) = A';
	x = B\[b; zeros(n, 1)];
	p3 = x(end-n+1:end);
	cond(B)
	r3 = A*p3 - b;
	norm(r3)

	%Plots
	plot(t, b, 'black'); hold on;
	plot(t, A*p1, 'r'); plot(t, A*p2, 'g'); plot(t, A*p3, 'b'); hold off;
	legend('Original function', 'Using p1', 'Using p2', 'Using p3');

end