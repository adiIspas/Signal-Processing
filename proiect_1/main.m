% Date intrare

generare_model_3

% Problema 1 - Algoritm de generare de observatii
observatii_valori = generator_observatii_valori(A, B, pi, T);

% Problema 2 si 3 - Algoritmul forward si Algoritmul Viterbi

% Primul model
[alfa_forward, p_forward] = algoritm_forward(observatii_valori, A, B, pi);
alfa_1 = alfa_forward';
p_forward_1 = p_forward;

[S, p_viterbi] = algoritm_viterbi(observatii_valori, A, B, pi);
S_1 = S;
p_viterbi_1 = p_viterbi;


% Al doilea model
generare_model_1

[alfa_forward, p_forward] = algoritm_forward(observatii_valori, A, B, pi);
alfa_forward_2 = alfa_forward';
p_forward_2 = p_forward;

[S, p_viterbi] = algoritm_viterbi(observatii_valori, A, B, pi);
S_2 = S;
p_viterbi_2 = p_viterbi;

% Al treilea model
generare_model_2

[alfa_forward, p_forward] = algoritm_forward(observatii_valori, A, B, pi);
alfa_forward_3 = alfa_forward';
p_forward_3 = p_forward;

[S, p_viterbi] = algoritm_viterbi(observatii_valori, A, B, pi);
S_3 = S;
p_viterbi_3 = p_viterbi;


% Afisare rezultate
observatii_valori

%fprintf('\n')
%alfa_forward_model_1
%fprintf('\n')
%alfa_forward_model_2
%fprintf('\n')
%alfa_forward_model_3

fprintf('\n')
p_forward_1
fprintf('\n')
p_forward_2
fprintf('\n')
p_forward_3

fprintf('\n')
p_viterbi_1
fprintf('\n')
p_viterbi_2
fprintf('\n')
p_viterbi_3

fprintf('\n')
S_1
fprintf('\n')
S_2
fprintf('\n')
S_3