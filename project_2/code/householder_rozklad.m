function [r0, r1, r2, v1, v2, beta] = householder_rozklad(przek, pod, nad)
    % Projekt 2, zadanie 14
    % Tomasz Pawlaczyk
    %
    % Rozkład macierzy trójdiagonalnej B = A - mu*I
    % przez dwuwierszowe odbicia Householdera.
    % WEJŚCIE
    %   przek,pod,nad - przekątne macierzy B
    % WYJŚCIE
    %   r0,r1,r2      - przekątne macierzy górnotrójkątnej R
    %   v1,v2,beta    - parametry odbić Householdera

    n = length(przek); % rozmiar macierzy
    r0 = przek; % przekątna główna macierzy R
    r1 = nad; % pierwsza nadprzekątna
    r2 = zeros(max(0, n - 2), 1); % druga nadprzekątna

    v1 = zeros(n - 1, 1); % pierwsze składowe wektorów Householdera
    v2 = zeros(n - 1, 1); % drugie składowe wektorów Householdera
    beta = zeros(n - 1, 1); % współczynniki beta

    for i = 1:n-1
        % Liczę pojedynczy krok w iteracji
        [r0, r1, r2, v1(i), v2(i), beta(i)] = householder_krok(i, r0, r1, r2, pod);
    end
    
end % function