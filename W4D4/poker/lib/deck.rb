require_relative 'card'

class Deck
    SUITS = [:hearts,:spades,:diamonds,:clubs]
    attr_reader :cards
    def initialize
        @cards = []
        SUITS.each do |suit|
            (2..14).each do |value|
                @cards << Card.new(value, suit)
            end
        end

    end

end