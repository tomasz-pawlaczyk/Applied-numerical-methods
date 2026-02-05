function x = householder_uklad(r0, r1, r2, v1, v2, beta, b)
    % Projekt 2, zadanie 14
    % Tomasz Pawlaczyk
    %
    % Rozwiązywanie układu liniowego B*x = b
    % z wykorzystaniem rozkładu Householdera.
    % WEJŚCIE
    %   r0,r1,r2   - przekątne macierzy górnotrójkątnej R
    %   v1,v2,beta - parametry odbić Householdera
    %   b          - prawa strona układu
    % WYJŚCIE
    %   x          - rozwiązanie układu B*x = b

    n = length(r0);
    y = b; % kopia prawej strony

    % Zastosowanie odbić Householdera
    for i = 1:n-1
        if beta(i) <= realmin, continue, end
        t = beta(i) * (conj(v1(i)) * y(i) + conj(v2(i)) * y(i + 1));
        y(i) = y(i) - v1(i) * t;
        y(i + 1) = y(i + 1) - v2(i) * t;
    end

    % Podstawianie wsteczne
    x = zeros(n, 1);
    x(n) = y(n) / r0(n);

    if n >= 2
        x(n - 1) = (y(n - 1) - r1(n - 1) * x(n)) / r0(n - 1);
    end

    for i = n-2:-1:1
        x(i) = (y(i) - r1(i) * x(i + 1) - r2(i) * x(i + 2)) / r0(i);
    end

end % function