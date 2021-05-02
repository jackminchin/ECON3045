%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Gali_2007_LINEAR';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Gali_2007_LINEAR.log');
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'epsilon_g'};
M_.exo_names_tex(1) = {'epsilon\_g'};
M_.exo_names_long(1) = {'epsilon_g'};
M_.exo_names(2) = {'epsilon_z'};
M_.exo_names_tex(2) = {'epsilon\_z'};
M_.exo_names_long(2) = {'epsilon_z'};
M_.endo_names = cell(15,1);
M_.endo_names_tex = cell(15,1);
M_.endo_names_long = cell(15,1);
M_.endo_names(1) = {'n'};
M_.endo_names_tex(1) = {'n'};
M_.endo_names_long(1) = {'n'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'pi'};
M_.endo_names_tex(3) = {'pi'};
M_.endo_names_long(3) = {'pi'};
M_.endo_names(4) = {'k'};
M_.endo_names_tex(4) = {'k'};
M_.endo_names_long(4) = {'k'};
M_.endo_names(5) = {'b'};
M_.endo_names_tex(5) = {'b'};
M_.endo_names_long(5) = {'b'};
M_.endo_names(6) = {'g'};
M_.endo_names_tex(6) = {'g'};
M_.endo_names_long(6) = {'g'};
M_.endo_names(7) = {'y'};
M_.endo_names_tex(7) = {'y'};
M_.endo_names_long(7) = {'y'};
M_.endo_names(8) = {'mu_hat_p'};
M_.endo_names_tex(8) = {'mu\_hat\_p'};
M_.endo_names_long(8) = {'mu_hat_p'};
M_.endo_names(9) = {'i'};
M_.endo_names_tex(9) = {'i'};
M_.endo_names_long(9) = {'i'};
M_.endo_names(10) = {'w'};
M_.endo_names_tex(10) = {'w'};
M_.endo_names_long(10) = {'w'};
M_.endo_names(11) = {'r'};
M_.endo_names_tex(11) = {'r'};
M_.endo_names_long(11) = {'r'};
M_.endo_names(12) = {'t'};
M_.endo_names_tex(12) = {'t'};
M_.endo_names_long(12) = {'t'};
M_.endo_names(13) = {'q'};
M_.endo_names_tex(13) = {'q'};
M_.endo_names_long(13) = {'q'};
M_.endo_names(14) = {'r_k'};
M_.endo_names_tex(14) = {'r\_k'};
M_.endo_names_long(14) = {'r_k'};
M_.endo_names(15) = {'z'};
M_.endo_names_tex(15) = {'z'};
M_.endo_names_long(15) = {'z'};
M_.endo_partitions = struct();
M_.param_names = cell(24,1);
M_.param_names_tex = cell(24,1);
M_.param_names_long = cell(24,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'delta'};
M_.param_names_long(2) = {'delta'};
M_.param_names(3) = {'mu_p'};
M_.param_names_tex(3) = {'mu\_p'};
M_.param_names_long(3) = {'mu_p'};
M_.param_names(4) = {'alpha'};
M_.param_names_tex(4) = {'alpha'};
M_.param_names_long(4) = {'alpha'};
M_.param_names(5) = {'lambda'};
M_.param_names_tex(5) = {'lambda'};
M_.param_names_long(5) = {'lambda'};
M_.param_names(6) = {'theta'};
M_.param_names_tex(6) = {'theta'};
M_.param_names_long(6) = {'theta'};
M_.param_names(7) = {'varphi'};
M_.param_names_tex(7) = {'varphi'};
M_.param_names_long(7) = {'varphi'};
M_.param_names(8) = {'eta'};
M_.param_names_tex(8) = {'eta'};
M_.param_names_long(8) = {'eta'};
M_.param_names(9) = {'phi_pi'};
M_.param_names_tex(9) = {'phi\_pi'};
M_.param_names_long(9) = {'phi_pi'};
M_.param_names(10) = {'phi_b'};
M_.param_names_tex(10) = {'phi\_b'};
M_.param_names_long(10) = {'phi_b'};
M_.param_names(11) = {'phi_g'};
M_.param_names_tex(11) = {'phi\_g'};
M_.param_names_long(11) = {'phi_g'};
M_.param_names(12) = {'rho'};
M_.param_names_tex(12) = {'rho'};
M_.param_names_long(12) = {'rho'};
M_.param_names(13) = {'rho_g'};
M_.param_names_tex(13) = {'rho\_g'};
M_.param_names_long(13) = {'rho_g'};
M_.param_names(14) = {'gamma_g'};
M_.param_names_tex(14) = {'gamma\_g'};
M_.param_names_long(14) = {'gamma_g'};
M_.param_names(15) = {'gamma_c'};
M_.param_names_tex(15) = {'gamma\_c'};
M_.param_names_long(15) = {'gamma_c'};
M_.param_names(16) = {'lambda_p'};
M_.param_names_tex(16) = {'lambda\_p'};
M_.param_names_long(16) = {'lambda_p'};
M_.param_names(17) = {'THETA_n'};
M_.param_names_tex(17) = {'THETA\_n'};
M_.param_names_long(17) = {'THETA_n'};
M_.param_names(18) = {'THETA_t'};
M_.param_names_tex(18) = {'THETA\_t'};
M_.param_names_long(18) = {'THETA_t'};
M_.param_names(19) = {'sigma'};
M_.param_names_tex(19) = {'sigma'};
M_.param_names_long(19) = {'sigma'};
M_.param_names(20) = {'gamma_c_tilde'};
M_.param_names_tex(20) = {'gamma\_c\_tilde'};
M_.param_names_long(20) = {'gamma_c_tilde'};
M_.param_names(21) = {'gamma_i'};
M_.param_names_tex(21) = {'gamma\_i'};
M_.param_names_long(21) = {'gamma_i'};
M_.param_names(22) = {'Gamma'};
M_.param_names_tex(22) = {'Gamma'};
M_.param_names_long(22) = {'Gamma'};
M_.param_names(23) = {'phi_y'};
M_.param_names_tex(23) = {'phi\_y'};
M_.param_names_long(23) = {'phi_y'};
M_.param_names(24) = {'rho_a'};
M_.param_names_tex(24) = {'rho\_a'};
M_.param_names_long(24) = {'rho_a'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 15;
M_.param_nbr = 24;
M_.orig_endo_nbr = 15;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 15;
M_.eq_nbr = 15;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 5 20;
 0 6 21;
 0 7 22;
 1 8 0;
 2 9 0;
 3 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 23;
 0 17 24;
 0 18 25;
 4 19 26;]';
