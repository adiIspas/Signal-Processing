function [puls_real, puls_estimat] = estimate_heart_rate(semnal, puls, percent_previous, percent_current)
    
    % Definim variabile
    fps = 15;
    interval = 5;
    multiply_rate = 60;
    chanel = 2;
    threshold = 12;
    
    y_size = size(puls, 2);

    iteratii = 1:y_size - interval + 1;
    puls_real = zeros(size(iteratii));
    puls_estimat = zeros(size(iteratii));
    
    for index = 1:y_size - interval + 1
        puls_real(index) = mean(puls(index:index + interval - 1)); % pulsul real ca medie a 5 valori

        s_start = index * fps + 1 - fps;
        s_end = (index + interval - 1) * fps;

        batch = semnal(s_start:s_end, :); % luam cate 15(fps) * 5(interval) => 75 de linii rgb

        batch = detrend(batch); % aplicam detrend

        batch = normalize(batch); % normalizam

        [~, batch] = jade(batch', 3); % aplicam Jade (ICA)
        batch = batch';

        [power, frequency_range] = compute_spectrum(batch(:, chanel), fps, 1); % compute spectrum pe canalul 2

        puls_estimat(index) = multiply_rate * get_maximum_frequency(power, frequency_range); % inmultim frecventa maxima cu 60

        % normalizare puls estimat
        puls_curent = multiply_rate * get_maximum_frequency(power, frequency_range); % inmultim frecventa maxima cu 60
        if index > 1
            if abs(puls_estimat(index - 1) - puls_curent) > threshold 
                % daca diferenta dintre pulsul anterior si cel curent este mai mare de 12 il pastram pe cel anterior
                puls_curent = puls_estimat(index - 1);
            end
            % altfel aplicam o normalizare proportionala
            puls_estimat(index) = percent_previous * puls_estimat(index - 1) + percent_current * puls_curent;
        else
            puls_estimat(index) = puls_curent;
        end
    end
    
end

