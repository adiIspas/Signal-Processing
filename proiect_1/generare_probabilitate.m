function probabilitate = generare_probabilitate(observatie, probabilitati, miu, sigma)
    probabilitate = probabilitati(1) * normpdf(observatie, miu(1), sigma(1)) + ...
                    probabilitati(2) * normpdf(observatie, miu(2), sigma(2));
end

