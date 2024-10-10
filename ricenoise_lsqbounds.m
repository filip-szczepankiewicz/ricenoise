function [x0, lb, ub] = ricenoise_lsqbounds()
% function [x0, lb, ub] = ricenoise_lsqbounds()
% Filip Szczepankiewicz, LU, Sweden

x0 = [1   1    0.1 ];
lb = [.2  .01  0   ];
ub = [2   3.1  300 ];