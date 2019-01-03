% Probabilitatea de a trece dintr-un nod in alt nod
A = [0.25, 0.3, 0.2, 0.25;
     0.1, 0.5, 0.2, 0.2;
     0.3, 0.1, 0.4, 0.2;
     0.4, 0, 0.2, 0.4];
 
% Probabilitatea de a intra in fiecare nod si descrierea starii cu miu si sigma
B = [0.3, 0.7, 3, 5, 1, 1.3;
     0.5, 0.5, 2, 6, 2, 3;
     0.8, 0.2, 8, 10, 2, 1;
     0.4, 0.6, 4, 1, 0.8, 1];
 
% Probabilitate de generare a fiecarui nod
pi = [1, 0, 0, 0];
T = 40;