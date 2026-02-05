function numtest_zbieznosc_pary(przedzialy, bledy)
    % Projekt 1, zadanie 36
    % Tomasz Pawlaczyk
    % 
    % Liczy rząd zbieżności p dla par (n, 2n)
    % WEJŚCIE:
    %   przedzialy - wektor n, np. [10 20 50 100 200]
    %   bledy      - odpowiadające błędy kwadratury

    fprintf("\nRzad zbieznosci 'p' dla par (n, 2n):\n");
    fprintf('---------------------------\n');

    % Interesujące nas pary n -> 2n
    pary = [10 20; 50 100; 100 200];

    for j = 1:size(pary,1)
        n1 = pary(j,1); % pierwszy podprzedział
        n2 = pary(j,2); % drugi podprzedział

        % Pobieranie błędów
        blad_n  = bledy(przedzialy == n1);
        blad_2n = bledy(przedzialy == n2);

        % Liczenie rzędu zbieżności
        p = log(blad_n / blad_2n) / log(2);
        fprintf('| (%4d, %4d)   %.6f | \n', n1, n2, p);
    end

    fprintf('---------------------------\n');

end % function