% Dominick Anatala 2017
% tic tac toe
% play against either a friend or against the ai, or watch ai play against
% each other

% todo: add randomization of which player goes first

clc
clear

% create array for tictac placement 
gamestate = zeros(3,3);

% pre define various variables used later on in game
ai1diff = 0;
endgame = false;
gamecont = true;
rematch = false;

player1 = 'Player 1';
player2 = 'Player 2';

player1win = 0;
player2win = 0;
ties = 0;


% keeps looping until user wants to quit
 while endgame == false
%   rnd shuffle to make the ai moves a little more randomized and for which
%   player goes first
rng('shuffle');
     
     
%   rematch if-statement used later on if the user wants to play their same
%   mode again, skipping the beginning text
    if rematch == false
%       startscreen
        clc
        fprintf('Tic Tac Toe v1.0 \n');
        fprintf('Made by Dominick Anatala \n\n');
        fprintf('Game modes: \n');
        fprintf('	 \n');
        fprintf('1. Player 1 vs Player 2 \n');
        fprintf('2. Player 1 vs AI \n');
        fprintf('3. AI vs AI \n');
    
%       inputs a string and converts it to a number, even makes sure to 
%       convert any arrays back into a single number
        gamemode = input('Choose mode: ','s');
        gamemode = sum(str2num(gamemode));
    
%       makes sure user inputs valid choice
        while  gamemode < 1 || gamemode > 3  
            clc
        
            fprintf('Tic Tac Toe v1.0 \n');
            fprintf('Made by Dominick Anatala \n\n');
            fprintf('Invalid choice, please try again: \n');
            fprintf('	 \n');
            fprintf('1. Player 1 vs Player 2 \n');
            fprintf('2. Player 1 vs AI \n');
            fprintf('3. AI vs AI \n');
            gamemode = input('Choose mode: ','s');
            gamemode = sum(str2num(gamemode));
    
        end
%       Asks user for the names they want to use
        if gamemode == 1 || gamemode == 2
            clc
%           Two players
            if gamemode == 1
                fprintf('Tic Tac Toe v1.0 \n');
                fprintf('Made by Dominick Anatala \n\n');
                fprintf('Player One, what is your name? \n');
                player1 = input('','s');
                while isempty(player1) == true
                
                    fprintf('Incorrect choice Player One, what is your name? \n');
                    player1 = input('','s');
                end
            
                fprintf('Player Two, what is your name? \n');
                player2 = input('','s');
                while isempty(player2) == true
                
                    fprintf('Incorrect choice Player Two, what is your name? \n');
                    player2 = input('','s');
                end
            
            
            else
%           One player
                fprintf('Tic Tac Toe v1.0 \n');
                fprintf('Made by Dominick Anatala \n\n');
                fprintf('Player One, what is your name? \n');
                player1 = input('','s');
                while isempty(player1) == true
                
                    fprintf('Incorrect choice Player One, what is your name? \n');
                    player1 = input('','s');
                end
            end
        end
%       if user chooses gamemode with an AI, let them choose AI difficulty
%       for player vs AI
        if gamemode == 2
        
            clc
        
            fprintf('Tic Tac Toe v1.0 \n\n');
        
            fprintf('Gamemode with AI selected \n');
            fprintf('Choose AI difficulty: \n\n');
            fprintf('1. Easy \n');
            fprintf('2. Hard \n');
            fprintf('3. Impossible \n');
        
%           takes input as string and converts it to an integer(and turns
%           arrays into a single number)
            ai1diff = input('Choose difficulty: ', 's');
            ai1diff = sum(str2num(ai1diff));
            %   makes sure user inputs valid choice
            while  ai1diff < 1 || ai1diff > 3
                clc
        
                fprintf('Tic Tac Toe v1.0 \n');
                fprintf('Made by Dominick Anatala \n\n');
                fprintf('Gamemode with AI selected \n');
                fprintf('Invalid choice, please try again: \n\n');
                fprintf('1. Easy \n');
                fprintf('2. Hard \n');
                fprintf('3. Impossible \n');
            
                ai1diff = input('Choose difficulty: ', 's');
                ai1diff = sum(str2num(ai1diff));
            end
        end
