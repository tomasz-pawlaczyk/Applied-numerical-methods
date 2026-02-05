% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test częściowy 2

addpath('..');

fprintf('====================================================\n');
fprintf('TEST częściowy 2: Rozklad Householdera (QR)\n');
fprintf('Sprawdzenie poprawnosci rozkladu B = Q*R\n');
fprintf('oraz ortogonalnosci macierzy Q.\n');
fprintf('====================================================\n\n');

n = 5;
przek = [4;  3;  5;  6;  2];
pod   = [-1; 2; -2; 1];
nad   = [ 3; 1; -1; 2];

B = diag(przek) + diag(nad,1) + diag(pod,-1);

[r0, r1, r2, v1, v2, beta] = householder_rozklad(przek, pod, nad);

% Odtworzenie R
R = diag(r0) + diag(r1, 1) + diag(r2, 2);

% Odtworzenie Q 
Q = eye(n);
for i = 1:n-1
    if beta(i) == 0, continue; end
    v = [v1(i); v2(i)];
    H = eye(n);
    H(i:i+1, i:i+1) = eye(2) - beta(i) * (v * v');
    Q = Q * H;
end

fprintf('Macierz B (wejscie):\n');
disp(B);
pause();

disp('Macierz R (po rozkladzie):');
disp(R);

% Sprawdza, że macierz Q jest ortogonalna
fprintf('Ortogonalność ||Q''Q - I|| = %.2e\n', norm(Q'*Q - eye(n)));

% Sprawdza, że QR = B
fprintf('Test ||QR - B|| = %.2e\n', norm(Q*R - B));

% Sprawdza, że pod przekątną w R nie ma elementów
fprintf('Wyzerowanie elementów pod przekątną ||R dol|| = %.2e\n', norm(tril(R, -1)));

