function  [row, col] = aimode1(gamestate)
% aimode1
% 
% Simple tictactoe ai where it is just random choices and checks if they are valid
% before placing them
% 
% Dominick Anatala 2017 Version 1.0

col = 0;
row = 0;

%   rnd shuffle to make the ai moves a little more randomized and for which
%   player goes first
rng('shuffle');

% Randomly tries different spots until it finds a valid move to make, and
% then submits its valid move back to the game.
while  checkvalidmove(row, col, gamestate) == false
    col = randi([1,3]);
    row = randi([1,3]);
end
