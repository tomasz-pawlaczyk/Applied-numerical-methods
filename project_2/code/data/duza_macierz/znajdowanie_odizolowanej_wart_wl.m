% =========================================================
% WYSZUKIWANIE NAJBARDZIEJ ODIZOLOWANEJ WARTOSCI WLASNEJ
% + ZAPIS DO PLIKU
% =========================================================

dlambda = diff(lambda);

min_dist = zeros(length(lambda),1);
min_dist(1) = dlambda(1);
min_dist(end) = dlambda(end);

for i = 2:length(lambda)-1
    min_dist(i) = min(dlambda(i-1), dlambda(i));
end

[~, idx_iso] = max(min_dist);
lambda_iso = lambda(idx_iso);
dist_iso = min_dist(idx_iso);

fprintf('\nNajbardziej odizolowana wartosc wlasna:\n');
fprintf('indeks = %d\n', idx_iso);
fprintf('lambda = %.16f\n', lambda_iso);
fprintf('minimalna odleglosc do sasiadow = %.6e\n', dist_iso);

% zapis do pliku
% save('macierz_duza_lambda_odizolowana.mat', 'lambda_iso','idx_iso','dist_iso');

% lokalne widmo
idx_min = max(idx_iso - 3,1);
idx_max = min(idx_iso + 3,length(lambda));

fprintf('\nLokalne widmo wokol tej wartosci:\n');
fprintf('indeks        lambda\n');
for i = idx_min:idx_max
    fprintf('%6d   %.16f\n', i, lambda(i));
end
