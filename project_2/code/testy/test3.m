% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test 3

addpath('..');

fprintf('====================================================\n');
fprintf('TEST 3: Macierz trójdiagonalna Laplace’a (n = 200000) \n');
fprintf('Weryfikacja działania dla maksymalnego "n" \n');
fprintf('====================================================\n\n');

n = 200000;

pod = -1 * ones(n - 1, 1);
przek = 2 * ones(n, 1);
nad = -1 * ones(n - 1, 1);

k = round(0.25 * n); 
lambda_wzor = 2 - 2 * cos(k * pi / (n + 1));

% Musi być maksymalnie 1e-5, ponieważ dla większych znajdziemy inne wart wł
mu = lambda_wzor + 1e-5;

tol = 1e-14;
maxIter = 500;

tic;
[lambda_numeric, x] = P2Z14_TPA_glowne(pod, przek, nad, mu, tol, maxIter);
time = toc;

Ax = iloczyn_tridiagonalny(pod, przek, nad, x);
residuum = norm(Ax - lambda_numeric * x);

j = (1:n)';
v_analytic = sin(j * k * pi / (n + 1));
zgodnosc_kierunku_wektora = abs(x' * v_analytic) / (norm(x) * norm(v_analytic));

blad = abs(lambda_numeric - lambda_wzor);

fprintf('lambda_wzor     = %.16e\n', lambda_wzor);
fprintf('wartość "mu"    = %.16e\n', mu);
fprintf('lambda_numeric  = %.16e\n', lambda_numeric);
fprintf('blad            = %.3e\n', blad);
fprintf('residuum        = %.3e\n', residuum);
fprintf('Zgodność kier v = %.16f\n', zgodnosc_kierunku_wektora);
fprintf('time [s]        = %.6f\n', time);