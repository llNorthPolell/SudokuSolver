%{ Function: getMaxFV
%  Input: A fitness vector
%  Output: Index that holds the maximum(worst) fitness value 
%}
function [index]=getMaxFV(FV)
    index=1;                    % Represents the index that holds the maximum fitness value %
    if (length(FV) >1)                  % If the length of the fitness vector is greater than 1 %
        for i=2: length(FV)
            if (FV(i)>FV(index))            % If the current value is larger than the current maximum %
                index=i;                        % the maximum is set to the current number %
            end
        end
    end
end