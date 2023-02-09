function s_out = ricenoise_data2bias_lut(s, sigma, lut)
% function s = ricenoise_data2bias_lut(s, sigma, lut)

n = sigma./s;

f = interp1(lut.sigma,lut.f,n, 'spline');

s_out = f.*s;

ilo = n > max(lut.sigma); % low snr
ihi = n < min(lut.sigma); % high snr

% Reileight limit at low snr
if any(ilo)
    s_out(ilo) = sigma * sqrt(pi/2);
end

% No error at high snr
if any(ihi)
    s_out(ihi) = s(ihi);
end


