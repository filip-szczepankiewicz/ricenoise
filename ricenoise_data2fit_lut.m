function m = ricenoise_data2fit_lut(s, b, lut)
% function m = ricenoise_data2fit_lut(s, b, lut)
% Filip Szczepankiewicz, LU, Sweden

[x0, lb, ub] = ricenoise_lsqbounds;

nrm = max(s);

m = lsqcurvefit(@(s, b)ricenoise_fit2data_lut(s, b, lut), x0, b, s/nrm, lb, ub) .* [nrm 1 1];

