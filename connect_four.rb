class ConnectFour
  attr_accessor :grid

  def initialize
    @grid =  create_grid
    
  end
  def put_piece column
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
      puts row.join("|")
    end
    14.times {print "\u203E".encode('utf-8')}
  end
end

cacca = ConnectFour.new

