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
    T = Gali_2007_LINEAR.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(15, 28);
g1(1,22)=(-1);
g1(1,15)=1;
g1(1,17)=1;
g1(1,24)=(-params(1));
g1(1,25)=(-(1-params(1)*(1-params(2))));
g1(2,1)=(-1);
g1(2,13)=1;
g1(2,17)=(-params(8));
g1(3,1)=(-(1-params(2)));
g1(3,8)=1;
g1(3,13)=(-params(2));
g1(4,5)=(-params(17));
g1(4,20)=params(17);
g1(4,6)=1;
g1(4,21)=(-1);
g1(4,22)=(-params(19));
g1(4,15)=params(19);
g1(4,16)=params(18);
g1(4,23)=(-params(18));
g1(4,19)=(-params(17));
g1(4,26)=params(17);
g1(5,5)=(-params(7));
g1(5,6)=(-1);
g1(5,14)=1;
g1(5,19)=(-(1+params(7)));
g1(6,7)=1;
g1(6,22)=(-params(1));
g1(6,12)=params(16);
g1(7,5)=1;
g1(7,11)=(-1);
g1(7,12)=1;
g1(7,14)=1;
g1(8,1)=1;
g1(8,11)=(-1);
g1(8,12)=1;
g1(8,18)=1;
g1(9,5)=(-(1-params(4)));
g1(9,1)=(-params(4));
g1(9,11)=1;
g1(9,19)=1-params(4);
g1(10,4)=(-params(24));
g1(10,19)=1;
g1(10,28)=(-1);
g1(11,6)=(-params(15));
g1(11,10)=(-1);
g1(11,11)=1;
g1(11,13)=(-params(21));
g1(12,7)=(-params(9));
g1(12,15)=1;
g1(13,2)=(-(1+params(12)));
g1(13,9)=1;
g1(13,10)=(-(1+params(12)));
g1(13,16)=1+params(12);
g1(14,2)=(-params(10));
g1(14,10)=(-params(11));
g1(14,16)=1;
g1(15,3)=(-params(13));
g1(15,10)=1;
g1(15,27)=(-1);

end
