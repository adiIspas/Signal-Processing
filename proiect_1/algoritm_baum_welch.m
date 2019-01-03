function [A, B] = algoritm_baum_welch(observatii, A, B, pi, iteratii)
  N = length(pi);
  T = length(observatii);
  M = 2; % mixtura de doua gausiene
  temp_max_value = 0.000000000000000000001;
  
  beta = ones(T, N);
  alfa = ones(T, N);
  xi = ones(M, N, T);
  gama = ones(N, N, T);
  Q = [];
  
  for iteratie = 1:iteratii
    % Procesare
    for t = T-1:-1:1
      for i = 1:N
        suma = 0;
        for j = 1:N
          suma += A(i,j) * beta(t + 1, j) * generare_probabilitate(observatii(t + 1), B(j, [1,2]), B(j, [3,4]), B(j, [5,6])); 
        end
        beta(t, i) = suma;
      end
    end
    
    for t = 1:T
      for j = 1:N
        if t == 1
          alfa(1, j) = pi(j);
        else
          alfa(t, j) = dot(A(:, j), alfa(t - 1, :));
        end
      end
      
      for j = 1:N
        alfa(t, j) *= generare_probabilitate(observatii(t), B(j,[1,2]), B(j,[3,4]), B(j,[5,6]));
      end
    end
    
    for t = 1:T
      for j = 1:N
        for k = 1:M
          suma = 0;
          for i = 1:N
            if t == 1
              alfa_temp = pi(i);
            else
              alfa_temp = alfa(t - 1, i);
            end
            
            suma += alfa_temp * A(i, j) * B(j, [1,2])(k) * normpdf(observatii(t), B(j, [3,4])(k), B(j, [5,6])(k)) * beta(t, j);
          end
          
          xi(k, i, t) = suma / sum(alfa(T, :));
        end
      end
    end
    
    for t = 1:T
      for i = 1:N
        for j = 1:N
          if t == 1
            alfa_temp = pi(i);
          else
            alfa_temp = alfa(t - 1, i);
          end
          
          gama(i, j, t) = (alfa_temp * A(i, j) * generare_probabilitate(observatii(t), B(j,[1,2]),B(j,[3,4]),B(j,[5,6])) * beta(t, j)) / sum(alfa(T, :));
        end
      end
    end
    
    % Actualizari
    % A
    for i = 1:N
      for j = 1:N
        A(i, j) = sum(gama(i, j, :)) / sum(sum(gama(i, :, :)));
      end
    end
    
    % C
    for i = 1:N
      for k = 1:M
        B(i, k) = sum(xi(k, i, :)) / sum(sum(xi(:, i, :)));
      end
    end
    
    % Miu
    for i = 1:N
      for k = 1:M
        B(i, k + 2) = dot(xi(k, i, :)(:), observatii) / sum(xi(k, i, :)(:));
      end
    end
      
    % Sigma
    for j = 1:N
      for k = 1:M
        suma = 0;
        for t = 1:T
          suma += (xi(k, j, t) * (observatii(t) - B(j, k + M)) * (observatii(t) - B(j, k + M))) / sum(xi(k, i, :)(:));
        end
        B(j, k + 4) = suma;
      end
    end
    
    % Determinam Q-urile
    Qa = 0;
    for i = 1:N
      for j = 1:N
        for t = 1:T
          Qa += gama(i, j, t) * log(max(A(i, j), temp_max_value));
        end
      end
    end
    
    Qb = 0;
    for j = 1:N
      for k = 1:M
        for t = 1:T
          Qb += xi(k, j, t) * log(max(B(j, [1,2])(k) * normpdf(observatii(t), B(j, [3,4])(k), B(j, [5,6])(k)), temp_max_value));
        end
      end
    end
    
    Qc = 0;
    for j = 1:N
      for k = 1:M
        for t = 1:T
          Qc += xi(k, j, t) * log(max(B(j, k), temp_max_value));
        end
      end
    end
    
    Qcurrent = Qa + Qb + Qc;
    Q = [Q Qcurrent];
  end
  
  plot(1:iteratii, Q);
end
