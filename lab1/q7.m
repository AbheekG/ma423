n = 8;
A = rand(n);

A ./ repmat(sum(A), n, 1)
% sum(A ./ repmat((sum(A)), n, 1))

A(:, 3) = A(:, 3) * 0;
A(:, 5) = A(:, 5) * 0;


A ./ repmat((sum(A) + (sum(A) == 0)), n, 1)