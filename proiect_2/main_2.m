% Definim variabile
dataset_number = 1;
fps = 15;
interval = 5;

[semnal, puls] = get_hr_data(dataset_number);
x_size = size(semnal, 1);
y_size = size(puls, 2);

for index = 1:y_size - interval + 1
    s_start = index * fps + 1 - fps;
    s_end = (index + interval - 1) * fps;
    
    batch = semnal(s_start:s_end, :); % luam cate 15(fps) * 5(interval) => 75 de linii rgb
    
    batch = detrend(batch); % aplicam detrend
    
    batch = normalize(batch); % normalizam
    
    [A, S] = jade(batch', 3); % aplicam Jade (ICA) 
end