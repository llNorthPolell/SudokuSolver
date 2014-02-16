%{ Function: getRow
%  Input: The row number and the chromosome
%  Output: The row from the sudoku form of the chromosome
%}
function [row]= getRow(row_num, chromosome)
    % Constants %
    sector_size=sqrt(length(chromosome));       % Number of elements in each box %
    sector_length=sqrt(sector_size);                % Length of a box %
    
    % Find the first index of the row %  
    sectors_down= floor((row_num-1)/sector_length);            % Sector coordinate (i.e. columns 1-3 are 0 sectors down, row 4-6 is 1 sector and so on) %
    row_start= (1+sector_size*sector_length*sectors_down) + sector_length*mod(row_num-1,sector_length); % Starting index of the row %

    % Build the row using the first index of the row %
    row=0;
    for i=0:sector_length-1
        segment=0;
        sector_start=row_start+(i*sector_size);                                 % Starting index of the sector %
        segment=chromosome(sector_start: sector_start+(sector_length-1));           % A segment of the chromosome that represents part of a row %
        row=[row transpose(segment)];                                           % Attach the segment into the output %
    end
    row=row(2:end);                         % The output is the row memory location from indexes 2 to the end %
                                            % (concatenated 0 to the beginning while defining the row memory location %
end