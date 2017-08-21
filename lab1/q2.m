for n = 1:5:30
	A = magic(n);
	s = sum(diag(A));
	for i = 1:n
		if s ~= sum(A(:, i)) || s ~= sum(A(i, :))
			fprintf('It doesnt work\n');
		end
	end
	if s == sum(diag(flipud(A)))
		fprintf('It works for n = %d\n', n);
	end

end