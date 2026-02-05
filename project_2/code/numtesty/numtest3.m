% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Numeryczny test 3

addpath('..');

fprintf('\n====================================================\n');
fprintf('NUMERYCZNY TEST 3: Macierz diagonalna\n');
fprintf('Test poprawności algorytmu w przypadku granicznym.\n');
fprintf('Porównanie poprawnego i niepoprawnego przesunięcia mu.\n');
fprintf('====================================================\n\n');

n = 30;
rng(0);
przek = (10:10:10*n)';
pod = zeros(n - 1, 1);
nad = zeros(n - 1, 1);

% dokładna wartość własna (istniejąca w widmie)
lambda_dokl = 120;

% dwa przesunięcia:
% 1) poprawne – blisko wartości własnej
% 2) niepoprawne – w środku między 120 i 130
mu_vec = [122, 125];

for i = 1:length(mu_vec)
    mu = mu_vec(i);

    fprintf('--- Test dla mu = %.1f ---\n', mu);

    [lambda_num, v] = P2Z14_TPA_glowne(pod, przek, nad, mu);

    res = norm(iloczyn_tridiagonalny(pod, przek, nad, v) - lambda_num * v);
    blad = abs(lambda_dokl - lambda_num);

    fprintf('lambda dokladna = %.15f\n', lambda_dokl);
    fprintf('lambda num      = %.15f\n', lambda_num);
    fprintf('błąd            = %.3e\n', blad);
    fprintf('residuum        = %.3e\n\n', res);

    if (i == 1) 
        pause(); 
    end
end

fprintf('Komentarz:\n');
fprintf(['Dla przesunięcia mu = 122, które leży blisko wartości własnej 120,\n' ...
         'odwrotna metoda potęgowa poprawnie odnajduje zadaną wartość własną.\n' ...
         'Dla mu = 125, które leży dokładnie w środku między dwiema wartościami\n' ...
         'własnymi (120 i 130), algorytm traci jednoznaczność wyboru kierunku\n' ...
         'zbieżnosci, co skutkuje dużym błędem i residuum.\n' ...
         'Jest to zgodne z teorią odwrotnej metody potęgowej.\n']);