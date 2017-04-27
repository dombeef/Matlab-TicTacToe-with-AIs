% Project Name: Tic Tac Toe with AI
% WRITTEN AND DEVELOPED BY: Dominick Anatala
% Date: 4/27/17
% 
% PURPOSE: This programs purpose is to accurately play a game of Tic Tac
% Toe in the command window, and to allow the user to play different modes,
% either against another person, against an AI(Which there are 3 different
% difficulty modes), or to let two AIs play each other.
% 
% I/O SUMMARY:
%    INPUTS: User typing in letters and numbers to Command Window
%    OUTPUTS: Text and ascii art graphics to Command Window
% 
% EXECUTION: Basically I've split up the code to make it as modular as
% possible and to make it easy to add more AI types than the ones I've
% already made. I've split up each part of the game(checking if valid move,
% checking if user has won, AIs turn to think and make a move, printing out
% ascii art game screen to command window) into seperate functions that the
% main code references each time it needs to. The main code controls the
% use of each function, and only references them when it needs to.
% 
% For each AI mode, I allow them to only access what the user can, and only
% output what the user can, to remove any risk of the AI cheating by
% placing an invalid move, or overwriting another player's move.
% 
% ***By submitting this program with my name, I affirm that the creation and modification
% of this program is my own work***

clc
clear

% create array for tictactoe placement 
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
%           makes sure user inputs valid choice
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
%       convert any string arrays back into a single number
        usrrounds = input('Input number of rounds: ','s');
        usrrounds = sum(str2num(usrrounds));
    
%       makes sure user inputs valid choice
        while  usrrounds < 1
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
                
                addrow = input('Row: ', 's');
                addrow = sum(str2num(addrow));
                addcol = input('Column: ', 's');
                addcol = sum(str2num(addcol));
                
                
            end
%           add player 1's move to the board
            gamestate(addrow, addcol) = 1;
            
%           Checks if player one wins or if board is completly full
            [winmove, ~, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                
                break;
            end
            
            
%           Player 2's turn
            clc
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('%s vs %s\n\n', player1, player2);
            printgamestate(gamestate);
            
            fprintf('%s''s turn!\ninput your next move \n',player2)
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

                addrow = input('Row: ', 's');
                addrow = sum(str2num(addrow));
                addcol = input('Column: ', 's');
                addcol = sum(str2num(addcol));
                
            end
            
            gamestate(addrow, addcol) = 2;
%           checks if player 2 wins or if board is completely full
            [winmove, ~, fullgame] = checkwin(gamestate);
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
            
            addrow = input('Row: ', 's');
            addrow = sum(str2num(addrow));
            addcol = input('Column: ', 's');
            addcol = sum(str2num(addcol));
            
%           uses function to check if move is a valid move, or if its out
%           of bounds
            while  checkvalidmove(addrow, addcol, gamestate) == false
                clc
        
                fprintf('Tic Tac Toe v1.0 \n\n');
                fprintf('%s vs AI\n\n', player1);
                printgamestate(gamestate);
                fprintf('incorrect move try again\n%s input your next move \n',player1)
                addrow = input('Row: ', 's');
                addrow = sum(str2num(addrow));
                addcol = input('Column: ', 's');
                addcol = sum(str2num(addcol));
                
            end
%           add player 1's move to the board
            gamestate(addrow, addcol) = 1;
            
%           Checks if player one wins or if board is completly full
            [winmove, ~, fullgame] = checkwin(gamestate);
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
            [winmove, ~, fullgame] = checkwin(gamestate);
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
            pause(0.4);
            
%           Checks if player one wins or if board is completly full
            [winmove, ~, fullgame] = checkwin(gamestate);
            if winmove == true || fullgame == true
                break;
            end
            
%           AI 2 turn
            clc
            
            fprintf('Tic Tac Toe v1.0\n\n');
            fprintf('AI 1 vs AI 2\n\n');
            printgamestate(gamestate);
            
            fprintf('AI 2 turn ');
%           Makes AI function make move, and tells the ai function which
%           player num it is, so it knows to try to counter the other
%           player
            if ai2diff == 1
                [row, col] = aimode1(gamestate);
            elseif ai2diff == 2
                [row, col] = aimode2(gamestate, 2);
            else
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
            pause(0.4);
           
%           checks if player 2 wins or if board is completely full
            [winmove, ~, fullgame] = checkwin(gamestate);
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
        printuserwins(player1, player2, player1win, player2win, gamemode, usrrounds);
    end
    
    askend = input('Do you want to play a rematch, new game, or quit?\n ''rematch'', ''new game'', or ''quit'' : ', 's');
%   if userinput is wrong, while loop until they input a valid responce
    while strcmpi(askend, 'rematch') == false && strcmpi(askend, 'new game') == false && strcmpi(askend, 'quit') == false
        clc
        endgamescreen(gamestate, gamemode, playerwinner, player1, player2);
     	if usrrounds ~= 1
            printuserwins(player1, player2, player1win, player2win, gamemode, usrrounds);
        end
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
 
 