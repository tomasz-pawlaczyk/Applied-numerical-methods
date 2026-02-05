% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test poprawności 6

addpath('..');

fprintf('=============================================\n');
fprintf('TEST 6: zespolone wartosci wlasne \n');
fprintf('=============================================\n\n');

n = 12;

% Niesymetryczna macierz trójdiagonalna
% Warunek: a*c < 0  -> zespolone widmo
a = 2;
b = 1;
c = -3;

l = a * ones(n-1,1);
d = b * ones(n,1);
u = c * ones(n-1,1);

% Dokładne wartości własne
A = diag(d) + diag(l,-1) + diag(u,1);
lambda_exact = eig(A);

% Wybiera jedną zespoloną wartość własną
% Zwraca true (1), gdy wartość własna ma niezerową część urojoną
idx = find(imag(lambda_exact) ~= 0, 1);
lambda_ref = lambda_exact(idx);

% Zespolone przesunięcie
mu = lambda_ref + (1e-2 + 1e-2i);

tol = 1e-14;
iters = 100;

fprintf('Wybrana wartość własna (eig): %.6e %+ .6ei\n', real(lambda_ref), imag(lambda_ref));
fprintf('Przesunięcie mu             : %.6e %+ .6ei\n\n', real(mu), imag(mu));

[lambda_num, v, errEst] = P2Z14_TPA_glowne(l, d, u, mu, tol, iters);

fprintf('WYNIK METODY:\n');
fprintf('lambda_num = %.6e %+ .6ei\n', real(lambda_num), imag(lambda_num));
fprintf('bląd względny = %.3e\n', abs(lambda_num - lambda_ref)/abs(lambda_ref));
fprintf('estymator błędu = %.3e\n', errEst);

% Residuum
res = norm(A*v - lambda_num*v);
fprintf('residuum ||Av-lv|| = %.3e\n\n', res);

pause();

% Test stabilnosci fazy
fprintf('TEST STABILNOŚCI (różne starty):\n');
for k = 1:5
    [lam_k, ~] = P2Z14_TPA_glowne(l, d, u, mu, tol, iters);
    fprintf('  %d: %.6e %+ .6ei\n', k, real(lam_k), imag(lam_k));
end


