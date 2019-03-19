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
  public
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
end

cacca = ConnectFour.new


