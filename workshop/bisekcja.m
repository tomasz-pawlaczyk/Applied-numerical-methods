function r = bisekcja(f, a, b)
% Zadanie rozgrzewkowe
% Tomasz Pawlaczyk 
%
% Funkcja pomocnicza bisekcji, która przeprowadza połowienie przedziałów
% do momentu znalezienia MZ lub wyczerpania maksymalnych iteracji

    fa = f(a);
    d = eps;
    tolerancja = 1000*d;

    licznik = 0;
    maks_iter = 5000;

    % Sprawdzam dopóki jest > tolerancji lub przekroczy ilość iteracji
    while b - a > tolerancja && licznik < maks_iter
        c = (a + b) / 2;
        fc = f(c);

        if abs(fc) < tolerancja
            break;

        elseif fa * fc < 0
            b = c;
        else
            a = c;
            fa = fc;
        end

        licznik = licznik + 1;
    end
    r = c;
end