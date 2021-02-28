function S = ricenoise_fit2data_mkd(m, b)
% function S = ricenoise_fit2data_mkd(m, b)
% Filip Szczepankiewicz, LU, Sweden

S = m(1) * exp( -b*m(2) );

for i = 1:numel(S)
    pd = makedist('Rician','s',S(i),'sigma',m(3));
    S(i) = mean(pd);
end
