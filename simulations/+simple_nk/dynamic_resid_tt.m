function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 14);

T(1) = y(7)^params(6);
T(2) = y(11)^params(7);
T(3) = params(2)*(y(36)/y(7))^(-params(6));
T(4) = T(3)*y(38)/y(16);
T(5) = (y(11)/y(17))^(1-params(1));
T(6) = y(22)/y(4)*y(9);
T(7) = y(17)*y(14)*(1-params(1))/y(11);
T(8) = params(12)*y(9)^(params(11)/(1-params(1)));
T(9) = y(7)^(-params(6));
T(10) = y(16)*T(9);
T(11) = y(14)*T(10);
T(12) = params(2)*params(12)*y(37)^(params(11)+params(1)*params(11)/(1-params(1)));
T(13) = params(2)*params(12)*y(37)^(params(11)-1);
T(14) = y(12)^params(10);

end
