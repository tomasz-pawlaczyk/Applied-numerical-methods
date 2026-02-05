function [lambda, wektor, errEst, iter] = P2Z14_TPA_glowne(pod, przekatna, nad, mu, tol, maxIter)
    % Projekt 2, zadanie 14 
    % Tomasz Pawlaczyk
    %
    % Odwrotna metoda potęgowa z normowaniem
    % dla macierzy trójdiagonalnej
    % WEJŚCIE
    %   pod       - podprzekątna macierzy A
    %   przekatna - przekątna główna macierzy A
    %   nad       - nadprzekątna macierzy A
    %   mu        - przesunięcie spektrum
    % WYJŚCIE
    %   lambda    - przybliżona wartość własna
    %   wektor    - odpowiadający wektor własny

    if nargin < 6 || isempty(maxIter)
        maxIter = 1000; % domyślna maks. liczba iteracji
    end
    
    if nargin < 5 || isempty(tol)
        tol = 1e-14; % domyślna tolerancja
    end

    n = length(przekatna); % rozmiar macierzy
    przek_B = przekatna - mu; % Macierz B = A - mu*I

    % Jednorazowy rozkład B przez odbicia Householdera
    [r0, r1, r2, v1, v2, beta] = householder_rozklad(przek_B, pod, nad);

    if any(abs(r0) <= realmin)
        error('Macierz A - mu*I jest osobliwa: "mu" jest wartościa własną.');
    end

    % Losowy wektor startowy
    wektor = randn(n, 1);
    wektor = wektor / norm(wektor);

    for iter = 1:maxIter
        wektor_pop = wektor; % zapamiętanie poprzedniego wektora

        % Rozwiązanie układu B*y = wektor
        y = householder_uklad(r0, r1, r2, v1, v2, beta, wektor);

        wektor = y / norm(y); % Normowanie wektora

        % Obliczenie iloczynu trójdiagonalnego
        Aw = iloczyn_tridiagonalny(pod, przekatna, nad, wektor);
        lambda = wektor' * Aw;
        
        errEst = oblicz_errEst(wektor_pop, wektor); % estymator błędu
        if errEst < tol
            break
        end
    end
end % function