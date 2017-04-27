function  [row, col] = aimode3(gamestate, playernum)
% aimode3
% 
% Advanced tictactoe ai that uses simple strategy to make sure to either win or tie.
% 
% Dominick Anatala 2017 Version 1.0

% still have to fix issue of still being able to beat by having two ways of
% winning
% maybe make it look further into the future to see which path is the best?

col = 0;
row = 0;
movecount = 0;

%   rnd shuffle to make the ai moves a little more randomized and for which
%   player goes first
rng('shuffle');

% So it also works for ai vs ai
if playernum == 1
    opponentnum = 2;
else
    opponentnum = 1;
end


corners = [1,1;1,3;3,1;3,3];
cornerstaken = 0;
cornerstakenopp = 0;
% 	check if all corners are already taken
for Row = 1:4
  	if gamestate(corners(Row, 1), corners(Row, 2)) ~= 0
     	cornerstaken = cornerstaken + 1;
        
    end
    if gamestate(corners(Row, 1), corners(Row, 2)) == opponentnum
        cornerstakenopp = cornerstakenopp + 1;
    end
end

% count current number of moves for ai to use for strategy of using corners
% if its the second move.
for Row = 1:3
    for Col = 1:3
        if gamestate(Row, Col) ~= 0
            movecount = movecount + 1;
        end
    end
end

[winmove, ~, ~] = checkwin(gamestate);


% Simple strategy of placing the first move of the game at the center makes it hard 
% for the other player to win, only tie. This completely changes
% compared to Hard mode where atleast the user has a chance of forcing the
% ai to choose one of two ways to block them from winning.
if gamestate(2,2) == 0
    row = 2;
    col = 2;
else
    
%   if its taken and its the second turn, try to get a corner spot, not an 
%   edge spot. This will make it harder for the other player to win, 
%   and give this ai a chance of winning
    if movecount == 1
        while  checkvalidmove(row, col, gamestate) == false && winmove == false
%           code to make the choice is a randomized corner spot so its not
%           the same game each time
            col = randi([1,2]);
            if col == 2
                col = 3;
            end
            row = randi([1,2]);
            if row == 2
                row = 3;
            end
        end
    end
end

% block fork move from winning by placing this turn in another corner spot
% across from theirs
% Also if AI plays first, then this gives them a chance of creating a fork
% move to win
if movecount > 1
%	simple array to loop through to check if opponent placed a
%	spot in the corner

% 	if all corner spots are taken, dont risk going into infinite loop
% 	trying to find a corner spot available
	if cornerstaken == 4
%         break;
    elseif cornerstakenopp == 2 && cornerstaken ~= 3
%       if opponent has two corners, make sure to block them from making a
%       fork move
        edges = [1,2;2,1;2,3;3,2];
        randedge = randi([1,4]);
        
        while checkvalidmove(edges(randedge,1), edges(randedge,2), gamestate) == false
           	randedge = randi([1,4]);
        end
       	row = edges(randedge, 1);
       	col = edges(randedge, 2);
    else
%       it finds a corner spot, and then tries to place
%    	its move in a random edge spot thats not already taken by
     	randcorner = randi([1,4]);
            
        while checkvalidmove(corners(randcorner,1), corners(randcorner,2), gamestate) == false
        	randcorner = randi([1,4]);
        end
       	row = corners(randcorner, 1);
       	col = corners(randcorner, 2);
        
    end
end

% check if the other player is about to win next turn, and if they are, stop them.
for Row = 1:3
    for Col = 1:3
        tempgamestate = gamestate;
        if checkvalidmove(Row, Col, gamestate) == true
            tempgamestate(Row, Col) = opponentnum;
            [winmove, playerwinner, ~] = checkwin(tempgamestate);
            if playerwinner == opponentnum && winmove == true
                row = Row;
                col = Col;
            end
        end
    end
end
    
% check if this ai can make a move that will win, and if it can, make it.
for Row = 1:3
    for Col = 1:3
        tempgamestate = gamestate;
        if checkvalidmove(Row, Col, gamestate) == true
            gamestate(Row, Col) = playernum;
            [winmove, playerwinner, ~] = checkwin(gamestate);
            if playerwinner == playernum && winmove == true
                row = Row;
                col = Col;
            end
            gamestate = tempgamestate;
        end
    end
end

