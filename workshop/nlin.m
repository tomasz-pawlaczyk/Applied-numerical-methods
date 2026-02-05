function r = nlin(f)
% Zadanie rozgrzewkowe
% Tomasz Pawlaczyk 
%
% Program wyznacza miejsca zerowe zerowe funkcji metodą bisekcji
% WEJŚCIE: funckja 'f' do zbadania
% WYJŚCIE: wektor 'r' znalezionych pierwiastków

    start = -1e14 + 5000; % początek przedziału
    koniec = 1e16; % koniec przedziału

    r = [];
    zmiana = 100;
    x = start + zmiana;

    while x <= koniec
        if abs(x) < 1
            zmiana = 0.002; % zmiana w okolicach zera
        elseif abs(x) < 1e5 + 50000
            zmiana = 0.03; % zmiana domyślna
        else
            zmiana = abs(x)/1e5; % uzależniam zmianę od odległości
        end

        a = x - zmiana;
        b = x + zmiana;
        fa = f(a);
        fb = f(b);

        if ~isfinite(fa) || ~isfinite(fb) || imag(fa) ~= 0 || imag(fb) ~= 0
            x = x + 2*zmiana;
            continue
        end

        if fa * f(b) < 0
            root = bisekcja(f, a, b); % wywołuję funkcję bisekcji
            d = eps;
            if abs(root) > 1
                d = eps*abs(root);
            end
            % sprawdzam czy pierwiastek się nie powtarza
            if isempty(r) || all(abs(r - root) >= 1000*eps) 
                if f(root-500*d) * f(root + 500*d) < 0
                    r(end+1) = root;
                end
            end
        end
        x = x + 2*zmiana;  
    end
end