function test1()
    % Projekt 1, zadanie 36
    % Tomasz Pawlaczyk 
    % 
    % Funkcja testuje poprawne działanie programu calkowanie.m
    % Wyświetla opis testu, oczekiwany wynik oraz wynik obliczeń
    % Po każdym teście czeka na naciśnięcie dowolnego klawisza
    
    clc;

    % Wywołanie testów początkowych 
    testy_poczatkowe();

    % Wywołanie testu zbieżności
    numtest_zbieznosci();

    fprintf('Wszystkie testy zakończone.\n');

end % function