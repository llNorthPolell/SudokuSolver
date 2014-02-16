%{ Function: getMinFV
%  Input: A fitness vector
%  Output: Index that holds the minimum(best) fitness value 
%}
function [index]=getMinFV(FV)
    index=1;                % Represents the index that holds the minimum fitness value %
    if (length(FV) >1)                   % If the length of the fitness vector is greater than 1 %
        for i=2: length(FV)
            if (FV(i)<FV(index))            % If the current value is less than the current minimum %
                index=i;                             % the minimum is set to the current number %
            end
        end
    end
end