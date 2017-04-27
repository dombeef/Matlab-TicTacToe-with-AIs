function  printuserwins(player1, player2, player1win, player2win, gamemode, usrrounds)
% printuserwins
% 
% Checks statistics for which player wins the most, percentage of 
% wins/ loses/ ties, etc and prints it to the Command Window
% 
% Dominick Anatala 2017 Version 1.0

ties = (usrrounds - player1win - player2win);

pl1percent = player1win*100 / usrrounds;
pl2percent = player2win*100 / usrrounds;
tiepercent = ties*100 / usrrounds;

% Changes output depending on what gamemode was played, and prints out the
% statistics with the user names
if gamemode == 1
    fprintf('%s has won %d times, or %.0f%% of total games played.\n', player1, player1win, pl1percent);
    fprintf('%s has won %d times, or %.0f%% of total games played.\n', player2, player2win, pl2percent);

elseif gamemode == 2
    fprintf('%s has won %d times, or %.0f%% of total games played.\n', player1, player1win, pl1percent);
    fprintf('AI has won %d times, or %.0f%% of total games played.\n', player2win, pl2percent);
else
    fprintf('AI 1 has won %d times, or %.0f%% of total games played.\n', player1win, pl1percent);
    fprintf('AI 2 has won %d times, or %.0f%% of total games played.\n', player2win, pl2percent);
end
if ties ~= 0
    fprintf('There has been %d ties, or %.0f%% of total games played. \n', ties, tiepercent);
end
fprintf('\n');




