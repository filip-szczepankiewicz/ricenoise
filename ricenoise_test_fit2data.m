% Filip Szczepankiewicz, LU, Sweden

clear

b  = linspace(0,4,300);
D  = 1;
s0 = 3;
snr = 5;

s = s0 * exp(-b*D);

sigma = s0/snr;

lut = load('ricenoise_lut.mat');


s_sim = mean(ricenoise_data2noisy(s' * ones(100,1)', sigma),2);

s_mkd = ricenoise_data2bias_mkd(s, sigma);
s_gud = ricenoise_data2bias_gud(s, sigma);
s_lut = ricenoise_data2bias_lut(s, sigma, lut);


clf
subplot(2,1,1)
semilogy(b, s_sim, 'k')
hold on
semilogy(b, s_mkd, 'b')
semilogy(b, s_gud, 'r')
semilogy(b, s_lut, 'g')

ylabel('Signal')
xlabel('b-value [ms/µm^2]')
title('Signal model variants')
legend('Numerical', 'Makedist', 'Gudbjartsson', 'Look up table')

subplot(2,1,2)
e_gud = s_mkd-s_gud;
e_lut = s_mkd-s_lut;
semilogy(b, abs(e_gud), 'r')
hold on
semilogy(b, abs(e_lut), 'g')

ylabel('Signal error')
xlabel('b-value [ms/µm^2]')
title(['Error Gud vs. LUT was ' num2str(mean(e_gud),'%0.1e') ' vs. ' num2str(mean(e_lut),'%0.1e')])

% axis tight

set(gcf, 'color', 'w')