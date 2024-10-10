function lut = ricenoise_lut_default()
% function lut = ricenoise_lut_default()

code_dir = fileparts(mfilename('fullpath'));
lut = load([code_dir filesep 'ricenoise_lut_default.mat']);