function  validmove = checkvalidmove(row, col, gamestate)
% checkvalidmove
% 
% This function checks the move against the current game and makes sure
% that the move is valid. It checks if there is already a piece on the
% board, or if its col or row is not within bounds of the board
% 
% Dominick Anatala 2017 Version 1.0

% First checks if the move is within bounds
if row > 3 || row < 1 || col > 3 || col < 1 
    validmove = false;
    return;
end

% then checks if the move is not overriding an existing move 
if gamestate(row, col) == 0 
    validmove = true;
else
    validmove = false;
end