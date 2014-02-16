%{ Function: crossover
%  Input: Two chromosome vectors
%  Output: Two offspring chromosome vectors
%}

function [output_A,output_B]=crossover(input_A, input_B)
    % Generate random point to cut off %
    swap_point=randi([2 sqrt(length((input_A)-1))],1,1)*sqrt(length(input_A));
    
    
          % If swap_point= 1 or sqrt(length(input_A)), that means crossover has 
          % failed to take place, and the chromosomes are duplicated. %
          % However,we have already accounted for the failure to
          % crossover, so we disregard these two swap-points as
          % an option.
                     
    % Offspring chromosomes %                 
    output_A=[input_A(1:swap_point); input_B(swap_point+1:end)];
    output_B=[input_B(1:swap_point); input_A(swap_point+1:end)];
    
end