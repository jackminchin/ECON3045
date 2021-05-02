function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = simple_nk.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(29, 1);
lhs = y(8);
rhs = T(1)*T(2);
residual(1) = lhs - rhs;
lhs = y(15);
rhs = T(4)/y(37);
residual(2) = lhs - rhs;
lhs = y(12);
rhs = 1/y(15);
residual(3) = lhs - rhs;
lhs = y(14);
rhs = y(10)*T(5);
residual(4) = lhs - rhs;
lhs = y(12);
rhs = y(37)*y(13);
residual(5) = lhs - rhs;
lhs = y(7);
rhs = y(14);
residual(6) = lhs - rhs;
lhs = log(y(10));
rhs = params(3)*log(y(1))+x(it_, 1);
residual(7) = lhs - rhs;
lhs = log(y(16));
rhs = params(5)*log(y(2))-x(it_, 2);
residual(8) = lhs - rhs;
lhs = y(34);
rhs = log(T(6));
residual(9) = lhs - rhs;
lhs = y(34);
rhs = params(4)*y(6)+x(it_, 3);
residual(10) = lhs - rhs;
lhs = y(35);
rhs = y(34)*4;
residual(11) = lhs - rhs;
lhs = y(21);
rhs = y(8)/T(7);
residual(12) = lhs - rhs;
lhs = 1;
rhs = params(12)*y(9)^(params(11)-1)+(1-params(12))*y(18)^(1-params(11));
residual(13) = lhs - rhs;
lhs = y(17);
rhs = (1-params(12))*y(18)^((-params(11))/(1-params(1)))+T(8)*y(3);
residual(14) = lhs - rhs;
lhs = y(18)^(1+params(11)*params(1)/(1-params(1)));
rhs = params(11)*y(19)/y(20)*(1-params(13))/(params(11)-1);
residual(15) = lhs - rhs;
lhs = y(19);
rhs = y(21)*T(11)+T(12)*y(39);
residual(16) = lhs - rhs;
lhs = y(20);
rhs = T(11)+T(13)*y(40);
residual(17) = lhs - rhs;
lhs = y(28);
rhs = log(y(14));
residual(18) = lhs - rhs;
lhs = y(29);
rhs = log(y(8));
residual(19) = lhs - rhs;
lhs = y(30);
rhs = log(y(11));
residual(20) = lhs - rhs;
lhs = y(24);
rhs = 4*log(y(9));
residual(21) = lhs - rhs;
lhs = y(23);
rhs = 4*log(y(12));
residual(22) = lhs - rhs;
lhs = y(25);
rhs = 4*log(y(13));
residual(23) = lhs - rhs;
lhs = y(22);
rhs = y(14)/T(14);
residual(24) = lhs - rhs;
lhs = y(27);
rhs = log(y(22)*y(26));
residual(25) = lhs - rhs;
lhs = y(9);
rhs = y(26)/y(5);
residual(26) = lhs - rhs;
lhs = y(31);
rhs = log(y(26));
residual(27) = lhs - rhs;
lhs = y(32);
rhs = log(y(10));
residual(28) = lhs - rhs;
lhs = y(33);
rhs = log(y(16));
residual(29) = lhs - rhs;

end
