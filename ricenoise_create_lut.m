function fn = ricenoise_create_lut(fn)
% function fn = ricenoise_create_lut(fn)
% Filip Szczepankiewicz, LU, Sweden

if nargin < 1
    fn = 'ricenoise_lut.mat';
end

snr = logspace(-3, 3, 500);

for i = 1:numel(snr)
    pd = makedist('Rician','s',1,'sigma',1/snr(i));
    f(i) = mean(pd);
end

save(fn, 'f', 'snr')
