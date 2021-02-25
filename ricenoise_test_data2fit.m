% Filip Szczepankiewicz, LU, Sweden

clear

b  = linspace(0,10,20);
D  = 1;
s0 = 1;

snr = 50;


s = s0 * exp(-b*D);
s = repmat(s, 100, 1);
s = ricenoise_data2noisy(s, snr);
s = mean(s,1);

lut = load('ricenoise_lut.mat');

tic
m_gud = ricenoise_data2fit_gud(s, b);
t_gud = toc;

tic
m_lut = ricenoise_data2fit_lut(s, b, lut);
t_lut = toc;

tic
m_mkd = ricenoise_data2fit_mkd(s, b);
t_mkd = toc;


s_mkd = ricenoise_fit2data_mkd(m_mkd, b);
s_gud = ricenoise_fit2data_gud(m_gud, b);
s_lut = ricenoise_fit2data_lut(m_lut, b, lut);


clf
semilogy(b, s, 'ko')
hold on
semilogy(b, s_mkd, 'k')
semilogy(b, s_gud, 'r--')
semilogy(b, s_lut, 'b:')

ylabel('Signal')
xlabel('b-value [ms/�m^2]')

legend('Measured', 'Makedist', 'Gudbjartsson', 'Look up table')

disp('Methods          MKD    Gud    LUT')
disp(['Fit times [ms] = ' num2str([t_mkd t_lut t_gud]*1000, '%6.1f')])
disp(['Estimated SNR  = ' num2str([m_mkd(3) m_lut(3) m_gud(3)], '%6.1f')])

