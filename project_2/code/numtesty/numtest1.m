% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Numeryczny test 1

addpath('..');

fprintf('====================================================\n');
fprintf('NUMERYCZNY TEST 1: Wpływ przesunięcia "mu"\n');
fprintf('Badanie zbieżności dla różnych wartości delta.\n');
fprintf('====================================================\n');

load('../data/T_dane.mat', 'T', 'lambda');
lambda = sort(lambda);

target_idx = 50;
lambda_dokl = lambda(target_idx);

fprintf('\nOCZEKIWANA WARTOŚĆ WŁASNA:\n');
fprintf('Indeks szukanej wart wł = %d\n', target_idx);
fprintf('Wartość szukanej wart wł = %.16f\n\n', lambda_dokl);

% postać tridiagonalna
n = size(T, 1);
przek = diag(T);
pod = diag(T, -1);
nad = diag(T, 1);

delta_vec = [1e-1, 1e-2, 1e-3];

wyniki = zeros(length(delta_vec), 7);

for k = 1:length(delta_vec)
    delta = delta_vec(k);
    mu = lambda_dokl + delta;

    [lambda_obl, v] = P2Z14_TPA_glowne(pod, przek, nad, mu);

    blad = abs(lambda_dokl - lambda_obl);
    resid = norm(iloczyn_tridiagonalny(pod, przek, nad, v) - lambda_obl * v);

    [~, found_idx] = min(abs(lambda - lambda_obl));
    lambda_found = lambda(found_idx);

    wyniki(k,:) = [ delta, mu, lambda_obl, lambda_found, ...
        found_idx, blad, resid ];
end

% Tabela wynikow
Ttab = table( ...
    wyniki(:,1), wyniki(:,2), wyniki(:,3), wyniki(:,4), ...
    wyniki(:,5), wyniki(:,6), wyniki(:,7), ...
    'VariableNames', {'delta', 'mu', 'lambda_obliczona', ...
        'lambda_znaleziona', 'found_idx', 'błąd', 'residuum' } );

disp(Ttab)

pause;

% Tabela pomocnicza: wartosci wlasne z bazy
idx_min = max(min(wyniki(:, 5)) - 2, 1);
idx_max = min(max(wyniki(:, 5)) + 2, length(lambda));

idx_range = (idx_min:idx_max)';
lambda_range = lambda(idx_range);

T_lambda = table(idx_range, lambda_range, 'VariableNames',{'id','lambda'});

fprintf('\nWartości własne z bazy w sąsiedztwie znalezionych indeksów:\n');
disp(T_lambda)