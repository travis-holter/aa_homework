require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos 
  end


  def losing_node?(evaluator) #evaluator = current mark
    otherplayer = (evaluator == :x ? :o : :x)
    #return false if self.board.over? && self.board.winner == nil
    return true if self.board.over? && self.board.winner == otherplayer
    # return false if self.children.empty?
    #return false if self.board.over?  && self.board.winner == nil
    debugger
    return false if self.children.all?  { |child| child.board.tied?}
    #Note to us: use something other than self.^^^^^^^
    if self.next_mover_mark == evaluator #our turn 
      self.children.all? { |child| child.losing_node?(evaluator)}  #if all our next moves are bad, the node is a loser
    else #opponent's turn
      self.children.any? { |child| child.losing_node?(evaluator)}   #if even one of the next moves are bad, the node is a loser b/c the opponent will pick it
    end
      # self.children.any? { |child| child.losing_node?(otherplayer)} 
      
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []
    #debugger
    
    (0...3).each do |row|
      (0...3).each do |col|
        if self.board.empty?([row, col])
          mark = self.next_mover_mark == :x ? :o : :x
          child = TicTacToeNode.new(self.board.dup, mark, [row, col])
          child.board[[row, col]] = mark 
          nodes << child
        end
      end
    end
    nodes
  end


end
