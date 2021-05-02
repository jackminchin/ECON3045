function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = simple_nk.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(29, 43);
g1(1,7)=(-(T(2)*getPowerDeriv(y(7),params(6),1)));
g1(1,8)=1;
g1(1,11)=(-(T(1)*getPowerDeriv(y(11),params(7),1)));
g1(2,7)=(-(y(38)/y(16)*params(2)*(-y(36))/(y(7)*y(7))*T(15)/y(37)));
g1(2,36)=(-(y(38)/y(16)*params(2)*T(15)*1/y(7)/y(37)));
g1(2,37)=(-((-T(4))/(y(37)*y(37))));
g1(2,15)=1;
g1(2,16)=(-(T(3)*(-y(38))/(y(16)*y(16))/y(37)));
g1(2,38)=(-(T(3)*1/y(16)/y(37)));
g1(3,12)=1;
g1(3,15)=(-((-1)/(y(15)*y(15))));
g1(4,10)=(-T(5));
g1(4,11)=(-(y(10)*1/y(17)*T(17)));
g1(4,14)=1;
g1(4,17)=(-(y(10)*T(17)*(-y(11))/(y(17)*y(17))));
g1(5,37)=(-y(13));
g1(5,12)=1;
g1(5,13)=(-y(37));
g1(6,7)=1;
g1(6,14)=(-1);
g1(7,1)=(-(params(3)*1/y(1)));
g1(7,10)=1/y(10);
g1(7,41)=(-1);
g1(8,2)=(-(params(5)*1/y(2)));
g1(8,16)=1/y(16);
g1(8,42)=1;
g1(9,9)=(-(y(22)/y(4)/T(6)));
g1(9,4)=(-(y(9)*(-y(22))/(y(4)*y(4))/T(6)));
g1(9,22)=(-(y(9)*1/y(4)/T(6)));
g1(9,34)=1;
g1(10,6)=(-params(4));
g1(10,34)=1;
g1(10,43)=(-1);
g1(11,34)=(-4);
g1(11,35)=1;
g1(12,8)=(-(1/T(7)));
g1(12,11)=(-((-(y(8)*y(17)*(-(y(14)*(1-params(1))))/(y(11)*y(11))))/(T(7)*T(7))));
g1(12,14)=(-((-(y(8)*y(17)*(1-params(1))/y(11)))/(T(7)*T(7))));
g1(12,17)=(-((-(y(8)*y(14)*(1-params(1))/y(11)))/(T(7)*T(7))));
g1(12,21)=1;
g1(13,9)=(-(params(12)*getPowerDeriv(y(9),params(11)-1,1)));
g1(13,18)=(-((1-params(12))*getPowerDeriv(y(18),1-params(11),1)));
g1(14,9)=(-(y(3)*params(12)*getPowerDeriv(y(9),params(11)/(1-params(1)),1)));
g1(14,3)=(-T(8));
g1(14,17)=1;
g1(14,18)=(-((1-params(12))*getPowerDeriv(y(18),(-params(11))/(1-params(1)),1)));
g1(15,18)=getPowerDeriv(y(18),1+params(11)*params(1)/(1-params(1)),1);
g1(15,19)=(-(params(11)*(1-params(13))*1/y(20)/(params(11)-1)));
g1(15,20)=(-(params(11)*(1-params(13))*(-y(19))/(y(20)*y(20))/(params(11)-1)));
g1(16,7)=(-(y(21)*T(16)));
g1(16,37)=(-(y(39)*params(2)*params(12)*getPowerDeriv(y(37),params(11)+params(1)*params(11)/(1-params(1)),1)));
g1(16,14)=(-(y(21)*T(10)));
g1(16,16)=(-(y(21)*y(14)*T(9)));
g1(16,19)=1;
g1(16,39)=(-T(12));
g1(16,21)=(-T(11));
g1(17,7)=(-T(16));
g1(17,37)=(-(y(40)*params(2)*params(12)*getPowerDeriv(y(37),params(11)-1,1)));
g1(17,14)=(-T(10));
g1(17,16)=(-(y(14)*T(9)));
g1(17,20)=1;
g1(17,40)=(-T(13));
g1(18,14)=(-(1/y(14)));
g1(18,28)=1;
g1(19,8)=(-(1/y(8)));
g1(19,29)=1;
g1(20,11)=(-(1/y(11)));
g1(20,30)=1;
g1(21,9)=(-(4*1/y(9)));
g1(21,24)=1;
g1(22,12)=(-(4*1/y(12)));
g1(22,23)=1;
g1(23,13)=(-(4*1/y(13)));
g1(23,25)=1;
g1(24,12)=(-((-(y(14)*getPowerDeriv(y(12),params(10),1)))/(T(14)*T(14))));
g1(24,14)=(-(1/T(14)));
g1(24,22)=1;
g1(25,22)=(-(y(26)/(y(22)*y(26))));
g1(25,26)=(-(y(22)/(y(22)*y(26))));
g1(25,27)=1;
g1(26,9)=1;
g1(26,5)=(-((-y(26))/(y(5)*y(5))));
g1(26,26)=(-(1/y(5)));
g1(27,26)=(-(1/y(26)));
g1(27,31)=1;
g1(28,10)=(-(1/y(10)));
g1(28,32)=1;
g1(29,16)=(-(1/y(16)));
g1(29,33)=1;

end
