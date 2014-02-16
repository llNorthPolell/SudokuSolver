%{ Function: sortPopulation
%  Input: The gene pool (population), the corresponding fitness vector and
%  the corresponding size of the population
%  Output: A sorted population and a sorted fitness vector
%}
function [sorted_pop, sorted_FVs]=sortPopulation (population, fitness_values, population_size)
    temp=fitness_values;            % Temporary vector to store a copy of the fitness vector (for tracking)
    sorted_pop=[];
    sorted_FVs=[];
    
    for i=1:population_size                         % For every chromosome in the population %
        current_min_index=getMinFV(temp);               % Find the index with the minimum FV %
        
        if(i==1)                                                % Order the population in ascending order of fitness values (best to worst)
            sorted_pop=population(:,current_min_index);
            sorted_FVs=temp(current_min_index);
        else
            sorted_pop=[sorted_pop population(:,current_min_index)];
            sorted_FVs=[sorted_FVs temp(current_min_index)];
        end
        
        temp(current_min_index)=1000;                       % Set the value of temp at index to a very large number so the same chromosome does not get picked again %
    end
end