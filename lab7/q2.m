%R.S.
function q1
	N = [7, 12];
	funcs = {@cgs, @mgs, @repmgs, @reflectorQR}
	for iii = 1:2
		n = N(iii);
		A = hilb(n);
		for jjj = 1:4
			func = funcs{jjj};
			% Normalizing
			[Q, R] = func(A);

			% Checking norm
			fprintf('Distance of Q**Q from identity = % \n', norm(eye(n)-Q'*Q));
			fprintf('u ∗ cond(H) = %e \n', eps * cond(A));
			fprintf('Distance of Q*R from H = %e \n', norm(A - Q*R));
		end
	end
end

function [Q, R] = cgs(A)
	% [Q, R] = cgs(A) employs classical Gram-Schmidt scheme to compute
	% an isometry Q, an upper triangular matrix R such that A=QR.
	[m, n] = size(A);
	Q = zeros(m, n);
	R = zeros(n, n);

	for i = 1:n
		Q(:, i) = A(:, i);
		for j = 1:i-1
			R(j, i) = A(:, i)' * Q(:, j);
			Q(:, i) = Q(:, i) - Q(:, j) * R(j, i);
		end
		R(i, i) = norm(Q(:, i), 2);
		if R(i, i) == 0
			quit
		else
			Q(:, i) = Q(:, i) / R(i, i);
		end
	end
end



function [Q, R] = mgs(A)
% [Q, R] = mgs(A) employs modified Gram-Schmidt scheme to compute
% an isometry Q, an upper triangular matrix R such that A=QR.
	[m, n] = size(A);
	Q = zeros(m, n);
	R = zeros(n, n);

	for i = 1:n
		Q(:, i) = A(:, i);
		for j = 1:i-1
			R(j, i) = Q(:, i)' * Q(:, j);
			Q(:, i) = Q(:, i) - Q(:, j) * R(j, i);
		end
		R(i, i) = norm(Q(:, i), 2);
		if R(i, i) == 0
			quit
		else
			Q(:, i) = Q(:, i) / R(i, i);
		end
	end
end

function [Q, R] = repmgs(A)
	[Q1, R2] = mgs(A);
	[Q, R1] = mgs(Q1);
	R = R1*R2;
end

function [Q, R] = reflectorQR(A)
	[Q, R] = qr(A, 0);
end