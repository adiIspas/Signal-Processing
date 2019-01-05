function [power, frequency_range] = compute_power_spectrum(batch, fps)
    
    y = fft(batch);
    
    n = length(batch);
    frequency_range = (0:n-1) * (fps/n);
    
    power = abs(y).^ 2/n;
end

