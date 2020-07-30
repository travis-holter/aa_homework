require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:pie) { Dessert.new("cherry", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq("cherry")
    end
    it "sets a quantity" do
      expect(pie.quantity).to eq(50)
    end
    it "starts ingredients as an empty array"do
      expect(pie.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cherry", "fifty", "chef") }.to raise_error(ArgumentError)
    end
  end

  # pie.add_ingredient("crust")
  # pie.add_ingredient("filling")
  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"do
      expect(pie).to receive(:add_ingredient).with("filling")
      pie.add_ingredient("filling")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(pie.ingredients).to receive(:shuffle!).with(no_args)
      pie.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pie.eat(20)
      expect(pie.quantity).to eq(30)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { pie.eat(1000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
  let(:chef) { Chef.new("chef") }
    it "contains the titleized version of the chef's name" do
      expect(pie.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
