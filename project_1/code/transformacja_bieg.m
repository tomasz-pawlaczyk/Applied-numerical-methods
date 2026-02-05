function [u, v, J] = transformacja_bieg(x, y)
    % Projekt 1, zadanie 36
    % Tomasz Pawlaczyk
    % 
    % Program przekształca punkt (s, t) z kwadratu [-1,1]^2
    % na punkt (x,y) w kole x^2 + y^2 <= 1 
    % oraz wyznacza Jacobian
    %
    % WEJŚCIE
    %   x, y  - punkty wejściowe
    % WYJŚCIE   
    %   u, v  - punkty po transformacji
    %    J    - Jakobian

    % Wyznaczanie wartości u, v
    r = 0.5 * (x + 1); % promień
    phi = pi * (y + 1); % kąt
    u = r * cos(phi);
    v = r * sin(phi);

    % Pochodne cząstkowe
    du_dx = 0.5 * cos(phi);
    du_dy = r * (-sin(phi)) * pi;
    dv_dx = 0.5 * sin(phi);
    dv_dy = r * cos(phi) * pi;

    % Jacobian
    J = du_dx * dv_dy - du_dy * dv_dx;
end