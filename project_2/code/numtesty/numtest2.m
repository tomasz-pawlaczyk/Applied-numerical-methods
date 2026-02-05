% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Numeryczny test 2

addpath('..');

fprintf('=============================================================================\n');
fprintf('NUMERYCZNY TEST 2: Zbieżność i czas działania algorytmu\n');
fprintf('Badanie wpływu "mu" na średni czas obliczeń dla dużej macierzy 3-diagonalnej.\n');
fprintf('=============================================================================\n\n');

load('../data/duza_macierz/macierz_duza_przek.mat','przek');
load('../data/duza_macierz/macierz_duza_pod.mat','pod');
load('../data/duza_macierz/macierz_duza_nad.mat','nad');
load('../data/duza_macierz/macierz_duza_lambda.mat','lambda');
load('../data/duza_macierz/macierz_duza_lambda_odizolowana.mat','lambda_iso','idx_iso');

n = length(przek);
lambda_dokl = lambda_iso;

fprintf('TEST ZBIEŻNOŚCI\n');
fprintf('Rozmiar macierzy n = %d\n', n);
fprintf('Wartość własna odizolowana:\n');
fprintf('lambda = %.16f\n\n', lambda_dokl);

offsety = [1e-1, 1e-2, 1e-3];
Nrep = 10;

% offset | lambda_obliczona_srednia | czas_sredni
wyniki = zeros(length(offsety), 3);

for i = 1:length(offsety)
    offset = offsety(i);
    mu = lambda_dokl + offset;

    czasy = zeros(Nrep, 1);
    lambdy = zeros(Nrep, 1);

    for r = 1:Nrep
        tic
        [lambda_num, v] = P2Z14_TPA_glowne(pod, przek, nad, mu);
        czasy(r) = toc;
        lambdy(r) = lambda_num;
    end

    wyniki(i, 1) = offset;
    wyniki(i, 2) = mean(lambdy);
    wyniki(i, 3) = mean(czasy);
end

Ttab = table( ...
    wyniki(:,1), wyniki(:,2), wyniki(:,3), ...
    'VariableNames', { ...
        'offset', ...
        'lambda_obliczona_srednia', ...
        'czas_sredni_s'} );

disp(Ttab)

pause();
fprintf("\nWyświetlono wykres\n");

figure;
loglog(Ttab.offset, Ttab.czas_sredni_s, 'o-', 'LineWidth', 1.5, 'MarkerSize', 7);
grid on;
xlabel('offset = | \mu - \lambda |');
ylabel('sredni czas [s], skala logarytmiczna');
title('Sredni czas zbieznosci od odleglosci przesuniecia \mu');
set(gca,'FontSize', 12);