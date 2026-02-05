function [lambda, wektor, errEst, iter] = licz_mu_iterac(pod, przekatna, nad, mu, tol, maxIter)
    % Projekt 2, zadanie 14
    % Tomasz Pawlaczyk

    if nargin < 6 || isempty(maxIter)
        maxIter = 1000;
    end
    
    if nargin < 5 || isempty(tol)
        tol = 1e-14;
    end

    n = length(przekatna);

    % losowy wektor startowy
    wektor = randn(n, 1);
    wektor = wektor / norm(wektor);

    for iter = 1:maxIter
        wektor_pop = wektor;

        % ZMIANA: budowa B = A - mu*I
        przek_B = przekatna - mu;

        % ZMIANA: rozkład Householdera
        [r0, r1, r2, v1, v2, beta] = householder_rozklad(przek_B, pod, nad);

        if any(abs(r0) < eps)
            error('Macierz A - mu*I jest osobliwa.');
        end

        % rozwiązanie (A - mu I) y = w
        y = householder_uklad(r0, r1, r2, v1, v2, beta, wektor);
        wektor = y / norm(y);

        % iloraz Rayleigha
        Aw = iloczyn_tridiagonalny(pod, przekatna, nad, wektor);
        lambda = wektor' * Aw;

        % ZMIANA: aktualizacja mu
        mu = lambda;

        errEst = oblicz_errEst(wektor_pop, wektor);
        if errEst < tol
            break
        end
    end
end % function