%       for AI vs AI, let the user choose two seperate difficulties for
%       each ai
        if gamemode == 3
            clc
        
            fprintf('Tic Tac Toe v1.0 \n\n');
        
            fprintf('Gamemode with AI selected \n');
            fprintf('Choose AI 1 difficulty: \n\n');
            fprintf('1. Easy \n');
            fprintf('2. Hard \n');
            fprintf('3. Impossible \n');
        
%           takes input as string and converts it to an integer(and turns
%           arrays into a single number)
            ai1diff = input('Choose difficulty: ', 's');
            ai1diff = sum(str2num(ai1diff));
            %   makes sure user inputs valid choice
            while  ai1diff < 1 || ai1diff > 3
                clc
        
                fprintf('Tic Tac Toe v1.0 \n');
                fprintf('Made by Dominick Anatala \n\n');
                fprintf('Gamemode with AI selected \n');
                fprintf('Invalid choice, please try again: \n\n');
                fprintf('1. Easy \n');
                fprintf('2. Hard \n');
                fprintf('3. Impossible \n');
            
                ai1diff = input('Choose difficulty: ', 's');
                ai1diff = sum(str2num(ai1diff));
            end
            
            clc
        
            fprintf('Tic Tac Toe v1.0 \n');
            fprintf('Made by Dominick Anatala \n\n');
            fprintf('Gamemode with AI selected \n');
            fprintf('Choose AI 2 difficulty: \n\n');
            fprintf('1. Easy \n');
            fprintf('2. Hard \n');
            fprintf('3. Impossible \n');
        
%           takes input as string and converts it to an integer(and turns
%           arrays into a single number)
            ai2diff = input('Choose difficulty: ', 's');
            ai2diff = sum(str2num(ai2diff));
            %   makes sure user inputs valid choice
            while  ai2diff < 1 || ai2diff > 3
                clc
        
                fprintf('Tic Tac Toe v1.0 \n');
                fprintf('Made by Dominick Anatala \n\n');
                fprintf('Gamemode with AI selected \n');
                fprintf('Invalid choice, please try again: \n\n');
                fprintf('1. Easy \n');
                fprintf('2. Hard \n');
                fprintf('3. Impossible \n');
            
                ai2diff = input('Choose difficulty: ', 's');
                ai2diff = sum(str2num(ai2diff));
            end
            
        end
        
%       Screen for asking user how many rounds they want to play
        clc
        fprintf('Tic Tac Toe v1.0 \n');
        fprintf('Made by Dominick Anatala \n\n');
        fprintf('How many rounds do you want to play? \n');
    
%       inputs a string and converts it to a number, even makes sure to 
%       convert any arrays back into a single number
        usrrounds = input('Input number of rounds: ','s');
        usrrounds = sum(str2num(usrrounds));
    
%       makes sure user inputs valid choice
        while  usrrounds < 1 || usrrounds > 100
            clc
        
            fprintf('Tic Tac Toe v1.0 \n');
            fprintf('Made by Dominick Anatala \n\n');
            fprintf('How many rounds do you want to play? \n');
            fprintf('Invalid choice please try again \n');
            usrrounds = input('Input number of rounds: ','s');
            usrrounds = sum(str2num(usrrounds));
    
        end
    end
%   resets a few variables back to zero for new game, used for when user
%   plays again
    player1win = 0;
    player2win = 0;
    ties = 0;
    
    
%   for loop for how many times user wants to play for a single game
    for round = 1:usrrounds
%   different modes execution
    if gamemode == 1
%   mode Player 1 vs Player 2
        % reset gamestate for new game
        gamestate = zeros(3,3);
        
        while gamecont == true
            clc
            
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('%s vs %s\n\n', player1, player2);
            printgamestate(gamestate);
            
            fprintf('%s''s turn! \ninput your next move \n', player1)
            
            addrow = input('Row: ', 's');
            addrow = sum(str2num(addrow));
            addcol = input('Column: ', 's');
            addcol = sum(str2num(addcol));
            
            
