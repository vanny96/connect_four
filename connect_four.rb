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
end

cacca = ConnectFour.new
print cacca.grid
