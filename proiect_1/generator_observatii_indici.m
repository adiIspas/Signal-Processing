function observatii = generator_observatii_indici(A, B, pi, T)
    i = generare_indice(pi);
    
    observatii = zeros(1,T);
    for t = 1:T
        observatii(t) = generare_indice(B(i,:));
        i = generare_indice(A(i,:));
    end
end

