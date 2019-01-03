function [S, p] = algoritm_viterbi(observatii, a, b, pi)
    N = length(pi);
    T = length(observatii);
    V = zeros(T, N);
    B = zeros(T, N);
    S = [];
    
    V(1, :) = pi; 
    for t = 2:T
        for j = 1:N
            [m, poz] = max(V(t-1,:) .* a(:, j)');
            V(t, j) = m * generare_probabilitate(observatii(t), b(j,[1,2]),b(j,[3,4]),b(j,[5,6]));
            B(t, j) = poz(1);
        end
    end
    
    [m, poz] = max(V(T,:));
    p = m;
    st = poz(1);
    
    for t = T-1:-1:1
        st = B(t+1, st);
        S = [st, S];
    end
end