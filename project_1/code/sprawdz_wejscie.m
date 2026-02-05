function komunikat = sprawdz_wejscie(n1, n2)
    % Projekt 1, zadanie 36
    % Tomasz Pawlaczyk 
    %
    % Funkcja sprawdza poprawność danych wejściowych n1, n2
    % WEJŚCIE 
    %  n1, n2 - liczba przedziałów osi OX, OY
    % WYJŚCIE
    %   komunikat = true  – wejście poprawne
    %   komunikat = false – wejście błędne

    komunikat = true;  % domyślnie wszystko OK

    % Sprawdzenie liczby argumentów
    if nargin < 2
        komunikat = false;
        return;
    end

    % Sprawdzenie czy dodatnie
    if n1 <= 0 || n2 <= 0
        komunikat = false;
        return;
    end

    % Sprawdzenie czy są liczbami całkowitymi
    if floor(n1) ~= n1 || floor(n2) ~= n2
        komunikat = false;
        return;
    end
end
