function errEst = oblicz_errEst(wektor_pop, wektor)
    % Projekt 2, zadanie 14
    % Tomasz Pawlaczyk
    %
    % Estymator bledu zbieznosci wektora w odwrotnej metodzie potegowej
    % zgodny ze wzorem z wykladu:
    % || (xi(k+1))^(-1) * |xi(k+1)| * x~(k+1)
    %  - (xi(k))^(-1)   * |xi(k)|   * x~(k) ||

    % indeks i_k wyznaczony z x(k)
    [~, ik] = max(abs(wektor_pop));
    
    xi_k   = wektor_pop(ik);
    xi_kp1 = wektor(ik);
    
    xk_norm   = (abs(xi_k)   / xi_k)   * wektor_pop;
    xkp1_norm = (abs(xi_kp1) / xi_kp1) * wektor;
    
    errEst = norm(xkp1_norm - xk_norm);

end % function