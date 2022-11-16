
# tic_tac_toe_v1/board.rb

class Board

    def initialize

        @grid = Array.new(3) {Array.new(3, "_")}

        
    end

    def valid?(position)

        position.each {|ele| return false if ele > 2 || ele < 0}

        true

    end



end

b = Board.new

# p b.valid?([1,4]) # false
# p b.valid?([2,2]) # true
# p b.valid?([-1, 2]) # false