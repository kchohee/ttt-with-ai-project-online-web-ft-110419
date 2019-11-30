module Players
  class Computer < Player
    def move(board)
      comp_move = rand(1..9).to_s
      if board.valid_move?(comp_move)
        return comp_move
      else
        return self.move(board)
      end
    end
  end
end
