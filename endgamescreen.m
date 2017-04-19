function  endgamescreen(gamestate, gamemode, playerwinner, player1, player2)
% endgamescreen
% 

% 
% Dominick Anatala 2017 Version 1.0

% Checks which human player won, and changes winner name to their name.
if playerwinner == 1 
    playerwin = player1;
elseif playerwinner == 2
    playerwin = player2;
end

fprintf('Tic Tac Toe v1.0\n\n');
% Checks modes for end screen
if gamemode == 1
    fprintf('%s vs %s\n\n', player1, player2);
elseif gamemode ==2
    fprintf('%s vs AI\n\n', player1);
else  
    fprintf('AI 1 vs AI 2\n\n'); 
end
printgamestate(gamestate);

    
% Checks for modes to make sure its calling the right player or ai
if playerwinner == 0
    fprintf('The game was a tie!\n');
else
    if gamemode == 1
        fprintf('%s won!\n', playerwin);
    elseif gamemode == 2
    	if playerwinner == 1
            fprintf('%s won!\n', playerwin);
        else 
            fprintf('AI won!\n');
        end
    else  
        if playerwinner == 1
            fprintf('AI %d won!\n', playerwinner);
        else 
            fprintf('AI %d won!\n', playerwinner);
        end 
    end
end