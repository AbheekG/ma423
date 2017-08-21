(4/3 - 1) * 3 - 1

5 * ( ( (1 + exp(-50)) - 1 ) / ( (1 + exp(-50)) - 1 ) )

log(exp(750)) / 100

% Matlab and other computer systems use finite precision floating point arithmetic. They cannot represent all real numbers exactly, there is some round-off error.
% 1. Matlab had to approximate non-terminating decimal 1.3333... , so we have the error.
% 2. exp(-50) is too small compared to 1 (less than UFL). So, the denominator becomes 0.
% 3. exp(750) is above OFL, so it becomes Inf. log(Inf) is Inf.
