% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test 1

addpath('..');

fprintf('====================================================\n');
fprintf('TEST 1: Macierz Toeplitza (a,b,a) / Laplace 1D\n');
fprintf('Sprawdzanie poprawności obliczenia wartości własnej\n');
fprintf('z wykorzystaniem znanego wzoru analitycznego.\n');
fprintf('lambda_k = 2 - 2*cos(k*pi/(n+1)),  k = 1,2,...,n\n');
fprintf('====================================================\n\n');

n = 100;

przek = 2 * ones(n, 1);
pod = -1 * ones(n - 1, 1);
nad = -1 * ones(n - 1, 1);

k = 25;
lambda_dokl = 2 - 2 * cos(k * pi / (n + 1));
mu = lambda_dokl + 0.01;

[lambda_num, v] = P2Z14_TPA_glowne(pod, przek, nad, mu);

res = norm(iloczyn_tridiagonalny(pod, przek, nad, v) - lambda_num * v);

fprintf('lambda dokladna = %.15f\n', lambda_dokl);
fprintf('lambda num      = %.15f\n', lambda_num);
fprintf('błąd            = %.3e\n', abs(lambda_dokl - lambda_num));
fprintf('residuum        = %.3e\n', res);