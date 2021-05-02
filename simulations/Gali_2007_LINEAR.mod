var n c pi k b g y mu_hat_p i w r t q r_k z;
varexo epsilon_g epsilon_z;


parameters beta delta mu_p alpha lambda theta varphi eta phi_pi phi_b phi_g rho rho_g gamma_g gamma_c lambda_p THETA_n THETA_t sigma gamma_c_tilde gamma_i Gamma phi_y rho_a;
beta = 0.99; % Gali: 0.99
mu_p = 1.2; % Gali: 1.2
delta = 0.025; % Gali: 0.025
alpha = 1/3; % Gali: 1/3
lambda = 0.50; % Gali: 0.5 
theta = 0.75; % Gali: 0.75
varphi = 0.2; % Gali: 0.2
eta = 1.0; % Gali: 1.0
phi_pi = 1.5; % Gali: 1.5
phi_y = 0.5; % Gali: 0.5
phi_b = 0.33; % Gali: 0.33
phi_g = 0.1; % Gali: 0.1
rho_g = 0.9; % Gali: 0.9
rho_a = 0.9;
gamma_g = 0.2; % Gali: 0.2

lambda_p = ((1-beta*theta)*(1-theta))/theta;
rho = 1/beta - 1;
gamma_c = 1-gamma_g-((delta*alpha)/((rho+delta)*(mu_p)));
gamma_c_tilde = gamma_c + gamma_g;
gamma_i = 1-gamma_c_tilde;

% Imperfect labor market!
PHI = 1/(gamma_c*mu_p - lambda*(1-alpha));
THETA_n = lambda*PHI*(1-alpha)*(1+varphi);
THETA_t = lambda*PHI*mu_p;
sigma = gamma_c*PHI*(1-lambda)*mu_p;

% Perfect Labor market!
%Gamma=1/(mu_p*varphi*gamma_c+(1-alpha)*(1-lambda*(1+varphi))); %p.244
%sigma=(1-lambda)*Gamma*(mu_p*varphi*gamma_c+(1-alpha)); %p.244
%THETA_n=lambda*Gamma*(1-alpha)*(1+varphi)*varphi; %p.244
%THETA_t=lambda*Gamma*mu_p*varphi; %p.244 




% Forward looking variables: q, r_k, pi, c, t, n

model(linear);



% HOUSEHOLDS: ----------------------------------------------------------
    % Tobin's q:
q = beta*q(+1) + (1-beta*(1-delta))*r_k(+1) - (r-pi(+1)); %23

    % Investment
i - k(-1) = eta*q; %24

    % Capital:
k = delta*i + (1-delta)*k(-1); %25


    % Euler eq:
c = c(+1) - sigma*(r-pi(+1)) - THETA_n*(n(+1)-n + z(+1)-z) + THETA_t*(t(+1)-t); %Euler ******(HERE, +z(+1)-z IS ADDED FROM SHOCK TO LABOR DISUTILITY)
% Deriving the euler equation given the same MRS as below yields the same
% parameter, THETA_n in front as on n.


    % Wages:
w = c + varphi*n + z*(1+varphi); %30 ******(HERE, (1+varphi)*z IS ADDED ACCORDING TO CHANGE IN CONSUMERS' N-FOC)
% As consumers do not take shock into account, MRS-equation for consumers
% will read MRS = C*N^(varphi)*z^(1+varphi)



% FIRMS: ----------------------------------------------------------
    % NKPC:
pi = beta*pi(+1) - lambda_p*mu_hat_p; %32

    % Markup #1:
mu_hat_p = y - n - w; %33 

    % Markup #2:
mu_hat_p = y - k(-1) - r_k; %34 

    % Production:
y = (1-alpha)*(n-z) + alpha*k(-1); %35 ******(HERE, -z IS ADDED FROM NEGATIVE SUPPLY-SHOCK ON LABOR-SIDE)

    
    % Technology
z = rho_a*z(-1) + epsilon_z;


% MARKET CLEARING: ----------------------------------------------------------
y = gamma_c*c + gamma_i*i + g; %36 



% POLICY: ----------------------------------------------------------
    % Taylor:
r = phi_pi*pi + rho; %18

    % Debt:
b=(1+rho)*(b(-1)+g-t); % 37

    % FP-rule:
t = phi_b*b(-1) + phi_g*g; %20


% Government spending
g = rho_g*g(-1)+epsilon_g;

end;



resid(1);
steady;
check;

shocks;
% STOCHASTIC SHOCK
var epsilon_z; stderr 0.1;

% DETERMINISTIC SHOCK
%var epsilon_z;
%periods 1;
%values 0.1;
end;




%simul(periods=100);
stoch_simul(order=1,irf=20,periods=1000) y c i n w pi z g;
