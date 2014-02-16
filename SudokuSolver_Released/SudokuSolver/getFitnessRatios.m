%{ Function: getFitnessRatios
%  Input: Best six fitness values in a vector
%  Output: A vector containing fitness ratios of the best six fitness
%  values
%}
function [output]=getFitnessRatios(input)
   output=input./sum(input);     % Divide the input by the sum of the input vector to get a probability %   
end 