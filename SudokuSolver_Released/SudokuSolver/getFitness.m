%{ Function: getFitness
%  Input: The chromosome
%  Output: The fitness value of the chromosome 
%}
function [FV]=getFitness(chromosome)
   FV=sumCollisions(chromosome);
end


%{ Function: sumCollisions
%  Input: The chromosome
%  Output: The fitness value of the chromosome, which is the number of
%  colliisons(redundancies)
%}
function [collisions]= sumCollisions(chromosome)
    sector_size=sqrt(length(chromosome));               % Size of a sector(or board length) %
    
    collisions=0;
    for i=1:sector_size                                                         % For every row and column in the sudoku form of this chromosome %
        row_collisions=countCollisions(getRow(i,chromosome));                           % Calculate number of row collisions %
        column_collisions=countCollisions(getColumn(i,chromosome));                     % Calculate number of column collisions %
        collisions=collisions + row_collisions + column_collisions;                 % Sum number of collisions %
    end
end



%{ Function: countCollisions
%  Input: A row or column
%  Output: The number of collisions in the given row or column
%}
function [collisions]=countCollisions(input)
    item_count=zeros(1, length(input));         % Keeps track of frequency of a number %
    collisions=0;               % Number of collisions %
 
    for i=1: length(input)          % For each element of input %
        for j=1:length(input)               % For every possible value %
            
            if (input(i)==j)                    % If the value at index i of input matches j %
                item_count(j)=item_count(j)+1;          % Increment the frequency count for the number j
                break;
            end                     
            
        end       
    end
    
    for c=1:length(item_count)      % For every possible value in the item count
        % Subtract one since this method also counts a number appearing only once %
        if (item_count(c)>0)
           item_count(c)=item_count(c)-1;
        end
    end
    
    collisions=sum(item_count);             % Output is the total the collisions in the given row or column%
end