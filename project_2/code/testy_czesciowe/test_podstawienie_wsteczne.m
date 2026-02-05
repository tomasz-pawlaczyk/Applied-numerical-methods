% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test częściowy 3

addpath('..');

fprintf('====================================================\n');
fprintf('TEST częściowy 3: Podstawienie wsteczne\n');
fprintf('Test rozwiązania układu R*x = y\n');
fprintf('====================================================\n\n');

r0 = [3; 4; 5; 6; 7]; 
r1 = [-1; 1; 2; -2]; 
r2 = [2; -1; 1];   

% Brak Householdera
v1 = zeros(4,1);
v2 = zeros(4,1);
beta = zeros(4,1);

% Dokladne rozwiazanie (policzone ręcznie)
x_exact = [1; -1; 2; 0; -1];

% Prawa strona R*x = y
y = [8; -2; 9; 2; -7];

x_num = householder_uklad(r0, r1, r2, v1, v2, beta, y);

fprintf("Dokładna wartość wektora, policzona ręcznie:\n");
disp(x_exact');

fprintf("Wartość wektora policzona przez program:\n");
disp(x_num');

fprintf('Różnica ||x_num - x_exact|| = %.15e\n', norm(x_num - x_exact));
