class Board
  
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](pos)

        @grid[pos[0]][pos[1]]

    end

    def []=(pos, val)

        @grid[pos[0]][pos[1]] = val

    end

    def num_ships

        @grid.flatten.count(:S)

    end

    def attack(pos)

        if self[pos] == :S
            self[pos]=:H
            p 'you sunk my battleship!'
            return true
        else
            self[pos]=:X
            return false
        end

    end

    def place_random_ships

        quarter = self.size / 4
        len = Math.sqrt(self.size)

        count = 0

        while count < quarter
            row = rand(0...len)
            col = rand(0...len)
            pos = [row, col]

            if self[pos] != :S
                count += 1
                self[pos] = :S
            end

        end

    end

    def hidden_ships_grid

        array_copy = @grid.map {|row| row.map {|ele| ele}}

        array_copy.each.with_index {|row, i1| row.each.with_index {|v, i2| array_copy[i1][i2] = :N if v == :S  } }

        array_copy

    end

    def self.print_grid(grid)

        grid.each {|row| puts row.join(" ")}

    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
