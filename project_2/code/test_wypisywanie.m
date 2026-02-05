% Projekt 2, zadanie 14
% Tomasz Pawlaczyk 
% Plik wypisuje wszystkie testy

clc;
fprintf('===============================================\n');
fprintf('Zaczynam uruchamianie testów projektu 2\n');
fprintf('Testy będą wykonywane po kolei.\n');
fprintf('Po każdym teście naciśnij dowolny klawisz.\n');
fprintf('===============================================\n\n');

pause();

fprintf('>>> Uruchamiam TEST częściowy 1\n');
run('testy_czesciowe\test_householder_krok');
pause;

fprintf('\n>>> Uruchamiam TEST częściowy 2\n');
run('testy_czesciowe\test_householder_rozklad');
pause;

fprintf('\n>>> Uruchamiam TEST częściowy 3\n');
run('testy_czesciowe\test_podstawienie_wsteczne');
pause;

fprintf('\n>>> Uruchamiam TEST częściowy 4\n');
run('testy_czesciowe\test_odbicia_householdera');
pause;

fprintf('\n>>> Uruchamiam TEST 1\n');
run('testy\test1');
pause;

fprintf('\n>>> Uruchamiam TEST 2\n');
run('testy\test2');
pause;

fprintf('\n>>> Uruchamiam TEST 3\n');
run('testy\test3');
pause;

fprintf('\n>>> Uruchamiam TEST 4\n');
run('testy\test4');
pause;

fprintf('\n>>> Uruchamiam TEST 5\n');
run('testy\test5');
pause;

fprintf('\n>>> Uruchamiam TEST 6\n');
run('testy\test6');
pause;

fprintf('\n>>> Uruchamiam NUMTEST 1\n');
run('numtesty\numtest1');
pause;

fprintf('\n>>> Uruchamiam NUMTEST 2\n');
run('numtesty\numtest2');
pause;

fprintf('\n>>> Uruchamiam NUMTEST 3\n');
run('numtesty\numtest3');
pause;

fprintf('\n>>> Uruchamiam NUMTEST 4\n');
run('numtesty\numtest4');
pause;

fprintf('\n>>> Uruchamiam NUMTEST 5\n');
run('numtesty\numtest5');
pause;

fprintf('\n===============================================\n');
fprintf('Wszystkie testy zostaly zakonczone.\n');
fprintf('===============================================\n');