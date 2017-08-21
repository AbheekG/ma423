A = rand(8)

max(A, [], 1)
max(A, [], 2)
max(max(A))

[r, c] = find(A > 0.25);
[r, c]