function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = Gali_2007_LINEAR.static_resid_tt(T, y, x, params);
end
residual = zeros(15, 1);
lhs = y(13);
rhs = y(13)*params(1)+(1-params(1)*(1-params(2)))*y(14)-(y(11)-y(3));
residual(1) = lhs - rhs;
lhs = y(9)-y(4);
rhs = y(13)*params(8);
residual(2) = lhs - rhs;
lhs = y(4);
rhs = params(2)*y(9)+(1-params(2))*y(4);
residual(3) = lhs - rhs;
lhs = y(2);
rhs = y(2)-(y(11)-y(3))*params(19);
residual(4) = lhs - rhs;
lhs = y(10);
rhs = y(2)+y(1)*params(7)+y(15)*(1+params(7));
residual(5) = lhs - rhs;
lhs = y(3);
rhs = params(1)*y(3)-params(16)*y(8);
residual(6) = lhs - rhs;
lhs = y(8);
rhs = y(7)-y(1)-y(10);
residual(7) = lhs - rhs;
lhs = y(8);
rhs = y(7)-y(4)-y(14);
residual(8) = lhs - rhs;
lhs = y(7);
rhs = (1-params(4))*(y(1)-y(15))+y(4)*params(4);
residual(9) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(24)+x(2);
residual(10) = lhs - rhs;
lhs = y(7);
rhs = y(2)*params(15)+y(9)*params(21)+y(6);
residual(11) = lhs - rhs;
lhs = y(11);
rhs = y(3)*params(9)+params(12);
residual(12) = lhs - rhs;
lhs = y(5);
rhs = (1+params(12))*(y(6)+y(5)-y(12));
residual(13) = lhs - rhs;
lhs = y(12);
rhs = y(5)*params(10)+y(6)*params(11);
residual(14) = lhs - rhs;
lhs = y(6);
rhs = y(6)*params(13)+x(1);
residual(15) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
