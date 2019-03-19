require './connect_four.rb'

describe ConnectFour do
  describe "#put_piece" do
    xit "puts the piece on the first row" do
      game = ConnectFour.new
      expect(game.put_piece 2).to eql([0,1])  
    end
    xit "stacks pieces on over the other" do
      game = ConnectFour.new
      game.put_piece 1
      expect(game.put_piece 1).to eql([1,0])  
    end
    xit "doesn't stack if on different columns" do
      game = ConnectFour.new
      game.put_piece 1
      expect(game.put_piece 2).to eql([0,1])
    end
    xit "doesn't let you put pieces outside the grid" do
    game = ConnectFour.new
    expect(game.put_piece 8).not_to eql([0,7])  
    end
    xit "doesn't let you put piece over the top" do
      game = ConnectFour.new
      6.times{game.put_piece 5}
      expect(game.put_piece 5).not_to eql([6,4])
    end
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
