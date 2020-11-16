class GamePlay

  attr_accessor :board

  def initialize()
    puts "Welcome To Tic Tac Toe!"
    get_players
    arr = [1,2,3,4,5,6,7,8,9]
    @board = Board.new(arr)
    play
  end

  #Game play
  def play()    
    
    while !@board.full?(@board.space)
      @player.make_move(@player, @board, @board.space)
      break if @board.win?(@board.space, @player)
      change_player(@player)
    end

    if @board.win?(@board.space, @player)
      puts "Congratulations, #{@player.name} wins!"
      play_again?
    elsif @board.full?(@board.space)
      puts "It's a draw!"
      play_again?
    end

  end

  #Get players
  def get_players
    puts "Insert name of Player One: "
    p1_name = gets.chomp.to_s
    @p1 = Player.new(p1_name, "X")
    puts "Insert name of Player Two: "
    p2_name = gets.chomp.to_s
    @p2 = Player.new(p2_name, "O")
    @player = @p1
  end

  #Change player
  def change_player(player)
    if (player == @p1)
      @player = @p2
    else
      @player = @p1
    end
  end

  #Prompt user to play again
  def play_again?
    answer = ""
    while answer !="Y" && answer != "N"
      puts "Play again? (Y/N)"
      answer = gets.chomp
    end
    if answer == "Y"
      game = GamePlay.new
    elsif answer == "N"
      exit
    end
  end

end

class Board 
  attr_accessor :space

  WIN_COMBINATIONS = [ 
  [0,1,2], # top_row 
  [3,4,5], # middle_row 
  [6,7,8], # bottom_row 
  [0,3,6], # left_column 
  [1,4,7], # center_column 
  [2,5,8], # right_column 
  [0,4,8], # left_diagonal 
  [6,4,2] # right_diagonal 
]

  def initialize(space)
    @space = space
    display_board
  end

  #Create a new board
  def display_board()
      puts "| #{@space[0]} || #{@space[1]} || #{@space[2]} |"
      puts "---------------"
      puts "| #{@space[3]} || #{@space[4]} || #{@space[5]} |"
      puts "---------------"
      puts "| #{@space[6]} || #{@space[7]} || #{@space[8]} |"
      puts
  end

  #Update the board
  def update_board(player, move)
    @space[move] = "#{player.symbol}"
    display_board
  end

  #Determine if the board is full
  def full?(board)
    board.all? {|i| i == "X" || i == "O"}
  end

  #Determine if there's a win
  def win?(board, player)
      WIN_COMBINATIONS.any? do |combo|
      combo.all? {|cell| board[cell] == player.symbol} 
      #binding.pry
    end
  end

end

class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  #Get placement from player
  def make_move(player, board, move)
    print "#{name}'s turn. \nSelect your placement using the corresponding number: "
      placement = gets.chomp
      index = get_index(placement)
      while !valid_move?(move, index)
        puts "Please pick a valid, clear square from 1 - 9!"
        placement = gets.chomp
        index = get_index(placement)
      end
      board.update_board(player, index)
  end

  #Calculate the index in the arr based on the number input by player
  def get_index(input)
    input.to_i - 1
  end

  #Determine if position has already been used
  def position_taken?(board, index)
    board[index] == "X" || board[index] == "O"
  end
  
  #Determine if it's a valid move
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index) 
  end

end

game = GamePlay.new


