% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Numeryczny test 5

addpath('..');

fprintf('============================================================\n');
fprintf('NUMERYCZNY TEST 5: Porównanie metod \n');
fprintf('Badanie różnicy działania metody standardowej \n');
fprintf('oraz metody z iteracyjną zmianą parametru "mu" \n');
fprintf('============================================================\n\n');

n = 5000;
k = round(2000);
deltas = [1e-4, 1e-5, 1e-6];
tol = 1e-14;
maxIter = 1000;
nPowt = 10;

% macierz Laplace'a 
przekatna = 2 * ones(n,1);
pod = -1 * ones(n-1,1);
nad = -1 * ones(n-1,1);

% wartosc wlasna dokladna ---
lambda_dokl = 2 - 2*cos(k*pi/(n+1));
wyniki = zeros(length(deltas), 5);

for i = 1:length(deltas)
    d = deltas(i);
    mu0 = lambda_dokl + d;

    % METODA 1: stałe mu 
    suma_iter_1 = 0;
    suma_czas_1 = 0;

    for r = 1:nPowt
        tic
        [lambda1, ~, err1, it1] = P2Z14_TPA_glowne(pod, przekatna, nad, mu0, tol, maxIter);
        t = toc;

        suma_iter_1 = suma_iter_1 + it1;
        suma_czas_1 = suma_czas_1 + t;
    end

    sr_czas_na_iter_1 = suma_czas_1 / suma_iter_1;

    % METODA 2: adaptacyjne mu 
    suma_iter_2 = 0;
    suma_czas_2 = 0;

    for r = 1:nPowt
        tic
        [lambda2, ~, err2, it2] = licz_mu_iterac(pod, przekatna, nad, mu0, tol, maxIter);
        t = toc;

        suma_iter_2 = suma_iter_2 + it2;
        suma_czas_2 = suma_czas_2 + t;
    end

    sr_czas_na_iter_2 = suma_czas_2 / suma_iter_2;

    wyniki(i,:) = [ ...
        d, ...
        suma_iter_1, sr_czas_na_iter_1, ...
        suma_iter_2, sr_czas_na_iter_2 ];
end

T = array2table(wyniki, ...
    'VariableNames', { ...
    'delta', ...
    'suma_iter_stale_mu', 'sr_czas_na_iter_stale_mu', ...
    'suma_iter_adapt_mu', 'sr_czas_na_iter_adapt_mu'});

disp(T)

pause();
fprintf("\nWyświetlono wykres [1/2]\n");

% pierwszy wykres
figure;
iter_data = [ ...
    T.suma_iter_stale_mu, ...
    T.suma_iter_adapt_mu ];

bar(iter_data, 'grouped');
set(gca, 'XTickLabel', string(T.delta));
xlabel('\delta');
ylabel('Suma iteracji');
legend('stałe \mu', 'adaptacyjne \mu', 'Location', 'northwest');
title('Porównanie sumy iteracji');
grid on;


pause();
fprintf("\nWyświetlono wykres [2/2]\n");

% drugi wykres
figure;
czas_data = [ ...
    T.sr_czas_na_iter_stale_mu, ...
    T.sr_czas_na_iter_adapt_mu ];

bar(czas_data, 'grouped');
set(gca, 'XTickLabel', string(T.delta));
xlabel('\delta');
ylabel('Średni czas na iterację [s]');
legend('stałe \mu', 'adaptacyjne \mu', 'Location', 'northwest');
title('Porównanie czasu na iterację');
grid on;


pause();
fprintf("\nPorównanie skuteczności obu metod:\n\n")

% Całkowity czas
T_stale = T.suma_iter_stale_mu .* T.sr_czas_na_iter_stale_mu;
T_adapt = T.suma_iter_adapt_mu .* T.sr_czas_na_iter_adapt_mu;

% Zysk względny adaptacyjnej metody
zysk = (T_stale - T_adapt) ./ T_stale;

% Wskazanie zwycięzcy
zwyciezca = strings(length(zysk),1);
for i = 1:length(zysk)
    if zysk(i) > 0
        zwyciezca(i) = "adaptacyjna";
    else
        zwyciezca(i) = "stała";
    end
end

% Tabela wyników
T_gain = table( ...
    T.delta, ...
    T_stale, ...
    T_adapt, ...
    zysk, ...
    zwyciezca, ...
    'VariableNames', { ...
        'delta', ...
        'czas_calk_stale_mu', ...
        'czas_calk_adapt_mu', ...
        'zysk_wzgledny', ...
        'zwyciezca'} );

disp(T_gain)