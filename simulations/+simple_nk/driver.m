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
M_.fname = 'simple_nk';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('simple_nk.log');
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'eps_a'};
M_.exo_names_tex(1) = {'{\varepsilon_a}'};
M_.exo_names_long(1) = {'technology shock'};
M_.exo_names(2) = {'eps_z'};
M_.exo_names_tex(2) = {'{\varepsilon_z}'};
M_.exo_names_long(2) = {'preference shock'};
M_.exo_names(3) = {'eps_m'};
M_.exo_names_tex(3) = {'{\varepsilon_m}'};
M_.exo_names_long(3) = {'money supply shock innovation'};
M_.endo_names = cell(29,1);
M_.endo_names_tex = cell(29,1);
M_.endo_names_long = cell(29,1);
M_.endo_names(1) = {'C'};
M_.endo_names_tex(1) = {'{C}'};
M_.endo_names_long(1) = {'Consumption'};
M_.endo_names(2) = {'W_real'};
M_.endo_names_tex(2) = {'{\frac{W}{P}}'};
M_.endo_names_long(2) = {'Real Wage'};
M_.endo_names(3) = {'Pi'};
M_.endo_names_tex(3) = {'{\Pi}'};
M_.endo_names_long(3) = {'inflation'};
M_.endo_names(4) = {'A'};
M_.endo_names_tex(4) = {'{A}'};
M_.endo_names_long(4) = {'AR(1) technology process'};
M_.endo_names(5) = {'N'};
M_.endo_names_tex(5) = {'{N}'};
M_.endo_names_long(5) = {'Hours worked'};
M_.endo_names(6) = {'R'};
M_.endo_names_tex(6) = {'{R^n}'};
M_.endo_names_long(6) = {'Nominal Interest Rate'};
M_.endo_names(7) = {'realinterest'};
M_.endo_names_tex(7) = {'{R^{r}}'};
M_.endo_names_long(7) = {'Real Interest Rate'};
M_.endo_names(8) = {'Y'};
M_.endo_names_tex(8) = {'{Y}'};
M_.endo_names_long(8) = {'Output'};
M_.endo_names(9) = {'Q'};
M_.endo_names_tex(9) = {'{Q}'};
M_.endo_names_long(9) = {'Bond price'};
M_.endo_names(10) = {'Z'};
M_.endo_names_tex(10) = {'{Z}'};
M_.endo_names_long(10) = {'AR(1) preference shock process'};
M_.endo_names(11) = {'S'};
M_.endo_names_tex(11) = {'{S}'};
M_.endo_names_long(11) = {'Price dispersion'};
M_.endo_names(12) = {'Pi_star'};
M_.endo_names_tex(12) = {'{\Pi^*}'};
M_.endo_names_long(12) = {'Optimal reset price'};
M_.endo_names(13) = {'x_aux_1'};
M_.endo_names_tex(13) = {'{x_1}'};
M_.endo_names_long(13) = {'aux. var. 1 recursive price setting'};
M_.endo_names(14) = {'x_aux_2'};
M_.endo_names_tex(14) = {'{x_2}'};
M_.endo_names_long(14) = {'aux. var. 2 recursive price setting'};
M_.endo_names(15) = {'MC'};
M_.endo_names_tex(15) = {'{mc}'};
M_.endo_names_long(15) = {'real marginal costs'};
M_.endo_names(16) = {'M_real'};
M_.endo_names_tex(16) = {'{M/P}'};
M_.endo_names_long(16) = {'real money stock'};
M_.endo_names(17) = {'i_ann'};
M_.endo_names_tex(17) = {'{i^{ann}}'};
M_.endo_names_long(17) = {'annualized nominal interest rate'};
M_.endo_names(18) = {'pi_ann'};
M_.endo_names_tex(18) = {'{\pi^{ann}}'};
M_.endo_names_long(18) = {'annualized inflation rate'};
M_.endo_names(19) = {'r_real_ann'};
M_.endo_names_tex(19) = {'{r^{r,ann}}'};
M_.endo_names_long(19) = {'annualized real interest rate'};
M_.endo_names(20) = {'P'};
M_.endo_names_tex(20) = {'{P}'};
M_.endo_names_long(20) = {'price level'};
M_.endo_names(21) = {'log_m_nominal'};
M_.endo_names_tex(21) = {'{log(M)}'};
M_.endo_names_long(21) = {'log nominal money stock'};
M_.endo_names(22) = {'log_y'};
M_.endo_names_tex(22) = {'{log(Y)}'};
M_.endo_names_long(22) = {'log output'};
M_.endo_names(23) = {'log_W_real'};
M_.endo_names_tex(23) = {'{log(W/P)}'};
M_.endo_names_long(23) = {'log real wage'};
M_.endo_names(24) = {'log_N'};
M_.endo_names_tex(24) = {'{log(N)}'};
M_.endo_names_long(24) = {'log hours'};
M_.endo_names(25) = {'log_P'};
M_.endo_names_tex(25) = {'{log(P)}'};
M_.endo_names_long(25) = {'log price level'};
M_.endo_names(26) = {'log_A'};
M_.endo_names_tex(26) = {'{log(A)}'};
M_.endo_names_long(26) = {'log technology level'};
M_.endo_names(27) = {'log_Z'};
M_.endo_names_tex(27) = {'{log(Z)}'};
M_.endo_names_long(27) = {'log preference shock'};
M_.endo_names(28) = {'money_growth'};
M_.endo_names_tex(28) = {'{\Delta m_q}'};
M_.endo_names_long(28) = {'money growth'};
M_.endo_names(29) = {'money_growth_ann'};
M_.endo_names_tex(29) = {'{\Delta m^{ann}}'};
M_.endo_names_long(29) = {'money growth annualized'};
M_.endo_partitions = struct();
M_.param_names = cell(13,1);
M_.param_names_tex = cell(13,1);
M_.param_names_long = cell(13,1);
M_.param_names(1) = {'alppha'};
M_.param_names_tex(1) = {'{\alpha}'};
M_.param_names_long(1) = {'capital share'};
M_.param_names(2) = {'betta'};
M_.param_names_tex(2) = {'{\beta}'};
M_.param_names_long(2) = {'discount factor'};
M_.param_names(3) = {'rho_a'};
M_.param_names_tex(3) = {'{\rho_a}'};
M_.param_names_long(3) = {'autocorrelation technology shock'};
M_.param_names(4) = {'rho_m'};
M_.param_names_tex(4) = {'{\rho_{\zeta}}'};
M_.param_names_long(4) = {'autocorrelation monetary demand shock'};
M_.param_names(5) = {'rho_z'};
M_.param_names_tex(5) = {'{\rho_{z}}'};
M_.param_names_long(5) = {'autocorrelation monetary demand shock'};
M_.param_names(6) = {'siggma'};
M_.param_names_tex(6) = {'{\sigma}'};
M_.param_names_long(6) = {'inverse EIS'};
M_.param_names(7) = {'varphi'};
M_.param_names_tex(7) = {'{\varphi}'};
M_.param_names_long(7) = {'inverse Frisch elasticity'};
M_.param_names(8) = {'phi_pi'};
M_.param_names_tex(8) = {'{\phi_{\pi}}'};
M_.param_names_long(8) = {'inflation feedback Taylor Rule'};
M_.param_names(9) = {'phi_y'};
M_.param_names_tex(9) = {'{\phi_{y}}'};
M_.param_names_long(9) = {'output feedback Taylor Rule'};
M_.param_names(10) = {'eta'};
M_.param_names_tex(10) = {'{\eta}'};
M_.param_names_long(10) = {'semi-elasticity of money demand'};
M_.param_names(11) = {'epsilon'};
M_.param_names_tex(11) = {'{\epsilon}'};
M_.param_names_long(11) = {'demand elasticity'};
M_.param_names(12) = {'theta'};
M_.param_names_tex(12) = {'{\theta}'};
M_.param_names_long(12) = {'Calvo parameter'};
M_.param_names(13) = {'tau'};
M_.param_names_tex(13) = {'{\tau}'};
M_.param_names_long(13) = {'labor subsidy'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 29;
M_.param_nbr = 13;
M_.orig_endo_nbr = 29;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 29;
M_.eq_nbr = 29;
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
 0 7 36;
 0 8 0;
 0 9 37;
 1 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 2 16 38;
 3 17 0;
 0 18 0;
 0 19 39;
 0 20 40;
 0 21 0;
 4 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 5 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 0 32 0;
 0 33 0;
 6 34 0;
 0 35 0;]';
