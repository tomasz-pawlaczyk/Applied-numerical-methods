function testy_poczatkowe()
    % Projekt 1, zadanie 36
    % Tomasz Pawlaczyk 
    % 
    % Początkowe testy badające poprawne działanie programu

    fprintf('===== Testy funkcji calkowanie =====\n');
    fprintf('====================================\n\n');
    
    % Lista testów (komórki ze strukturami)
    testy = {
        struct('f', @(x,y) 1, 'opis', 'f(x,y) = 1', 'I_dokladne', pi);
        struct('f', @(x,y) y^2 + x/10, 'opis', 'f(x,y) = y^2 + x/10', 'I_dokladne', pi/4);
        struct('f', @(x,y) x^2 + y^2, 'opis', 'f(x,y) = x^2 + y^2', 'I_dokladne', pi/2);
        struct('f', @(x,y) x^3 + y^3, 'opis', 'f(x,y) = x^3 + y^3', 'I_dokladne', 0);
    };
    
    % Liczba podprzedziałów w obu kierunkach
    n = 10;
    
    % Uruchamianie testów
    for k = 1:length(testy)
        t = testy{k};
        fprintf('Test %d: %s\n', k, t.opis);
    
        % Obliczenie wartości metodą 2
        I_obliczone = P1Z36_TPA_calkowanie(t.f, n, n);
    
        % Raport wyników
        fprintf('Spodziewany wynik: %.16f\n', t.I_dokladne);
        fprintf('Wynik obliczony: %.16f\n', I_obliczone);
        fprintf('Błąd: %.16f\n', abs(t.I_dokladne - I_obliczone));
    
        % Pauza przed następnym testem
        fprintf('-------------------------------------------------------------\n');
        fprintf('Naciśnij dowolny klawisz, aby przejść do kolejnego testu...\n\n');
        pause;
    end

end % function