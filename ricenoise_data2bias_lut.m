function s = ricenoise_data2bias_lut(s, sigma, lut)
% function s = ricenoise_data2bias_lut(s, sigma, lut)

n = sigma./s;

f = interp1(lut.sigma,lut.f,n, 'spline');

s = f.*s;

ilo = n>max(lut.sigma); % low snr
ihi = n<min(lut.sigma); % high snr

% Reileight limit at low snr
if any(ilo)
    S(ilo) = m(3) * sqrt(pi/2);
end

% No error at high snr
if any(ihi)
    S(ihi) = t(ihi);
end


