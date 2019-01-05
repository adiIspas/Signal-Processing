% Definim variabile
dataset_number = 2;
step = 0.1;

best_percent_previous = 0.7;
best_percent_current = 0.3;

find_optimal_params = 1;

% Citim dataset
[semnal, puls] = get_hr_data(dataset_number);

if find_optimal_params == 1
    best_norma = 100;
    best_media = 100;

    % Estimam parametrii optimi pentru normalizare 
    for percent_previous = 0:step:1
        for percent_current = 0:step:1
            [puls_real, puls_estimat] = estimate_heart_rate(semnal, puls, percent_previous, percent_current);

            norma = norm(puls_real-puls_estimat);
            media = mean(abs(puls_real-puls_estimat));

            if norma <= best_norma && media <= best_media
                best_norma = norma;
                best_media = media;
                best_percent_previous = percent_previous;
                best_percent_current = percent_current;
            end
        end
    end
end

% Estimam puls
[puls_real, puls_estimat] = estimate_heart_rate(semnal, puls, best_percent_previous, best_percent_current);
best_norma = norm(puls_real-puls_estimat)
best_media = mean(abs(puls_real-puls_estimat))

% Afisam rezultatele
figure
plot(puls_real)
hold on
plot(puls_estimat)
hold off
legend('Puls real','Puls estimat')
title(strcat('Estimare puls dataset  ', int2str(dataset_number)))

figure
plot(abs(puls_estimat-puls_real))
title('Diferenta dintre pulsul real si cel estimat')