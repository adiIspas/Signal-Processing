function [x, y] = get_hr_data(dataset_number)

    x = dlmread(strcat('semnale/bgrROI_15_', int2str(dataset_number)));
    y = dlmread(strcat(strcat('semnale/puls_', int2str(dataset_number)), '.txt'));

end

