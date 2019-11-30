module Players
    class Human < Player
      def move(board)
        puts "Please enter a location 1-9"
        location  = gets.strip
        return location
      end
    end
  end