M_.nstatic = 19;
M_.nfwrd   = 4;
M_.npred   = 5;
M_.nboth   = 1;
M_.nsfwrd   = 5;
M_.nspred   = 6;
M_.ndynamic   = 10;
M_.dynamic_tmp_nbr = [14; 3; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'FOC Wages, eq. (2)' ;
  2 , 'name' , 'Euler equation eq. (3)' ;
  3 , 'name' , 'Definition nominal interest rate), p. 22 top' ;
  4 , 'name' , 'Aggregate output, above eq. (14)' ;
  5 , 'name' , 'Definition Real interest rate' ;
  6 , 'name' , 'Market Clearing, eq. (15)' ;
  7 , 'name' , 'Technology Shock, eq. (6)' ;
  8 , 'name' , 'Preference Shock, p.54' ;
  9 , 'name' , 'definition nominal money growth' ;
  10 , 'name' , 'exogenous process for money supply growth rate, eq. (35)' ;
  11 , 'name' , 'definition annualized nominal money growth' ;
  12 , 'name' , 'Definition marginal cost' ;
  13 , 'name' , 'LOM prices, eq. (7)' ;
  14 , 'name' , 'LOM price dispersion' ;
  15 , 'name' , 'FOC price setting' ;
  16 , 'name' , 'Auxiliary price setting recursion 1' ;
  17 , 'name' , 'Auxiliary price setting recursion 2' ;
  18 , 'name' , 'Definition log output' ;
  19 , 'name' , 'Definition log real wage' ;
  20 , 'name' , 'Definition log hours' ;
  21 , 'name' , 'Annualized inflation' ;
  22 , 'name' , 'Annualized nominal interest rate' ;
  23 , 'name' , 'Annualized real interest rate' ;
  24 , 'name' , 'Real money demand, eq. (4)' ;
  25 , 'name' , 'definition nominal money stock' ;
  26 , 'name' , 'Definition price level' ;
  27 , 'name' , 'Definition log price level' ;
  28 , 'name' , 'Definition log TFP' ;
  29 , 'name' , 'Definition log preference' ;
};
M_.mapping.C.eqidx = [1 2 6 16 17 ];
M_.mapping.W_real.eqidx = [1 12 19 ];
M_.mapping.Pi.eqidx = [2 5 9 13 14 16 17 21 26 ];
M_.mapping.A.eqidx = [4 7 28 ];
M_.mapping.N.eqidx = [1 4 12 20 ];
M_.mapping.R.eqidx = [3 5 22 24 ];
M_.mapping.realinterest.eqidx = [5 23 ];
M_.mapping.Y.eqidx = [4 6 12 16 17 18 24 ];
M_.mapping.Q.eqidx = [2 3 ];
M_.mapping.Z.eqidx = [2 8 16 17 29 ];
M_.mapping.S.eqidx = [4 12 14 ];
M_.mapping.Pi_star.eqidx = [13 14 15 ];
M_.mapping.x_aux_1.eqidx = [15 16 ];
M_.mapping.x_aux_2.eqidx = [15 17 ];
M_.mapping.MC.eqidx = [12 16 ];
M_.mapping.M_real.eqidx = [9 24 25 ];
M_.mapping.i_ann.eqidx = [22 ];
M_.mapping.pi_ann.eqidx = [21 ];
M_.mapping.r_real_ann.eqidx = [23 ];
M_.mapping.P.eqidx = [25 26 27 ];
M_.mapping.log_m_nominal.eqidx = [25 ];
M_.mapping.log_y.eqidx = [18 ];
M_.mapping.log_W_real.eqidx = [19 ];
M_.mapping.log_N.eqidx = [20 ];
M_.mapping.log_P.eqidx = [27 ];
M_.mapping.log_A.eqidx = [28 ];
M_.mapping.log_Z.eqidx = [29 ];
M_.mapping.money_growth.eqidx = [9 10 11 ];
M_.mapping.money_growth_ann.eqidx = [11 ];
M_.mapping.eps_a.eqidx = [7 ];
M_.mapping.eps_z.eqidx = [8 ];
M_.mapping.eps_m.eqidx = [10 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [4 10 11 16 20 28 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(29, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(13, 1);
M_.endo_trends = struct('deflator', cell(29, 1), 'log_deflator', cell(29, 1), 'growth_factor', cell(29, 1), 'log_growth_factor', cell(29, 1));
M_.NNZDerivatives = [89; -1; -1; ];
M_.static_tmp_nbr = [11; 3; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(6) = 1;
siggma = M_.params(6);
M_.params(7) = 5;
varphi = M_.params(7);
M_.params(8) = 1.5;
phi_pi = M_.params(8);
M_.params(9) = 0.125;
phi_y = M_.params(9);
M_.params(12) = 0.75;
theta = M_.params(12);
M_.params(4) = 0.5;
rho_m = M_.params(4);
M_.params(5) = 0.5;
rho_z = M_.params(5);
M_.params(3) = 0.9;
rho_a = M_.params(3);
M_.params(2) = 0.99;
betta = M_.params(2);
M_.params(10) = 3.77;
eta = M_.params(10);
M_.params(1) = 0.25;
alppha = M_.params(1);
M_.params(11) = 9;
epsilon = M_.params(11);
M_.params(13) = 0;
tau = M_.params(13);
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(3, 3) = 6.25e-06;
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 15;
options_.order = 1;
var_list_ = {'pi_ann';'log_y';'log_N';'log_W_real';'log_P';'i_ann';'r_real_ann';'log_m_nominal';'money_growth_ann'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = 2.5e-05;
M_.Sigma_e(3, 3) = 0;
options_.impulse_responses.plot_threshold = 0;
options_.irf = 15;
options_.order = 1;
var_list_ = {'pi_ann';'log_y';'log_N';'log_W_real';'log_P';'i_ann';'r_real_ann';'log_m_nominal';'log_Z'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.0001;
M_.Sigma_e(2, 2) = 0;
options_.impulse_responses.plot_threshold = 0;
options_.irf = 15;
options_.order = 1;
var_list_ = {'pi_ann';'log_y';'log_N';'log_W_real';'log_P';'i_ann';'r_real_ann';'log_m_nominal';'log_A'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('simple_nk_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('simple_nk_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('simple_nk_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('simple_nk_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('simple_nk_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('simple_nk_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('simple_nk_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
