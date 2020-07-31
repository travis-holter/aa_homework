class Card
    SUITS = [:hearts,:spades,:diamonds,:clubs]

    attr_reader :value, :suit, :revealed

    def initialize(value, suit)
        @value = value
        raise ArgumentError if !value.between?(2,14)
        @suit = suit
        raise ArgumentError if !SUITS.include?(suit)
        @revealed = false
    end
end