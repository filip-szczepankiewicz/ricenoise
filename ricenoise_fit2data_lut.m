function s = ricenoise_fit2data_lut(m, b, lut)
% function S = ricenoise_fit2data_lut(m, b, lut)
% Filip Szczepankiewicz, LU, Sweden
% 
% lut has two fields that contain error factor (f) and the associated
% standard deviation (sigma).

s = m(1) * exp(-b*m(2));

s = ricenoise_data2bias_lut(s, m(3), lut);