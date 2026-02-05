function y = iloczyn_tridiagonalny(pod, przek, nad, x)
    % Projekt 2, zadanie 14
    % Tomasz Pawlaczyk
    %
    % Iloczyn macierzy trójdiagonalnej i wektora
    % bez jawnego tworzenia macierzy.
    % WEJŚCIE
    %   pod   - podprzekątna macierzy A
    %   przek - przekątna główna macierzy A
    %   nad   - nadprzekątna macierzy A
    %   x     - wektor, przez który mnożona jest macierz
    % WYJŚCIE
    %   y     - wynik iloczynu y = A*x
    
    n = length(przek);
    y = przek .* x; % część diagonalna
    
    if n >= 2
        y(1) = y(1) + nad(1) * x(2);
        for i = 2:n-1
            y(i) = y(i) + pod(i - 1) * x(i - 1) + nad(i) * x(i + 1);
        end
        y(n) = y(n) + pod(n - 1) * x(n - 1);
    end
end % function