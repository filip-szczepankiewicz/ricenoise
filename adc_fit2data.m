function s = adc_fit2data(m, b)

s = m(1) * exp(-b*m(2));