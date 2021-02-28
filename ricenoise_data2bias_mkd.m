function s = ricenoise_data2bias_mkd(s, sigma)
% function s = ricenoise_data2bias_mkd(s, sigma)

for i = 1:numel(s)
    pd = makedist('Rician','s',s(i),'sigma',sigma);
    s(i) = mean(pd);
end