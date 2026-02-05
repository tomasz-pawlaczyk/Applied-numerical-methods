% Projekt 2, zadanie 14
% Tomasz Pawlaczyk
% Test częściowy 4

addpath('..');

fprintf('====================================================\n');
fprintf('TEST częściowy 4: odbicia Householdera\n');
fprintf('Test wyliczenia odbić poprzez wektory i macierz\n');
fprintf('====================================================\n\n');

n = 5;

% Parametry Householdera (tylko i = 1 aktywne)
v1 = zeros(n-1,1);
v2 = zeros(n-1,1);
beta = zeros(n-1,1);

v1(1) = 3;
v2(1) = 1;
beta(1) = 2 / (v1(1)^2 + v2(1)^2);   % = 1

% Wektor b
b = [1; 2; 3; 4; 5];

% Obliczenie y przez testowany kod
y = b;
for i = 1:n-1
    if beta(i) == 0, continue, end
    t = beta(i) * (v1(i) * y(i) + v2(i) * y(i + 1));
    y(i) = y(i) - v1(i) * t;
    y(i + 1) = y(i + 1) - v2(i) * t;
end

% Jawne Q^T b (do porównania)
v = zeros(n,1);
v(1) = v1(1);
v(2) = v2(1);

H = eye(n) - beta(1) * (v * v.');
y_exact = H * b;

% Wyniki
fprintf("Wartość 'y' obliczona wektoro (kod z programu):\n");
disp(y');

fprintf("Wartość 'y' obliczona macierzowo (kod do porównania) (Q^T b):\n");
disp(y_exact');

fprintf('Różnica ||y - y_exact|| = %.15e\n', norm(y - y_exact));
