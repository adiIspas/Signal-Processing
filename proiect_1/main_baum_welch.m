% Incarcam modelul folosit pentru algoritmul Baum Welch
incarcare_model_pentru_baum_welch

% Generam observatii 
observatii = generator_observatii_valori(A, B, pi, T);

% Perturbarea parametriilor modelului initial
incarcare_model_perturbat_pentru_baum_welch

% Aplicam algoritmul Baum Welch
iteratii = 20;
[A_baum_welch, B_baum_welch] = algoritm_baum_welch(observatii, A_perturbat, B_perturbat, pi, iteratii);

% Se aplica algoritmul de evaluare
[~, p_original]   = algoritm_forward(observatii, A, B, pi);
[~, p_perturbat]  = algoritm_forward(observatii, A_perturbat, B_perturbat, pi);
[~, p_baum_welch] = algoritm_forward(observatii, A_baum_welch, B_baum_welch, pi);

% Afisam rezultatele
A, B
A_baum_welch, B_baum_welch
p_original, p_perturbat, p_baum_welch