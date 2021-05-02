function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 11);

T(1) = y(1)^params(6);
T(2) = y(5)^params(7);
T(3) = (y(5)/y(11))^(1-params(1));
T(4) = y(11)*y(8)*(1-params(1))/y(5);
T(5) = y(3)^(params(11)-1);
T(6) = params(12)*y(3)^(params(11)/(1-params(1)));
T(7) = y(1)^(-params(6));
T(8) = y(10)*T(7);
T(9) = y(8)*T(8);
T(10) = params(2)*params(12)*y(3)^(params(11)+params(1)*params(11)/(1-params(1)));
T(11) = y(6)^params(10);

end
