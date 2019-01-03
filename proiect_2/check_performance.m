function [P] = check_performance(Q)
%CHECK_PERFORMANCE Check performance of algorithms

    P = 0;
    n = size(Q, 1);
    
    for i = 1:n
        firstP = sum(abs(Q(i,:)) ./ max(abs(Q(i, :)))); 
        firstP = firstP - 1;
        
        secondP = sum(abs(Q(:, i)) ./ max(abs(Q(:, i))));
        secondP = secondP - 1;
        
        P = P + firstP + secondP;
    end
    
end