%           uses function to check if move is a valid move, or if its out
%           of bounds
            while  checkvalidmove(addrow, addcol, gamestate) == false
                clc
        
                fprintf('Tic Tac Toe v1.0 \n\n');
                fprintf('%s vs %s\n\n', player1, player2);
                printgamestate(gamestate);
                fprintf('Invalid move please try again\n%s input your next move \n', player1)
                
                addrow = input('inputrow ', 's');
                addrow = sum(str2num(addrow));
                addcol = input('inputcol ', 's');
                addcol = sum(str2num(addcol));
                
                
            end
%           add player 1's move to the board
            gamestate(addrow, addcol) = 1;
            
%           Checks if player one wins or if board is completly full
            [winmove, playerwinner, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                
                break;
            end
            
            
%           Player 2's turn
            clc
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('%s vs %s\n\n', player1, player2);
            printgamestate(gamestate);
            
            fprintf('player %s''s turn!\ninput your next move ',player2)
            addrow = input('Row: ', 's');
            addrow = sum(str2num(addrow));
            addcol = input('Column: ', 's');
            addcol = sum(str2num(addcol));
            
            while  checkvalidmove(addrow, addcol, gamestate) == false
                clc
        
                fprintf('Tic Tac Toe v1.0 \n\n');
                fprintf('%s vs %s\n\n', player1, player2);
                printgamestate(gamestate);
                fprintf('Invalid move please try again\n%s input your next move \n', player2)

                addrow = input('inputrow ', 's');
                addrow = sum(str2num(addrow));
                addcol = input('inputcol ', 's');
                addcol = sum(str2num(addcol));
                
            end
            
            gamestate(addrow, addcol) = 2;
%           checks if player 2 wins or if board is completely full
            [winmove, playerwinner, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                
                break;
            end
            
        end
        
    elseif gamemode == 2
%   mode Player 1 vs AI
        % reset gamestate for new game
        gamestate = zeros(3,3);
        
        
        while gamecont == true
            
            clc
            
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('%s vs AI\n\n', player1);
            printgamestate(gamestate);
            
            fprintf('%s turn! \ninput your next move \n', player1)
            
            addrow = input('inputrow ', 's');
            addrow = sum(str2num(addrow));
            addcol = input('inputcol ', 's');
            addcol = sum(str2num(addcol));
            
%           uses function to check if move is a valid move, or if its out
%           of bounds
            while  checkvalidmove(addrow, addcol, gamestate) == false
                clc
        
                fprintf('Tic Tac Toe v1.0 \n\n');
                fprintf('%s vs AI\n\n', player1);
                printgamestate(gamestate);
                fprintf('incorrect move try again\n%s input your next move \n',player1)
                addrow = input('inputrow ', 's');
                addrow = sum(str2num(addrow));
                addcol = input('inputcol ', 's');
                addcol = sum(str2num(addcol));
                
            end
%           add player 1's move to the board
            gamestate(addrow, addcol) = 1;
            
%           Checks if player one wins or if board is completly full
            [winmove, playerwinner, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                
                break;
            end
            
%           AI turn
            clc
            
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('%s vs AI\n\n', player1);
            printgamestate(gamestate);
            
            fprintf('AI turn ');
            
%             gamestate = aimode1(gamestate);
            if ai1diff == 1
            [row, col] = aimode1(gamestate);
            elseif ai1diff == 2
            [row, col] = aimode2(gamestate, 2);
            elseif ai1diff == 3
            [row, col] = aimode3(gamestate, 2);
            end
            
%           Just in case if ai messes up, lets it try a simpler mode that
%           guaranteed will make a valid move
            while  checkvalidmove(row, col, gamestate) == false
                
                [row, col] = aimode1(gamestate);
                
            end
            gamestate(row, col) = 2;
%           adds delay to make ai seems more like its 'thinking' even
%           though its actually instantaneous
            pause(0.5);
           
%           checks if player 2 wins or if board is completely full
            [winmove, playerwinner, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                
                break;
            end
        end
    elseif gamemode == 3
%   mode AI vs AI
%       reset gamestate for new game
        gamestate = zeros(3,3);
        while gamecont == true
            
%           AI 1 turn
            clc
            
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('AI 1 vs AI 2\n\n');
            printgamestate(gamestate);
            
            fprintf('AI 1 turn ');
            
            if ai1diff == 1
                [row, col] = aimode1(gamestate);
            elseif ai1diff == 2
                [row, col] = aimode2(gamestate, 1);
            else
                [row, col] = aimode3(gamestate, 1);
            end
            
%           Just in case if ai messes up, lets it try a simpler mode that
%           guaranteed will make a valid move
            while  checkvalidmove(row, col, gamestate) == false
                [row, col] = aimode1(gamestate);
            end
            gamestate(row, col) = 1;
            
%           adds delay to make ai seems more like its 'thinking' even
%           though its actually instantaneous
            pause(0.5);
            
%           Checks if player one wins or if board is completly full
            [winmove, playerwinner, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                
                break;
            end
            
%           AI 2 turn
            clc
            
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('AI 1 vs AI 2\n\n');
            printgamestate(gamestate);
            
            fprintf('AI 2 turn ');
            
            if ai2diff == 1
                [row, col] = aimode1(gamestate);
            elseif ai2diff == 2
                [row, col] = aimode2(gamestate, 1);
            else
                [row, col] = aimode3(gamestate, 1);
            end
                
%           Just in case if ai messes up, lets it try a simpler mode that
%           guaranteed will make a valid move
            while  checkvalidmove(row, col, gamestate) == false
                
                [row, col] = aimode1(gamestate);
                
            end
            gamestate(row, col) = 2;
%           adds delay to make ai seems more like its 'thinking' even
%           though its actually instantaneous
            pause(0.5);
           
%           checks if player 2 wins or if board is completely full
            [winmove, playerwinner, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                
                break;
            end
            
        end

    end
    
%   store user wins and ties to array for use at the end screen
    [winmove, playerwinner, fullgame] = checkwin(gamestate);
    if playerwinner == 1
        player1win = player1win + 1;
    elseif playerwinner == 2
        player2win = player2win + 1;
    else
        ties = ties + 1;
    end
    
%   end game, wait till user presses enter for next round
    clc
    endgamescreen(gamestate, gamemode, playerwinner, player1, player2);
    
    if round ~= usrrounds
        dummyvar = input('Press enter for next round!', 's');
    end
    
    end
    
%   end message asking if user wants to play again
    clc
    endgamescreen(gamestate, gamemode, playerwinner, player1, player2);
    
%   if player plays more than 1 round, check statistics for which player
%   wins the most, percentage of wins/ loses/ ties, etc
    if usrrounds ~= 1
        pl1percent = player1win*100 / usrrounds;
        pl2percent = player2win*100 / usrrounds;
        tiepercent = ties*100 / usrrounds;
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
    end
    
    askend = input('Do you want to play a rematch, new game, or quit?\n ''Rematch'', ''New game'', or ''Quit'' : ', 's');
    
    while strcmpi(askend, 'rematch') == false && strcmpi(askend, 'new game') == false && strcmpi(askend, 'quit') == false
        clc
        endgamescreen(gamestate, gamemode, playerwinner, player1, player2);
        fprintf('Incorrect choice\n');
        askend = input('Do you want to play a rematch, new game, or quit?\n ''Rematch'', ''New game'', or ''Quit'' : ', 's');
    end
    
%   checks user choice
    if  strcmpi(askend, 'rematch') == true
        rematch = true;
    elseif strcmpi(askend, 'new game') == true
        rematch = false;
        endgame = false;
    elseif strcmpi(askend, 'quit') == true
    	endgame = true;  
        fprintf('Thanks for playing! \n\n');
    end
 end