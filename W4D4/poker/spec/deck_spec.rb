require "deck"

describe Deck do
    subject(:deck) {Deck.new }
    let(:card) { double("card") }
    describe "#initialize" do
        it "makes a deck of 52 card instances" do
            expect(deck.cards.length).to eq(52)
        end

        it "have 13 cards of each suit" do 
            spades = 0
            hearts = 0
            clubs = 0
            diamonds = 0
            deck.cards.each do |card|
                spades += 1 if card.suit == :spades
                hearts += 1 if card.suit == :hearts
                clubs += 1 if card.suit == :clubs
                diamonds += 1 if card.suit == :diamonds
            end
            expect(spades).to eq(13)
            expect(hearts).to eq(13)
            expect(diamonds).to eq(13)
            expect(clubs).to eq(13)
            #deck.count
        end

        it "has 4 cards of each number 2 - 14" do
            nums_hash = Hash.new(0)
            deck.cards.each { |card| nums_hash[card.value] += 1 }
            expect(nums_hash.values.all?{ |value| value == 4 }).to be true
        end

    end

    # shuffle
end