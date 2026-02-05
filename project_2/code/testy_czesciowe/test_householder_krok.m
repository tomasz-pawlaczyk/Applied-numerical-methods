% Projekt 2, zadanie 14
% Tomasz Pawlaczyk 
% Test częściowy 1

addpath('..');

fprintf('====================================================\n');
fprintf('TEST częściowy 1: Pojedynczy krok Householdera\n');
fprintf('Sprawdzenie zerowania jednego elementu podprzekatnej\n');
fprintf('====================================================\n\n');


% Dane testowe
przek = [ 4;  3;  5;  6;  2 ];
pod   = [ -1; 2; -2; 1 ];
nad   = [  3; 1; -1; 2 ];

n = length(przek);
B = diag(przek) + diag(nad,1) + diag(pod,-1);

fprintf('Macierz B (wejscie):\n');
disp(B);
pause();

r0 = przek;
r1 = nad;
r2 = zeros(n-2,1);

% Do porównania poprzez wywołanie kodu
% [proba1, proba2, proba3] = householder_krok(1, r0, r1, r2, pod);
% Rprobne = diag(proba1) + diag(proba2,1) + diag(proba3,2);
% disp(Rprobne);

% Jeden krok Householdera (i = 1)
i = 1;
[r0_new, r1_new, r2_new, v1, v2, beta] = householder_krok(i, r0, r1, r2, pod);

% Jawna macierz Householdera H1
v = zeros(n,1);
v(i) = v1;
v(i+1) = v2;

H1 = eye(n) - beta * (v * v.');

% Macierz po jednym kroku Householdera (H1 * B)
B1 = H1 * B;

fprintf('Macierz po jednym kroku Householdera:\n');
disp(B1);

% --- Sprawdzenie kluczowe ---
fprintf('B(2,1) przed = %.2f\n', B(2,1));
fprintf('B1(2,1) po   = %.2e\n', B1(2,1));

if abs(B1(2,1)) < 1e-12
    disp('TEST OK: wyzerowano tylko element (2,1).');
else
    disp('TEST BLEDNY: element (2,1) NIE zostal wyzerowany.');
end
