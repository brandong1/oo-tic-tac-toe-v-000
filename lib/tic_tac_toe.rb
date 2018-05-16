 class TicTacToe
 
  puts 'Welcome to Tic Tac Toe!'
  def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
  # @board = Array.new(9, " ") -- Something like this, too?
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top throw
    [3, 4, 5], # Middle row 
    [6, 7, 8], # Bottom row
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def turn(index)
    puts "Please enter 1-9:"
  
    input = gets.strip # I'm getting a users input 
    index = input.to_i # Calling input_to_index method
  
    if valid_move?(index) 
      puts "Valid Move"
      move(index) # Calls the move method
      display_board(input) # Displays board with updated index
    else
     puts "Invalid move. Try again."
     turn(input) # Re-runs the turn() method (i.e. re-runs this code block)
    end
  end
  
  
  def input_to_index(input)
    
     index = input.to_i - 1 # Declares the index variable, changes it to an integer and -1 to correspond to the array indexes
     index
  end
  
  def valid_move?(index)
    if index.to_i.between?(0, 8) && !position_taken?(index)
      true 
    else
      false 
    end
  end
  
  def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
          false
      else
          true
      end
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1 
      end 
    end
    counter
  end
  
  def current_player
    turn = "X"
    if turn_count % 2 == 0 
      puts "X" 
       turn
    else
      turn = "O"
      puts "O"
      turn
    end 
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
   
      
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X" 
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else false
      end 
    end

  end
  
  
  def full?
    @board.all? do |index|
      index == "X" || index == "O"
     end  
    
  end
  
  
  def draw?
    if won? == false && full? == true 
      return true
    end 
    false
  end
  
  
  def over?
    won? || full?
  end
    
  
  def winner
    if won? == false
      nil
    else
      x = won?
      if @board[x] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play(index)
    turn(index)
    while won? == false
        over?
        full?
        draw?
      end 
  
  end 
end