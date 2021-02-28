function S = ricenoise_fit2data_gud(m, b)
% function S = ricenoise_fit2data_gud(m, b)
% Filip Szczepankiewicz, LU, Sweden

N = m(1) * exp(-b*m(2));

S = sqrt( N.^2 + (m(3) * sqrt(pi/2)).^2 );