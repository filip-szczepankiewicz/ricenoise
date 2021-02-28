% Filip Szczepankiewicz, LU, Sweden

clear

b  = linspace(0,4,300);
D  = 1;
s0 = 3;
snr = 5;

s = s0 * exp(-b*D);

sigma = s0/snr;


tic
s_sim = mean(ricenoise_data2noisy(s' * ones(100,1)', sigma),2);
toc

tic
s_mkd = ricenoise_fit2data_mkd([s0 D sigma], b);
toc

tic
s_gud = ricenoise_fit2data_gud([s0 D sigma], b);
toc

lut = load('ricenoise_lut.mat');
tic
s_lut = ricenoise_fit2data_lut([s0 D sigma], b, lut);
toc


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

set(gcf, 'color', 'w')