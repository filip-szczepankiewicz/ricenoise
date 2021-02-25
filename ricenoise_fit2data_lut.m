function S = ricenoise_fit2data_lut(m, b, lut)
% function S = ricenoise_fit2data_lut(m, b, lut)
% Filip Szczepankiewicz, LU, Sweden
% 
% lut has two fields that contain error factor (f) and associated signal to
% noise ratio (snr).

t = exp(-b*m(2));

n = m(3) * t;

f = interp1(lut.snr,lut.f,n, 'spline');

S = f.*t;

ilo = n<min(lut.snr);
ihi = n>max(lut.snr);

% Reileight limit
if any(ilo)
    S(ilo) = t(ilo)./n(ilo) * sqrt(pi/2);
end

% No error
if any(ihi)
    S(ihi) = t(ihi);
end

S =  m(1) * S;

