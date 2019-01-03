function observatii = generator_observatii_valori(A, B, pi, T)
    i = generare_indice(pi);
    
    observatii = zeros(1,T);
    for t = 1:T
        observatii(t) = generare_valoare_normala(B(i,[1,2]),B(i,[3,4]),B(i,[5,6]));
        i = generare_indice(A(i,:));
    end
end