function S = ricenoise_fit2data_lut(m, b, lut)
% function S = ricenoise_fit2data_lut(m, b, lut)
% Filip Szczepankiewicz, LU, Sweden
% 
% lut has two fields that contain error factor (f) and the associated
% standard deviation (sigma).

t =  m(1) * exp(-b*m(2));

n = m(3)./t;

f = interp1(lut.sigma,lut.f,n, 'spline');

S = f.*t;

ilo = n>max(lut.sigma);
ihi = n<min(lut.sigma);

% Reileight limit
if any(ilo)
    S(ilo) = m(3) * sqrt(pi/2);
end

% No error
if any(ihi)
    S(ihi) = t(ihi);
end

% S = m(1) * S;
