class ConnectFour
  attr_accessor :grid

  def initialize
    @grid =  create_grid
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

    grid.each do |row|
      puts "|#{row.join("|")}|"
    end

    14.times {print "\u203E".encode('utf-8')}
    print "\n 1 2 3 4 5 6 7\n"
  end

  def check_cell row, column
    reference = grid[row][column]
    counter = 0
    piece_coordinates = [row, column]
    #check horizontally
    while grid[piece_coordinates[0]][piece_coordinates[1]] == reference
      counter += 1
      return true if counter == 4
      piece_coordinates[1] += 1 if piece_coordinates[1] < grid[0].length
      break if piece_coordinates[1] == (grid[0].length) -1
    end
    return false
  end
  
end
  

game = ConnectFour.new

