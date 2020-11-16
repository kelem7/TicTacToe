## The Odin Project - Ruby Programming 
### Project: Tic Tac Toe

Built a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.  

This project is from The Odin Project's [curriculum](https://www.theodinproject.com/courses/ruby-programming/lessons/tic-tac-toe).


## Summary 
* Created a GamePlay class to contain game methods, a Board class to update the board, and a Player class to contain information about the players.
* In the Board class, set up an array to hold the spaces on the board, and methods to display the board each turn. Then created methods to determine if each move is valid, if the board is full, and if there are any winning combinations.
* In the Player class, set up methods to create two players and store their names, assigning them each X or O. 
* Initialized the GamePlay class with a new Board, creating two players, and prompting the play method.
* The play method utilizes a **while loop** with a **break** to loop through turns until it is a draw or someone wins. 