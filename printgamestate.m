function  printgamestate(gamestate)
% printgamestate
% 
% Turns array of moves into a neat and easy to read interface in the
% command window
% 
% Dominick Anatala 2017 Version 1.0

fprintf('      1       2       3   \n')
for Row = 1:3
    
%   Converts the numerical value to the player pieces, X or O
    for Col = 1:3
        if gamestate(Row,Col) == 1
            gamestate(Row,Col) = 'O';
        elseif gamestate(Row,Col) == 2
            gamestate(Row,Col) = 'X';
        else
            gamestate(Row,Col) = ' ';
        end
    end
    
    % prints out semi graphical printout of tic tac toe screen
    if Row ~= 3
        fprintf('          |       |       \n  %d   %s   |   %s   |   %s     \n   _______|_______|_______\n', Row, gamestate(Row,1), gamestate(Row,2), gamestate(Row, 3))
    else
        fprintf('          |       |       \n  %d   %s   |   %s   |   %s     \n          |       |       \n', Row, gamestate(Row,1), gamestate(Row,2), gamestate(Row, 3))
    end

end




