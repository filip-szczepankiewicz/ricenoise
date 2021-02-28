function S = ricenoise_data2noisy(S, sigma)
% function S = ricenoise_data2noisy(S, SNR)
% Filip Szczepankiewicz, LU, Sweden
% 
% This application has the following interpretation.
% Given that the true signal is 1, the signal to noise ration 
% equal to SNR. 

S = sqrt((S + randn(size(S)).*sigma).^2+(randn(size(S)).*sigma).^2);

