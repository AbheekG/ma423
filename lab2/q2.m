function q2
	x = 2;
	while x > 1
		x = x/2
	end
	fprintf('In 1st case the output is eps/2 or u, x = %e\n', x);

	x = 2;
	while 1 + x > 1
		x = x/2
	end
	fprintf('In 2nd case the output is eps/2 or u, x = %e\n', x);
end
