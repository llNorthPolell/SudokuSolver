%{ Function: generatePopulation
%  Input: Number of solutions in the population, and the maximum value 
%  allowed (i.e. Sudoku's max_Value= 9, tic-tac-toe's max_Value= 1, 
%  Eight Queens puzzle's max_Value= 8, etc.), and a matrix
%  representing the given numbers.
%  Output: a max_Valuexsize matrix representing the initial population
% (each column is a chromosome)
%}
function [population]=generatePopulation(size, max_Value, prefilled_Values)
    % Generate a Solution Pool %
    for i=1:size 
        % Generate Chromosome %
        for j=1:max_Value
            sector=randperm(max_Value); % Generate Sector %
            if (j==1)
                chromosome=sector;
            else
                chromosome=[chromosome sector];
            end
           
        end
        
        % Transpose the chromosome (Was hard to view when done without transpose %
         chromosome=transpose(chromosome);
                 
        % Add new chromosome to population %
        if (i==1)
            population=chromosome;
        else
            population=[population chromosome];
        end
        
    end
end