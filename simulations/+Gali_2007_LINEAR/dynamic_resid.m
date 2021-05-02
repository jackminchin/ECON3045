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
    T = Gali_2007_LINEAR.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(15, 1);
lhs = y(17);
rhs = params(1)*y(24)+(1-params(1)*(1-params(2)))*y(25)-(y(15)-y(22));
residual(1) = lhs - rhs;
lhs = y(13)-y(1);
rhs = y(17)*params(8);
residual(2) = lhs - rhs;
lhs = y(8);
rhs = params(2)*y(13)+(1-params(2))*y(1);
residual(3) = lhs - rhs;
lhs = y(6);
rhs = y(21)-(y(15)-y(22))*params(19)-params(17)*(y(20)-y(5)+y(26)-y(19))+params(18)*(y(23)-y(16));
residual(4) = lhs - rhs;
lhs = y(14);
rhs = y(6)+y(5)*params(7)+y(19)*(1+params(7));
residual(5) = lhs - rhs;
lhs = y(7);
rhs = params(1)*y(22)-params(16)*y(12);
residual(6) = lhs - rhs;
lhs = y(12);
rhs = y(11)-y(5)-y(14);
residual(7) = lhs - rhs;
lhs = y(12);
rhs = y(11)-y(1)-y(18);
residual(8) = lhs - rhs;
lhs = y(11);
rhs = (1-params(4))*(y(5)-y(19))+y(1)*params(4);
residual(9) = lhs - rhs;
lhs = y(19);
rhs = params(24)*y(4)+x(it_, 2);
residual(10) = lhs - rhs;
lhs = y(11);
rhs = y(6)*params(15)+y(13)*params(21)+y(10);
residual(11) = lhs - rhs;
lhs = y(15);
rhs = y(7)*params(9)+params(12);
residual(12) = lhs - rhs;
lhs = y(9);
rhs = (1+params(12))*(y(10)+y(2)-y(16));
residual(13) = lhs - rhs;
lhs = y(16);
rhs = y(2)*params(10)+y(10)*params(11);
residual(14) = lhs - rhs;
lhs = y(10);
rhs = params(13)*y(3)+x(it_, 1);
residual(15) = lhs - rhs;

end
