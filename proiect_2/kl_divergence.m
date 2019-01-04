function [W] = kl_divergence(Y)

    % Definim variabilele
    n = 0.01; % rata de invatare
    I = eye(3); % matricea identitate
    W = eye(3); % matricea rezultat
    fi = (-1/2 * Y .^ 5) + (-2/3 * Y .^ 7) + (-15/2 * Y .^ 9) ...
         + (-2/15 * Y .^ 11) + (112/3 * Y .^ 13) + (-128 * Y .^ 15) ...
         + (512/3 * Y .^ 17); % functia de activare a algoritmului
    
    for t = 1:100
        W = W + n * (I - fi' * Y) * inv(W');
    end
end

