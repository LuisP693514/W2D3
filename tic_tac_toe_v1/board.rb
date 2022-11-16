
# tic_tac_toe_v1/board.rb

class Board

    def initialize

        @grid = Array.new(3) {Array.new(3, :_)}

        
    end

    def valid?(position)

        position.each {|ele| return false if ele > 2 || ele < 0}

        true

    end

    def empty?(pos)

        @grid[pos[0]][pos[1]] == :_

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

    def print

        @grid.each {|row| p row.join(" ") }

    end

    def win_row?(mark)

        @grid.each {|row| return true if row.all?(mark)}

        false

    end

    def win_col?(mark)

        @grid.transpose.each {|row| return true if row.all?(mark)}

        false

    end

    def win_diagonal?(mark)

        r_grid = @grid.reverse

        diag = []
        other_diag = []

        @grid.each.with_index {|row, i1| row.each.with_index {|val, i2| diag << val if i1 == i2}}
        r_grid.each.with_index {|row, i1| row.each.with_index {|val, i2| other_diag << val if i1 == i2}}

        diag.all?(mark) || other_diag.all?(mark)

    end

    def empty_positions?

        @grid.flatten.any?(:_)

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

# b.print   # _ _ _  *Assuming you have not placed anything on board
#           # _ _ _
#           # _ _ _

#---------------------------

# b.place_mark([0,0], "x")
# b.place_mark([0,1], "x")
# b.place_mark([0,2], "x")

# p b.win_row?("x") # true
# p b.win_row?("o") # false

#---------------------------

# b.place_mark([0,0], "x")
# b.place_mark([1,0], "x")
# b.place_mark([2,0], "x")

# p b.win_col?("x") # true
# p b.win_col?("o") # false

#---------------------------

# b.place_mark([0,2], "x")
# b.place_mark([1,1], "x")
# b.place_mark([2,0], "x")

# b.print

# p b.win_diagonal?("x") # true
# p b.win_diagonal?("o") # false

#---------------------------

b.place_mark([0,0], "x")
b.place_mark([0,1], "x")
b.place_mark([0,2], "x")
b.place_mark([1,0], "x")
b.place_mark([1,1], "x")
b.place_mark([1,2], "x")
b.place_mark([2,0], "x")
b.place_mark([2,1], "x")

p b.empty_positions? #true

b.place_mark([2,2], "x")

p b.empty_positions? #false

#---------------------------


