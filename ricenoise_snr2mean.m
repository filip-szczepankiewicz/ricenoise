function m = ricenoise_snr2mean(snr)
% function m = snr2ricemean(snr)
% Filip Szczepankiewicz, LU, Sweden
% 
% snr is defined as the signal-to-noise at signal = 1;

m = sqrt(  1 + ( 1./snr * sqrt(pi/2) ).^2  );
