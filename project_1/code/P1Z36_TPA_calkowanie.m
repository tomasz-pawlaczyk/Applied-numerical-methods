function I = P1Z36_TPA_calkowanie(f, n1, n2)
    % Projekt 1, zadanie 36
    % Tomasz Pawlaczyk 
    % 
    % Program oblicza całkę podwójną z obszaru x^2 + y^2 <= 1
    % poprzez transformację na kwadrat [-1,1]^2 i zastosowanie
    % złożonych 2-punktowych kwadratur Gaussa-Legendre'a
    % WEJŚCIE
    %    f    - funkcja do całkowania
    %  n1, n2 - liczba przedziałów osi OX, OY
    % WYJŚCIE   
    %    I    - obliczona wartość całki

    % Sprawdzenie argumentów wejściowych
    if ~sprawdz_wejscie(n1, n2)
        fprintf("BŁĘDNE WEJŚCIE: popraw n1 i n2. \n");
        I = NaN;
        return;
    end

    wezly = [-1/sqrt(3), 1/sqrt(3)]; % odczytane węzły, wagi równe 1
    
    szerokosc = 2 / n1; % szerokość przedziału OX
    wysokosc = 2 / n2; % wysokość przedziału OY
    polowa_x = szerokosc / 2;
    polowa_y = wysokosc / 2;
    I = 0; % początkowa wartość całki = 0
    
    for i = 0:(n1-1) % Start kwadratury złożonej
        lewy_x = -1 + i * szerokosc; % początek podprzedziału OX
        prawy_x = lewy_x + szerokosc; % koniec podprzedziału OX
        srodek_x = (lewy_x + prawy_x)/2; % środek podprzedziału OX
    
        for j = 0:(n2-1)
            lewy_y = -1 + j * wysokosc; % początek podprzedziału OY
            prawy_y = lewy_y + wysokosc; % koniec podprzedziału OY
            srodek_y = (lewy_y + prawy_y)/2; % środek podprzedziału OY
    
            lokalna_suma = 0; 
    
            % Siatka 2×2 - punkty Gaussa
            for p = 1:2
                s = srodek_x + polowa_x * wezly(p); % obliczam punkt s
                for q = 1:2
                    t = srodek_y + polowa_y * wezly(q); % obliczam punkt t
    
                    % Transformacja punktów
                    [u, v, J] = transformacja_bieg(s, t);
                    lokalna_suma = lokalna_suma + f(u,v) * abs(J);
                end
            end

            I = I + polowa_x * polowa_y * lokalna_suma; % aktualizuję I
        end
    end
    I = (I);
end % function