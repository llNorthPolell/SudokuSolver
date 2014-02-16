%{ Function: selection
%  Input: The gene pool (population), the corresponding fitness ratios and
%  the corresponding size of the population
%  Output: A chosen chromosome(the parent)
%}

function [parent]=selection (population,ratios, population_size)
    chooser= rand();                                        % Randomly generate a number %
    rank=0;                                                 % Initial rank is 0 %

    for i=1: population_size                                    % Roulette Selection %
        if (chooser>=rank && chooser<rank+ratios(i))       
            parent=population(:,population_size-(i-1));             % If spinner lands on section of roulette wheel, break loop and return result %
            break;
        end  
        rank=rank+ratios(i);                                % Update rank %
    end
end