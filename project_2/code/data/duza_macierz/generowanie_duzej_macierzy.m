% =========================================================
% GENEROWANIE DUZEJ MACIERZY TROJDIAGONALNEJ (WEKTORY)
% ORAZ ANALIZA WIDMA
% =========================================================

clear; clc;

n = 1000;

% generowanie trzech wektorow tridiagonalnych
% wartosci z przedzialu [1,10]
przek = 1 + 9*rand(n,1);
pod = 1 + 9*rand(n-1,1);
nad = 1 + 9*rand(n-1,1);

% budowa macierzy tylko do obliczenia eig
T = diag(przek) + diag(pod,-1) + diag(nad,1);

% wartosci wlasne
lambda = eig(T);
lambda = sort(lambda);

% zapis danych do plikow
save('macierz_duza_przek.mat','przek');
save('macierz_duza_pod.mat','pod');
save('macierz_duza_nad.mat','nad');
save('macierz_duza_lambda.mat','lambda');

fprintf('Zapisano wektory tridiagonalne i wartosci wlasne.\n');