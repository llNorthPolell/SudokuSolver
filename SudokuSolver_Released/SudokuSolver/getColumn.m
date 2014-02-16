%{ Function: getColumn
%  Input: The row number and the chromosome
%  Output: The column from the sudoku form of the chromosome
%}
function [column]= getColumn(column_num, chromosome)
    % Constants %
    sector_size=sqrt(length(chromosome));           % Number of elements in each box %
    sector_length=sqrt(sector_size);                     % Length of a box %
    
    % Find the first index of the column %  
    sectors_right=floor((column_num-1)/sector_length);                      % Sector coordinate (i.e. columns 1-3 are 0 sectors to the right, row 4-6 is 1 sector and so on) %
    column_start=(1+(sector_size*sectors_right)+mod(column_num-1,sector_length));       % Starting index of the column %
    
    % Build the column using the first index of the column %
    segment=0;
    for i=0: sector_length-1
        sector_start=column_start+(i*sector_size*sector_length);                 % Starting index of the sector %
        for j=0: sector_length-1
            segment=[segment chromosome(sector_start+(j*sector_length))];                % Concatenated the new segment with the others %
        end
    end   
    column=segment(2:end);                   % The output is the segment memory location from indexes 2 to the end %
                                            % (concatenated 0 to the beginning while defining the segemtn memory location %

end