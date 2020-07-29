class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = []
    6.times { cups << [:stone, :stone, :stone, :stone] }
    @cups << []
    6.times { cups << [:stone, :stone, :stone, :stone] }
    @cups << []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if cups[start_pos - 1].empty? && start_pos < 6
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = cups[start_pos].length
    cups[start_pos] = []
    current_pos = start_pos
    until stones_in_hand == 0
      current_pos += 1
      current_pos = 0 if current_pos == 14
      if current_pos == 6 && current_player_name == @name1
        cups[current_pos] << :stone
        stones_in_hand -= 1
        next
      elsif current_pos == 6 && current_player_name != @name1
        next
      elsif current_pos == 13 && current_player_name == @name2
        cups[current_pos] << :stone
        stones_in_hand -= 1
        next
      elsif current_pos == 13 && current_player_name != @name2
        next
      else
        cups[current_pos] << :stone
        stones_in_hand -= 1
      end
    end
    self.render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx if cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0..5).all? { |i| cups[i].empty? }
    return true if (7..12).all? { |i| cups[i].empty? }
    false
  end

  def winner
    return @name1 if cups[6].length > cups[13].length
    return @name2 if cups[6].length < cups[13].length
    return :draw if cups[6].length == cups[13].length
  end
end
