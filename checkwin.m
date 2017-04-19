function  [winmove, player, fullgame] = checkwin(gamestate)
% checkwin
% 
% This function checks if the player(1 or 2) has won or not and returns
% true or false
% Also checks if the gameboard is completely full and returns 
% 
% Dominick Anatala 2017 Version 1.0


winmove = false;
fullgame = true;
player = 0;

% First checks by scanning columns and if theres any vertical wins
for Col = 1:3
    if gamestate(1, Col) == gamestate(2, Col) && gamestate(2, Col) == gamestate(3, Col) && gamestate(3, Col) ~= 0
        winmove = true;
%         also save which player wins
        player = gamestate(1, Col);

        return;
    end
end

% then checks by scanning rows and if theres any horizontal wins
for Row = 1:3
     if gamestate(Row, 1) == gamestate(Row, 2) && gamestate(Row, 2) == gamestate(Row, 3) && gamestate(Row, 3) ~= 0
        winmove = true;
        player = gamestate(Row, 1);

        return;
    end
end

% then checks diagonals
if gamestate(1,1) == gamestate(2,2) && gamestate(2,2) == gamestate(3,3) && gamestate(3,3) ~= 0
   winmove = true; 
   player = gamestate(1, 1);

   return;
   
elseif gamestate(3,1) == gamestate(2,2) && gamestate(2,2) == gamestate(1, 3) && gamestate(1,3) ~= 0
   winmove = true; 
   player = gamestate(1, 3);
   
   return;
end
    
% checks if the board is full, returns true or false

for Col = 1:3
    for Row = 1:3
        if gamestate(Row, Col) == 0
            fullgame = false;
            player = 0;
   
            return;
        end
    end
end