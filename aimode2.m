function  [row, col] = aimode2(gamestate, playernum)
% aimode2
% 
% slightly more advanced tictactoe ai where it tries to make sure the other user will
% not score, but its still possible to trick it
% 
% Dominick Anatala 2017 Version 1.0


col = 0;
row = 0;

% rnd shuffle to make the ai moves a little more randomized and for which
% player goes first
rng('shuffle');

[winmove, ~, ~] = checkwin(gamestate);

% first check if other user is about to score
while  checkvalidmove(row, col, gamestate) == false && winmove == false
    col = randi([1,3]);
    row = randi([1,3]);
end

% Checks what player number this AI is so it is not hardcoded for a
% specific turn
if playernum == 1
    opponentnum = 2;
else
    opponentnum = 1;
end
% check if the other player is about to win, and if they are, stop them.
for Row = 1:3
    for Col = 1:3
        tempgamestate = gamestate;
        if checkvalidmove(Row, Col, gamestate) == true
            gamestate(Row, Col) = opponentnum;
            [winmove, playerwinner, ~] = checkwin(gamestate);
            if playerwinner == opponentnum && winmove == true
                row = Row;
                col = Col;
            end
            gamestate = tempgamestate; 
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



