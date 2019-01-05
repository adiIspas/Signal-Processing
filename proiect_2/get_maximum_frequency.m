function [frequency] = get_maximum_frequency(power, frequency_range)
    
    [~, argmax] = max(power);
    frequency = frequency_range(argmax);
    
end

