function numtest_zbieznosci()
    % Projekt 1, zadanie 36
    % Tomasz Pawlaczyk 
    % 
    % Test zbieznosci kwadratury dla funkcji f(x,y) = x^4 y^2 + y^6
    
    fprintf('========================================================\n');
    fprintf('===== Test zbieznosci dla f(x,y) = x^4 * y^2 + y^6 =====\n');
    fprintf('========================================================\n\n');
    
    % Inicjalizuję zmienne
    f = @(x,y) x^4 * y^2 + y^6;
    I_dokladne = 3*pi/32;
    przedzialy = [10 20 50 100 200];
    
    fprintf('  n    szerokość      całka I_n           błąd\n');
    fprintf('-------------------------------------------------------\n');
    
    % Zbieramy błędy do tablicy
    bledy = zeros(size(przedzialy));
    for i = 1:length(przedzialy)
        przedzial = przedzialy(i); % pojedynczy podprzedział
        szerokosc = 2/przedzial; % szerokość podprzedziału
        I_n = P1Z36_TPA_calkowanie(f, przedzial, przedzial); % wartość całki 
        blad = abs(I_n - I_dokladne); % wartość błędu
        bledy(i) = blad; % dodaje błąd do tablicy błędów
    
        fprintf('%4d   %.6f   %.16f   %.6e\n', przedzial, szerokosc, I_n, blad);
    end
    
    fprintf('-------------------------------------------------------\n');
    
    % Wywołanie funkcji badającej zbieżność dla różnych par
    numtest_zbieznosc_pary(przedzialy, bledy);

end % function