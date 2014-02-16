%{ Function: randomCheck
%  Input: The probability of an event
%  Output: The outcome of the event (Crossover and mutation can take
%  place if do=1)
%}
function [do]= randomCheck (probability)
    do=0;
    if (rand(1,1)<=probability)
        do=1;
    end
end