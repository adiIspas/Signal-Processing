function signal = get_signal(file, length)
%GET_SIGNAL Get signal of lenght from a file

    base_path = 'semnale/';
    
    signal = dlmread(strcat(base_path,file));
    signal = reshape(signal', [numel(signal), 1]);
    signal = signal(1:length);

end

