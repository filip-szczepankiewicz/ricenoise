function s = ricenoise_data2bias_gud(s, sigma)
% function s = ricenoise_data2bias_gud(s, sigma)

s = sqrt( s.^2 + (sigma * sqrt(pi/2)).^2 );