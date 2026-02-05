function [r0, r1, r2, v1i, v2i, betai] = householder_krok(i, r0, r1, r2, pod)
    % Projekt 2, zadanie 14 
    % Tomasz Pawlaczyk
    %
    % Pojedynczy krok rozkładu Householdera dla macierzy trójdiagonalnej.
    % WEJŚCIE
    %    i     - indeks kroku Householdera
    % r0,r1,r2 - pasma macierzy R przed aktualizacją
    %  pod     - podprzekątna macierzy wejściowej
    % WYJŚCIE
    % r0,r1,r2 - zaktualizowane pasma macierzy R
    % v1i,v2i  - składowe wektora Householdera
    %  betai   - współczynnik odbicia Householdera

    n = length(r0);
    a = r0(i); % element diagonalny
    b = pod(i); % element pod przekątną

    if abs(a) <= realmin && abs(b) <= realmin
        v1i = 0;
        v2i = 0;
        betai = 0;
        return;
    end

    r = hypot(a, b); % norma wektora [a; b]
    znak = a / abs(a); % znak 
    if znak == 0, znak = 1; end

    v1i = a + znak * r;
    v2i = b;
    betai = 2 / (conj(v1i)*v1i + conj(v2i)*v2i);

    s1 = conj(v1i) * r0(i) + conj(v2i) * pod(i); % iloczyn skalarny s1
    s2 = conj(v1i) * r1(i) + conj(v2i)* r0(i+1); % iloczyn skalarny s2

    if i <= n-2
        s3 = v2i * r1(i+1);
    else
        s3 = 0;
    end

    r0(i) = r0(i) - betai * s1 * v1i; % aktualizacja r0
    r1(i) = r1(i) - betai * s2 * v1i; % aktualizacja r1
    r0(i+1) = r0(i+1) - betai * s2 * v2i; % aktualizacja r0

    if i <= n-2
        r2(i) = -betai * s3 * v1i;
        r1(i+1) = r1(i+1) - betai * s3 * v2i;
    end

end % function