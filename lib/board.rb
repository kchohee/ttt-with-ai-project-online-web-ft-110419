class Board
  attr_accessor :cells
  attr_reader
  attr_writer
  def initialize
    reset!
  end
  def cells
    @cells
  end
  def reset!
    @cells = Array.new(9, " ")
  end
  def display
    puts row_1 = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts divider = "-----------"
    puts row_2 = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts divider
    puts row_3 = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(user_position)
    return @cells[(user_position.to_i)-1]
  end
  def full?
    @cells.each do |cell|
      if cell == " "
        return false
      end
    end
    return true
  end
  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    return counter
  end
  def taken?(index)
    if self.position(index) == " "
      return false
    else
      return true
    end
  end
  def valid_move?(index)
    index = index.to_i
    if index > 9 || index < 1 || self.taken?(index)
      return false
    else
      return true
    end
  end
  def update(index,player)
    @cells[(index.to_i)-1] = player.token
  end
end
