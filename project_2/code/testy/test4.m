% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test 4

addpath('..');

fprintf('==========================================================\n');
fprintf('TEST 4: Macierz diagonalna z ujemnymi wartościami własnymi\n');
fprintf('Weryfikacja wyboru wartości własnej najbliższej mu.\n');
fprintf('==========================================================\n\n');

n = 10;

% macierz diagonalna
przek = [-5; -3; -1; 0.5; 2; 4; 7; 10; 15; 20];
pod = zeros(n - 1, 1);
nad = zeros(n - 1, 1);

% wybór mu (blisko -3)
mu = -2.8;

tol = 1e-14;
maxIter = 100;

[lambda_num, x, errEst] = P2Z14_TPA_glowne(pod, przek, nad, mu, tol, maxIter);

lambda_wzor = -3;

Ax = iloczyn_tridiagonalny(pod, przek, nad, x);
residuum = norm(Ax - lambda_num * x);
blad = abs(lambda_num - lambda_wzor);

fprintf('lambda_wzor   = %g\n', lambda_wzor);
fprintf('mu            = %g\n', mu);
fprintf('lambda_num    = %g\n', lambda_num);
fprintf('błąd          = %g\n', blad);
fprintf('residuum      = %g\n', residuum);
