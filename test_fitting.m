clear

s0 = 1;
D = 1;
snr = 10;
sigma = s0/snr;

m = [s0 D sigma];

lut = load('ricenoise_lut');


b = linspace(0,1,2);

b = repmat(b, 20,1);
b = b(:);

s = adc_fit2data(m, b);

s2 = s;
s2(2:10:end) = 0;
b2 = b;
b2(2:10:end) = inf;


sl = linspace(0.05, .5, 30);
[x0, lb, ub] = ricenoise_lsqbounds;

for i = 1:numel(sl)
    sn = ricenoise_data2noisy(s, sl(i));
    
    sn2 = ricenoise_data2noisy(s2, sl(i));
    
    nrm = prctile(sn, 90);
    nrm2 = prctile(sn2, 90);
    
    m_lut(i,:) = lsqcurvefit(@(s, b)ricenoise_fit2data_lut(s, b, lut), x0, b, sn/nrm, lb, ub) .* [nrm 1 nrm];
    m_adc(i,:) = lsqcurvefit(@(s, b)adc_fit2data(s, b), x0(1:2), b, sn/nrm, lb(1:2), ub(1:2)) .* [nrm 1];
    
    m_lut2(i,:) = lsqcurvefit(@(s, b)ricenoise_fit2data_lut(s, b, lut), x0, b2, sn2/nrm2, lb, ub) .* [nrm2 1 nrm2];
    
end

%% PLOT
clf

subplot(2,1,1)
semilogy(b, s, 'k--')
hold on
semilogy(b, sn2, '.')


subplot(2,1,2)
plot(s0./sl, m_lut(:,2))
hold on
plot(s0./sl, m_adc(:,2))
plot(s0./sl, m_lut2(:,2), 'k--')

legend('LUT', 'ADC', 'LUT2')