M_.nstatic = 5;
M_.nfwrd   = 6;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 7;
M_.nspred   = 4;
M_.ndynamic   = 10;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'q' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'k' ;
  4 , 'name' , 'c' ;
  5 , 'name' , 'w' ;
  6 , 'name' , 'pi' ;
  7 , 'name' , 'mu_hat_p' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'y' ;
  10 , 'name' , 'z' ;
  11 , 'name' , '11' ;
  12 , 'name' , 'r' ;
  13 , 'name' , 'b' ;
  14 , 'name' , 't' ;
  15 , 'name' , 'g' ;
};
M_.mapping.n.eqidx = [4 5 7 9 ];
M_.mapping.c.eqidx = [4 5 11 ];
M_.mapping.pi.eqidx = [1 4 6 12 ];
M_.mapping.k.eqidx = [2 3 8 9 ];
M_.mapping.b.eqidx = [13 14 ];
M_.mapping.g.eqidx = [11 13 14 15 ];
M_.mapping.y.eqidx = [7 8 9 11 ];
M_.mapping.mu_hat_p.eqidx = [6 7 8 ];
M_.mapping.i.eqidx = [2 3 11 ];
M_.mapping.w.eqidx = [5 7 ];
M_.mapping.r.eqidx = [1 4 12 ];
M_.mapping.t.eqidx = [4 13 14 ];
M_.mapping.q.eqidx = [1 2 ];
M_.mapping.r_k.eqidx = [1 8 ];
M_.mapping.z.eqidx = [4 5 9 10 ];
M_.mapping.epsilon_g.eqidx = [15 ];
M_.mapping.epsilon_z.eqidx = [10 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [4 5 6 15 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(15, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(24, 1);
M_.endo_trends = struct('deflator', cell(15, 1), 'log_deflator', cell(15, 1), 'growth_factor', cell(15, 1), 'log_growth_factor', cell(15, 1));
M_.NNZDerivatives = [59; 0; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(3) = 1.2;
mu_p = M_.params(3);
M_.params(2) = 0.025;
delta = M_.params(2);
M_.params(4) = 0.3333333333333333;
alpha = M_.params(4);
M_.params(5) = 0.50;
lambda = M_.params(5);
M_.params(6) = 0.75;
theta = M_.params(6);
M_.params(7) = 0.2;
varphi = M_.params(7);
M_.params(8) = 1.0;
eta = M_.params(8);
M_.params(9) = 1.5;
phi_pi = M_.params(9);
M_.params(23) = 0.5;
phi_y = M_.params(23);
M_.params(10) = 0.33;
phi_b = M_.params(10);
M_.params(11) = 0.1;
phi_g = M_.params(11);
M_.params(13) = 0.9;
rho_g = M_.params(13);
M_.params(24) = 0.9;
rho_a = M_.params(24);
M_.params(14) = 0.2;
gamma_g = M_.params(14);
M_.params(16) = (1-M_.params(1)*M_.params(6))*(1-M_.params(6))/M_.params(6);
lambda_p = M_.params(16);
M_.params(12) = 1/M_.params(1)-1;
rho = M_.params(12);
M_.params(15) = 1-M_.params(14)-M_.params(2)*M_.params(4)/((M_.params(2)+M_.params(12))*M_.params(3));
gamma_c = M_.params(15);
M_.params(20) = M_.params(14)+M_.params(15);
gamma_c_tilde = M_.params(20);
M_.params(21) = 1-M_.params(20);
gamma_i = M_.params(21);
PHI = 1/(gamma_c*mu_p - lambda*(1-alpha));
M_.params(17) = M_.params(5)*PHI*(1-M_.params(4))*(1+M_.params(7));
THETA_n = M_.params(17);
M_.params(18) = M_.params(3)*M_.params(5)*PHI;
THETA_t = M_.params(18);
M_.params(19) = M_.params(3)*M_.params(15)*PHI*(1-M_.params(5));
sigma = M_.params(19);
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = (0.1)^2;
options_.irf = 20;
options_.order = 1;
options_.periods = 1000;
var_list_ = {'y';'c';'i';'n';'w';'pi';'z';'g'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('Gali_2007_LINEAR_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Gali_2007_LINEAR_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Gali_2007_LINEAR_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Gali_2007_LINEAR_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Gali_2007_LINEAR_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Gali_2007_LINEAR_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Gali_2007_LINEAR_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
