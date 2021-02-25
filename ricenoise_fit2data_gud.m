function S = ricenoise_fit2data_gud(m, b)
% function S = ricenoise_fit2data_gud(m, b)
% Filip Szczepankiewicz, LU, Sweden

N = exp(-b*m(2));

S = m(1) * sqrt(N.^2 + (1./m(3) * sqrt(pi/2) ).^2);