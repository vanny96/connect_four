require './connect_four.rb'

describe ConnectFour do

  describe "#put_piece" do
    game = ConnectFour.new
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
    game = ConnectFour.new
    it "creates a grid of height 6" do
      expect(game.grid.length).to eql(6)   
    end
    it "creates a grid of wisth 7" do
      expect(game.grid[0].length).to eql(7)  
    end    
  end

  describe "#check_victory" do
    
    it "returns true if 4 pieces are aligne horizontally" do
      game = ConnectFour.new
      game.put_piece 1, "O"
      game.put_piece 2, "O"
      game.put_piece 3, "O"
      game.put_piece 4, "O"
      expect(game.check_victory).to eql(true)  
    end    
    it "returns false if 3 pieces are aligne horizontally" do
      game = ConnectFour.new
      game.put_piece 1, "O"
      game.put_piece 2, "O"
      game.put_piece 3, "O"
      expect(game.check_victory).to eql(false)  
    end 
    it "returns false if 4 pieces aligned horizontally are different" do
      game = ConnectFour.new
      game.put_piece 1, "O"
      game.put_piece 2, "X"
      game.put_piece 3, "O"
      game.put_piece 4, "O"
      expect(game.check_victory).to eql(false)  
    end 
    it "returns true if 4 pieces are aligne horizontally on rows higher than 1" do
      game = ConnectFour.new
      game.put_piece 1, "O"
      game.put_piece 2, "X"
      game.put_piece 3, "O"
      game.put_piece 4, "X"
      game.put_piece 1, "O"
      game.put_piece 2, "O"
      game.put_piece 3, "O"
      game.put_piece 4, "O"
      expect(game.check_victory).to eql(true)  
    end 
    
  end
  
  
end

