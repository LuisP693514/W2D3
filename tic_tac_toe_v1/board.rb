
# tic_tac_toe_v1/board.rb

class Board

    def initialize

        @grid = Array.new(3) {Array.new(3, "_")}

        
    end

    def valid?(position)

        position.each {|ele| return false if ele > 2 || ele < 0}

        true

    end

    def empty?(pos)

        @grid[pos[0]][pos[1]] == "_"

    end

    def place_mark(pos, mark)

        if self.valid?(pos)
            if self.empty?(pos)
                @grid[pos[0]][pos[1]] = mark

            else
                raise RuntimeError.new("Position is not empty!")
            end

        else
            raise RuntimeError.new("Position is not valid! (Top left is [0,0], bottom right is [2,2])")
        end
    end
end

b = Board.new

# p b.valid?([1,4]) # false
# p b.valid?([2,2]) # true
# p b.valid?([-1, 2]) # false

# p b.empty?([1,1]) #true

# p b.place_mark([1,4], "X") # Invalid spot error
# b.place_mark([0,0], "x")
# p b.place_mark([0,0], "o") # Invalid not empty
