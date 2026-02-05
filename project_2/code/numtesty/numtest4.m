% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Numeryczny test 4 – liczba iteracji

addpath('..');

fprintf('====================================================\n');
fprintf('NUMERYCZNY TEST 4: Zbieżność odwrotnej metody potęgowej\n');
fprintf('Badanie wpływu |mu - lambda| na liczbę iteracji.\n');
fprintf('====================================================\n\n');

load('../data/duza_macierz/macierz_duza_przek.mat','przek');
load('../data/duza_macierz/macierz_duza_pod.mat','pod');
load('../data/duza_macierz/macierz_duza_nad.mat','nad');
load('../data/duza_macierz/macierz_duza_lambda_odizolowana.mat','lambda_iso','idx_iso');

n = length(przek);
lambda_dokl = lambda_iso;

fprintf('TEST ZBIEŻNOŚCI\n');
fprintf('Rozmiar macierzy n = %d\n', n);
fprintf('Wart. wł. odizolowana: %.16f\n\n', lambda_dokl);

offsety = [1e-0, 1e-1, 1e-2, 1e-3, 1e-4];
Nrep = 10;

% offset | lambda_srednia | iter_srednie
wyniki = zeros(length(offsety), 3);

for i = 1:length(offsety)
    offset = offsety(i);
    mu = lambda_dokl + offset;

    iters = zeros(Nrep, 1);
    lambdy = zeros(Nrep, 1);

    for r = 1:Nrep
        [lambda_num, ~, ~, iter] = P2Z14_TPA_glowne(pod, przek, nad, mu);
        iters(r) = iter;
        lambdy(r) = lambda_num;
    end

    wyniki(i,1) = offset;
    wyniki(i,2) = mean(lambdy);
    wyniki(i,3) = mean(iters);
end

Ttab = table( ...
    wyniki(:,1), wyniki(:,2), wyniki(:,3), ...
    'VariableNames', { ...
        'offset', ...
        'lambda_obliczona_srednia', ...
        'iteracje_srednie'} );

disp(Ttab)

pause();
fprintf("\nWyświetlono wykres\n");

figure;
loglog(Ttab.offset, Ttab.iteracje_srednie, 'o-', ...
       'LineWidth', 1.5, 'MarkerSize', 7);
grid on;
xlabel('offset = | \mu - \lambda |');
ylabel('srednia liczba iteracji');
title('Zależność zbieżności od odległości przesunięcia \mu');
set(gca,'FontSize', 12);