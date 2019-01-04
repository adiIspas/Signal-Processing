function [W] = maximum_entropy(semnale)

    % Definim variabilele
    n = 0.01; % rata de invatare
    I = eye(3); % matricea identitate
    W = eye(3); % matricea rezultat
    z = arrayfun(@(x) 1 / (1 + exp(-x)), semnale)'; % vectorul de iesire
    
    for t = 1:100
        W = W + n * (I + (1 - 2 * z) * semnale) * W;
    end
end

