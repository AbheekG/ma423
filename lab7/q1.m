%R.S.
function q1
	[U, X] = qr(randn(80));
	[V, X] = qr(randn(80));
	S = diag( 2 .^ (-1:-1:-80));
	A = U*S*V;

	% Normalizing
	[QC, RC] = cgs(A);
	[QM, RM] = mgs(A);
	[Q, R] = qr(A);

	% Checking norm/error
	fprintf('CGS distance of Q**Q from identity = %e\n', norm( QC'*QC - eye(80)));
	fprintf('MGS distance of Q**Q from identity = %e\n', norm( QM'*QM - eye(80)));
	fprintf('QR (matlab) distance of Q**Q from identity = %e\n', norm( Q'*Q - eye(80)));

	% Plotting
	x = (1:80)';
	hold off;
	semilogy(x, abs(diag( RC )), 'bo');
	hold on;
	semilogy(x, abs(diag( RM ) ), 'rx')
	semilogy(x, abs(diag( R ) ), 'k+')
	title('abs(diag(R)) for cgs, mgs and qr')
	gtext('cgs=o, mgs = x, qr=+')

	% Re-Normalizing
	[QQC, RRC] = cgs(QC);
	RR= RRC*RC;

	% Again Checking norm/error
	fprintf('Repeated CGS distance of Q**Q from identity = %e\n', norm( QQC'*QQC - eye(80)));

	% Again Plotting
	x = (1:80)';
	hold off; figure;
	semilogy(x, abs(diag( RR )), 'bo');
	hold on;
	semilogy(x, abs(diag( RM ) ), 'rx')
	semilogy(x, abs(diag( R ) ), 'k+')
	title('abs(diag(R)) for cgs, mgs and qr')
	gtext('cgs=o, mgs = x, qr=+')
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