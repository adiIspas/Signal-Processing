% Definim variabile
durata_semnal = 5000;
A = [ 0.56, 0.79, -0.37;
     -0.75, 0.65,  0.86;
      0.17, 0.32, -0.48];
 
% Citim semnalele si convertim intr-un vector de dimensiune durata_semnal x 1
semnal_1 = get_signal('mrem0.txt', durata_semnal);
semnal_2 = get_signal('mbsb8.txt', durata_semnal);
semnal_3 = get_signal('mbma1.txt', durata_semnal);

% Compunem intr-un semnal
semnale = [semnal_1 semnal_2 semnal_3]';

% Amestecam semnalul cu matricea de mixare A si normalizam
semnale = normalize(A * semnale);

% Aplicam metoda entropiei maxime
% em = maximum_entropy(semnale);

% Aplicam metoda divergentei KL
dkl = kl_divergence(semnale');

% Aplicam metoda Jade
jd = jade(semnale, 3);

% Calculam performanta pentru fiecare metoda
% TODO: De ce pentru celelalte in afara de kl e cu * A si de ce facem cu inv(jd)?
% P_entropie = check_performance(em * A)
P_kl = check_performance(dkl * A)
P_jade = check_performance(inv(jd) * A)
P_a = check_performance(A)