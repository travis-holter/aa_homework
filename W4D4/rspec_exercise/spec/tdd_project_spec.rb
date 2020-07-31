require "tdd_project"

describe "#my_uniq" do
    it "returns a unique array" do
        expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end
    it 'works on an empty array' do
        expect([].my_uniq).to be_empty
    end
    # should not modify original array
    # works on things that are not integers (string comparison)
    # capitalized letters?
end

#  finds all pairs of positions where the elements at those positions sum to zero
# spec about ordering
describe "#two_sum" do
    it "should return array of indices that sum to zero" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
    it "returns indicies in correct order" do
        expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[2, 3],[0, 4]])
    end
    it "should not include an array of the same indicies" do
        expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[0, 4],[1,1],[2, 3]])
    end
end
describe "#my_transpose" do
    it "should transpose the given array" do
        rows = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]
        expect(rows.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
    it "should return an error if given a matrix that isn't a 2d grid" do
        expect { [1,2,3,4,5].my_transpose }.to raise_error(ArgumentError)
    end

    # only works with a square matrix
    # answer has numbers zero through eight, and only one instance of each of these numbers
end

describe "#stock_picker" do
    stock_prices = []
    it "should output the most profitable pair of days to buy and sell" do
        expect([100, 200, 150, 300].stock_picker).to eq([0, 3])
    end
    it "should retrun and error if array doesn't contain all integers" do
        expect { [1, "five", 50].stock_picker }.to raise_error(ArgumentError)
    end
    it "should not output the stock prices" do
        expect([100, 200, 150, 300].stock_picker).to_not eq([100, 300])
    end
    #  have a var that tracks the movement of numbers in the array (ascending,descending)
    #  This would provide a metric for the health of the market 

end

# three arrays, representing the piles of discs, number representing size. 
# prompts user to select disc from pile and where to put it. 
# No larger disk may be placed on top of a smaller disk

describe '#move' do
    subject(:game) {Hanoi.new}

    it "should properly initialize the game" do
        expect(game.stack_1).to eq([4,3,2,1])
        expect(game.stack_2).to be_empty
        expect(game.stack_3).to be_empty
    end
    it "should put be able to move a disc to an empty stack" do
        game.move(game.stack_1,game.stack_2)
        expect(game.stack_1).to eq([4,3,2])
        expect(game.stack_2).to eq([1])
    end
    it 'should not move a large disc on top of a small disc' do
        game.move(game.stack_1,game.stack_2)
        expect(game.move(game.stack_1,game.stack_2)).to eq("I can't do that")
    end

end

# check if all discs are in final pile after each turn

describe '#won?' do
    subject(:game) {Hanoi.new}
    it "should return true if the game is won" do
        game.stack_1 = []
        game.stack_2 = []
        game.stack_3 = [4,3,2,1]
        expect(game.won?).to be true
    end
    it 'should return false if the game is not won' do
        expect(game.won?).to be false
    end
end




