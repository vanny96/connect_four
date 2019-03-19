require './connect_four.rb'

describe ConnectFour do
  game = ConnectFour.new

  describe "#put_piece" do
    it "adds pieces to the bottom of the grid" do
      game.put_piece 1, "O"
      expect(game.grid[0][0]).to eql("O")  
    end
    it "stacks pieces on top of other pieces" do
      game.put_piece 2, "X"
      game.put_piece 2, "X"
      expect(game.grid[1][1]).to eql("X")  
    end
    it "doesn't allow pieces above the top" do
      6.times{game.put_piece 4, "O"}
      expect(game.put_piece 4, "O").to eql("error") 
    end
  end

  describe "#initialize" do
    it "creates a grid of height 6" do
      expect(game.grid.length).to eql(6)   
    end
    it "creates a grid of wisth 7" do
      expect(game.grid[0].length).to eql(7)  
    end    
  end
  
end

