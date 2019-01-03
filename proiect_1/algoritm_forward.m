function [alfa, p] = algoritm_forward(observatii, A, B, pi)
    N = length(pi);
    T = length(observatii);
    alfa = zeros(T, N);

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
    
    p = sum(alfa(T,:));
end

