function s = ricenoise_fit2data_mkd(m, b)
% function s = ricenoise_fit2data_mkd(m, b)
% Filip Szczepankiewicz, LU, Sweden

s = m(1) * exp( -b*m(2) );

s = ricenoise_data2bias_mkd(s, m(3));
