<<<<<<< HEAD
class Game
  require "pry"

  attr_accessor :player_1, :player_2, :board
  attr_reader
  attr_writer
  def initialize(player_1= nil, player_2 = nil, board = nil)
    if player_1 == nil
      player_1= Players::Human.new("X")
    end
    @player_1 = player_1
    if player_2 == nil
      player_2 = Players::Human.new("O")
    end
    @player_2 = player_2
    if board== nil
      board = Board.new
    end
    @board = board
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def current_player
    current_turn = self.board.turn_count
    if current_turn.even?
      return player_1
    else
      return player_2
    end
  end
  def won?
    WIN_COMBINATIONS.each do |w_c|
      win_index_1 = w_c[0]
      win_index_2 = w_c[1]
      win_index_3 = w_c[2]
      position_1 = self.board.position(win_index_1+1)
      position_2 = self.board.position(win_index_2+1)
      position_3 = self.board.position(win_index_3+1)
      if ((position_1 == player_1.token && position_2 == player_1.token && position_3 == player_1.token)  || (position_1 == player_2.token && position_2 == player_2.token && position_3 == player_2.token))
        return w_c
      end
    end
    return false
  end
  def draw?
    if self.board.full? && self.won? == false
      return true
    else
      return false
    end
  end
  def over?
    if self.draw? || self.won?
      return true
    else
      return false
    end
  end
  def winner
    w_c = self.won?
    if w_c != false
      pos1 = w_c[0]+1
      won_tok = self.board.position(pos1)
      return won_tok
    end
    return nil
  end
  def turn
    turn_player = self.current_player
    player_move = turn_player.move(self.board)
    if self.board.valid_move?(player_move) == true
      self.board.update(player_move,turn_player)
      self.board.display
  else
    self.turn
  end
  end
  def play
    while self.over? == false
      self.turn
    end
    if self.winner == nil
      puts "Cat's Game!"
    else
      won_tok = self.winner
      puts "Congratulations #{won_tok}!"
    end
  end

end
=======
# class Game
#   attr_accessor
#   attr_reader
#   attr_writer
#   def initilize()
#
#   end
# end
>>>>>>> 308495d6590ff930ea35c31cb95f1a09920c221a
