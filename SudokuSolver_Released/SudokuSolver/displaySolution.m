%{ Function: displaySolution
%  Input: The best chromosome and the size of a sector (or the maximum possible value) 
%  Output: A solution in sudoku form 
%}
function displaySolution(solution, sector_size)
    processSolution(solution,sector_size)

end 

%{ Function: processSolution
%  Input: The best chromosome and the size of a sector (or the maximum possible value) 
%  Output: The solution in sudoku form; adds zeros to represent borders and
%  boxes
%}
function [sudoku_form]=processSolution(solution,sector_size)
    sector_length=sqrt(sector_size);                % Sector length is the square root of the sector size %
    
    for i=1:sector_size              
        get_row=getRow(i, solution);    % Get row i from solution %
        
        % Borders %
        new_row=0;
        for j=0:sector_length-1
            current_sector=get_row((j*sector_length) +1: (j*sector_length) +(sector_length));   % Cut row up into sector rows %
            new_row=[new_row current_sector 0];                     % Reconnect sector rows with border to distinguish sectors %
        end
        
        if (i==1)
            sudoku_form= zeros(1,length(new_row));                  % Draw north border %
        end
             
        % Concatenate row to sudoku form %
        sudoku_form= [sudoku_form; new_row];                                % Concatenate formatted row into sudoku form solution %
        
        if (mod(i,sector_length)==0)                                        % Divide sectors horizontally with border %
            sudoku_form=[sudoku_form; zeros(1,length(new_row))]; 
        end
    end

end