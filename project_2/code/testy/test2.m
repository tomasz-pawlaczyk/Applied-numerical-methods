% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test 2

addpath('..');

fprintf('====================================================\n');
fprintf('TEST 2: Macierz diagonalna z małym sprzężeniem\n');
fprintf('Test stabilności rozwiązywania układów liniowych\n');
fprintf('i zachowania odwrotnej metody potęgowej.\n');
fprintf('====================================================\n\n');

n = 80;
epsilon = 1e-6;

przek = (1:n)';
pod = epsilon*ones(n-1, 1);
nad = epsilon*ones(n-1, 1);

k = 37;
mu = przek(k) + 0.02;

[lambda_num, v] = P2Z14_TPA_glowne(pod, przek, nad, mu);
lambda_dokl = przek(k);

res = norm(iloczyn_tridiagonalny(pod, przek, nad, v) - lambda_num * v);

fprintf('lambda dokladna = %.15f\n', lambda_dokl);
fprintf('lambda num      = %.15f\n', lambda_num);
fprintf('błąd            = %.3e\n', abs(lambda_dokl - lambda_num));
fprintf('residuum        = %.3e\n', res);