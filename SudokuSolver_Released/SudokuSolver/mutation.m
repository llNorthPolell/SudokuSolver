%{ Function: mutation
%  Input: A chromosome and the size of a sector (or the maximum possible
%  value)
%  Output: Index that holds the maximum(worst) fitness value 
%}
function [mutant]=mutation(chromosome,sector_size)
    mutant=chromosome;      % Set mutant to the input chromosome (in case mutation unexpectedly fails)
    
    % Randomly select mutation point %
    mutation_point=randi([2 sector_size-1],1,1);    % 2 to sector_size-1 or else mutation fails (there is already probability it will fail externally) %
        
    % Mutate %                                                                              
    head=chromosome(1:(mutation_point-1)*sector_size);                               % Slice the chromosome into 3 sections; the head, the tail, and the discarded. 
    mutated_section=transpose(randperm(sector_size));                                % Then replace the discarded section with a new permutation. %
    tail=chromosome(((mutation_point-1)*sector_size) + sector_size +1:end); 
    
    mutant= [head; mutated_section; tail];             % Rebuild the chromosome %
end