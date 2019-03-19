class ConnectFour
  attr_accessor :grid, :player1,  :player2

  def initialize
    @grid =  create_grid
  end

  def new_game
    puts "Welcome to a Connect four game!"
    get_player_names
    loop do
      display_grid
      puts "#{@player1}, where do you want to put your piece?"
      put_piece gets.chomp.to_i, "O"
      display_grid
      if check_victory 
        puts "#{@player1} wins!! #{@player2} keep practicing!"
        return
      end
      break if check_full
      puts "#{@player2}, where do you want to put your piece?"
      put_piece gets.chomp.to_i, "X"
      if check_victory 
        puts "#{@player2} wins!! #{@player1} keep practicing!"
        return
      end
      break if check_full
    end
  end

  def put_piece column, piece
    row = 0

    while row < @grid.length
      if @grid[row][column-1] == " "
        @grid[row][column-1] = piece 
        return

      else
        row += 1
      end
    end   
    return "error"   
  end

  def check_victory
    
    grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        if cell != " "
          return true if check_cell row_index, column_index
        end
      end
    end
    return false
  end

  private
  def create_grid
    grid = []

    6.times do
      row = []
      7.times do
        row << " "
      end
      grid << row
    end

    grid
  end

  def display_grid
    print "\n"
    7.times {print "__"}
    print "\n"

    grid.reverse.each do |row|
      puts "|#{row.join("|")}|"
    end

    14.times {print "\u203E".encode('utf-8')}
    print "\n 1 2 3 4 5 6 7\n"
  end

  def get_player_names
    puts "Player 1, enter your name!"
    @player1 = gets.chomp
    puts "Now yours, player 2!"
    @player2 = gets.chomp
  end

  def check_full
    @grid.each do |row|
      return false if row.include? " "
    end
    return true
  end

  def check_cell row, column
    reference = grid[row][column]
    counter = 0
    piece_coordinates = [row, column]

    #check horizontally
    while grid[piece_coordinates[0]][piece_coordinates[1]] == reference
      counter += 1
      return true if counter == 4

      break if piece_coordinates[1] == (grid[0].length) -1
      piece_coordinates[1] += 1 if piece_coordinates[1] < grid[0].length
    end
    counter = 0
    piece_coordinates = [row, column]

    #check vertically
    while grid[piece_coordinates[0]][piece_coordinates[1]] == reference
      counter += 1
      return true if counter == 4
      
      break if piece_coordinates[0] == (grid.length) -1
      piece_coordinates[0] += 1 if piece_coordinates[0] < grid.length
    end
    counter = 0
    piece_coordinates = [row, column]

    #check diagonally right
    while grid[piece_coordinates[0]][piece_coordinates[1]] == reference
      counter += 1
      return true if counter == 4
      
      break if piece_coordinates[0] == (grid.length) -1 || piece_coordinates[1] == grid[0].length
      if piece_coordinates[0] < grid.length && piece_coordinates[1] < grid[0].length
        piece_coordinates[0] += 1 
        piece_coordinates[1] += 1
      end
    end
    counter = 0
    piece_coordinates = [row, column]

    #check diagonally left
    while grid[piece_coordinates[0]][piece_coordinates[1]] == reference
      counter += 1
      return true if counter == 4
      
      break if piece_coordinates[0] == (grid.length) -1 || piece_coordinates[1] == 0
      if piece_coordinates[0] < grid.length && piece_coordinates[1] >= 0
        piece_coordinates[0] += 1 
        piece_coordinates[1] -= 1
      end
    end
    return false
  end
  
end
  

game = ConnectFour.new
game.new_game
