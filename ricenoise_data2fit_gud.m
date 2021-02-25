function m = ricenoise_data2fit_gud(s, b)
% function m = ricenoise_data2fit_gud(s, b)
% Filip Szczepankiewicz, LU, Sweden

[x0, lb, ub] = ricenoise_lsqbounds;

nrm = max(s);

m = lsqcurvefit(@ricenoise_fit2data_gud, x0, b, s/nrm, lb, ub) .* [nrm 1 1];

