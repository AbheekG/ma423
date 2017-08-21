p = randi(10, [1, 10]);

(length(p)-1:-1:0) .* p

% It multiplies ith number in p with length(p)-i-1. For example, the first number gets  multiplies by length(p)-1 and the last by 0.