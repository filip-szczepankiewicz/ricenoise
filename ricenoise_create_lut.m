function fn = ricenoise_create_lut(fn)
% function fn = ricenoise_create_lut(fn)
% Filip Szczepankiewicz, LU, Sweden

if nargin < 1
    fn = 'ricenoise_lut.mat';
end

sigma = logspace(-3, 3, 500);

for i = 1:numel(sigma)
    pd = makedist('Rician','s',1,'sigma',sigma(i));
    f(i) = mean(pd);
end

save(fn, 'f', 'sigma')
