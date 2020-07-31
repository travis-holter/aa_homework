
require 'card'

#  needs a value and a suit
#  has a revealed status, true or false
#  

describe Card do
    subject(:card) {Card.new(9, :clubs)}
        # let(:card2) {Card.new(14, :frogs)}
    describe '#initialize' do
        it 'should initialize as an integer value between 2 and 14 ' do
            expect{Card.new(9, :clubs)}.to_not raise_error
            expect{Card.new(15, :clubs)}.to raise_error(ArgumentError)
        end

        it 'should initialize a symbol suit (hearts, clubs, spades, diamonds)' do
            suits = [:hearts,:spades,:diamonds,:clubs]
            expect(suits).to include(card.suit)
            expect{Card.new(14, :frogs)}.to raise_error(ArgumentError)
        end
        it 'should initialize with a status of false (facedown)' do
            expect(card.revealed).to eq(false)
        end

    end
end


