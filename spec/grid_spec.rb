require './connect_four.rb'

describe ConnectFour do
  describe "#put_piece" do
  
  end

  describe "#initialize" do
    it "creates a grid of height 6" do
      game = ConnectFour.new
      expect(game.grid.length).to eql(6)   
    end
    it "creates a grid of wisth 7" do
      game = ConnectFour.new
      expect(game.grid[0].length).to eql(7)  
    end    
  end
  
end
