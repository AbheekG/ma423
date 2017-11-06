function q1
	for i = 1:4
		if i == 1
			N = 4:6;
			fun = @magic;
			name = '%s magic(%d)';
		elseif i == 2
			N = 4:12;
			fun = @hilb;
			name = '%s hilb(%d)';
		elseif i == 3
			N = 8:2:12;
			fun = @f1;
			name = '%s gallery( `frank`, %d)';
		else
				
		end

		normU = zeros(3, length(N));
		normV = zeros(3, length(N));
		normA = zeros(3, length(N));

		for j = 1:length(N)
			n = N(j);
			A = fun(n);
			[U, S, V] = svd(A);
			[U(:, :, 2), S(:, :, 2), V(:, :, 2)] = mysvd1(A);
			[U(:, :, 3), S(:, :, 3), V(:, :, 3)] = mysvd2(A);

			for ii = 1:3
				normU(ii, j) = norm(U(:,:,ii)'*U(:,:,ii) - eye(size(A, 1)));
				normV(ii, j) = norm(V(:,:,ii)'*V(:,:,ii) - eye(size(A, 2)));
				normA(ii, j) = norm(A*V(:,:,ii) - U(:,:,ii)*S(:,:,ii));

				figure; hold on;
				plot(1:n, diag(S(:,:,1)), 'r');
				plot(1:n, diag(S(:,:,2)), 'b');
				plot(1:n, diag(S(:,:,3)), 'g');
				title(sprintf(name, 'Singular values for', n));
				legend('Matlab SVD', 'mysvd1', 'mysvd2');
				hold off; 
			end
		end

		figure; hold on;
		plot(1:length(N), normU, 'r');
		plot(1:length(N), normV, 'b');
		plot(1:length(N), normA, 'g');
		title(sprintf(name, 'Error 2-norm values for', '1'));
		legend('Matlab SVD', 'mysvd1', 'mysvd2');
		hold off; 
		

	end
end

function [U, S, V] = mysvd1(A)
% [U, S, V] = mysvd1(A) produces a diagonal matrix S of singular
% values of nonsingular matrix A and two unitary matrices U and V
% whose columns are the corresponding left and right singular
% vectors so that A * V = U * S.
	[V, D] = eig(A'*A);
	S = sqrt(D);
	U = A*V*S^(-1);
end

function [U, S, V] = mysvd2(A)
% [U, S, V] = mysvd2(A) produces a diagonal matrix S of singular
% values of nonsingular matrix A and two unitary matrices U and V
% whose columns are the corresponding left and right singular
% vectors so that A * V = U * S.
	[V, D, temp] = svd(A'*A);
	r = rank(A);
	V1 = V(:, 1:r);
	S = sqrt(D);
	Sr = S(1:r, 1:r);

	[Z, D] = eig(A*A');
	U2 = Z(:, r+1:end);
	U1 = A* V1* Sr^(-1);

	U = [U1, U2];
	S = zeros(size(A));
	S(1:r, 1:r) = Sr;
end

function [A] = f1(n)
	A = gallery('frank', n);
end
