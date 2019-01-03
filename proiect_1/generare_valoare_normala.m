function valoare = generare_valoare_normala(probabilitati, miu, sigma)
    i = generare_indice(probabilitati);
    valoare = normrnd(miu(i), sigma(i));
end

