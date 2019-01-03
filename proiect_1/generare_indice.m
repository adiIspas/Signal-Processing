function indice = generare_indice(probabilitati)
    sume_partiale = cumsum(probabilitati);
    probabilitate = rand;
    
    vector_indici = find(sume_partiale > probabilitate);
    indice = vector_indici(1);
end

