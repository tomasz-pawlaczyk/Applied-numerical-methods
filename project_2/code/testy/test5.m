% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test 5

addpath('..');

fprintf('\n============================================================\n');
fprintf('TEST 5: Macierz trójdiagonalna o elementach rzędu eps\n');
fprintf('Weryfikacja poprawności algorytmu odwrotnej metody potęgowej\n');
fprintf('Kryteria: residuum, porównanie z eig(), kondycja (A-mu*I)\n');
fprintf('============================================================\n\n');

rng(1); % dodałem dla powtarzalności
n = 10;
eps0 = eps;

% losowa macierz trójdiagonalna rzędu eps
pod = eps0 * randi([-3,3], n-1, 1);
przek = eps0 * randi([-3,3], n,   1);
nad = eps0 * randi([-3,3], n-1, 1);

% pelna macierz (do weryfikacji)
A = diag(pod,-1) + diag(przek) + diag(nad,1);

fprintf('Skala elementow macierzy: O(eps) = %.2e\n', eps0);

% referencyjne wartosci wlasne
lambda_ref_all = eig(A);

% wybor jednej wartosci referencyjnej
lambda_ref = lambda_ref_all(ceil(n/2));
mu = lambda_ref + eps0;

fprintf('Wybrane przesuniecie mu = %.6e\n\n', mu);

[lambda_num, v] = P2Z14_TPA_glowne(pod, przek, nad, mu);

% 1) Residuum własne
residuum = norm(A*v - lambda_num*v);

% 2) Porównanie z eig (najblizsza wartosc)
[dist, idx] = min(abs(lambda_num - lambda_ref_all));

% 3) Błąd względny w sensownej skali
blad_wzgledny = dist / max(eps0, abs(lambda_ref_all(idx)));

% 4) Kondycja układu odwrotnego
condA_mu = condest(A - mu*eye(n));

fprintf('WYNIKI NUMERYCZNE:\n');
fprintf('Najbliższa wartość własna (eig) : %.16e\n', lambda_ref_all(idx));
fprintf('Wartość własna (numeryczna)     : %.16e\n', lambda_num);
fprintf("Różnica: %.16e\n\n", abs(lambda_ref_all(idx) - lambda_num));

pause();

fprintf('SPRAWDZENIE POPRAWNOŚCI:\n');
fprintf('Residuum ||A v - lambda v|| = %.3e\n', residuum);
fprintf('Błąd względny (vs eig)      = %.3e\n', blad_wzgledny);
fprintf('Kondycja condest(A - mu*I)  = %.3e\n\n', condA_mu);

fprintf('SKALOWANIE WZGLĘDNE:\n');
fprintf('lambda / eps   = %.6f\n', lambda_num / eps0);
fprintf('residuum / eps = %.6e\n', residuum / eps0);

pause();

% TEST STABILNOŚCI WZGLĘDEM WEKTORA STARTOWEGO
fprintf('\nTEST STABILNOSCI (rozne wektory startowe):\n');
fprintf('--------------------------------------------\n');

m = 5;
lams = zeros(m,1);
resids = zeros(m,1);

for k = 1:m
    rng(k);
    [lams(k), vk] = P2Z14_TPA_glowne(pod, przek, nad, mu);
    resids(k) = norm(A*vk - lams(k)*vk);
end

T = table(lams, resids, 'VariableNames', {'lambda', 'residuum'});
disp(T);

% fprintf('============================================================\n');
% fprintf('WNIOSKI:\n');
% fprintf('- Bardzo male residuum potwierdza poprawne rozwiazanie.\n');
% fprintf('- Zgodnosc z eig(A) w sensownej skali wzglednej.\n');
% fprintf('- Dobra kondycja (A-mu*I) gwarantuje stabilnosc numeryczna.\n');
% fprintf('- Brak zaleznosci od wektora startowego.\n');
% fprintf('============================================================\n\n');
