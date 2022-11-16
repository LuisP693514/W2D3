require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        self.board.place_random_ships
        self.board.print
        print self.board.num_ships, " ships left"
    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if self.board.num_ships <= 0
            p 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        if self.win? || self.lose?
            return true
        else 
            return false
        end
    end

    def turn

        pos = @player.get_move
        if !self.board.attack(pos)
            @remaining_misses -= 1
        end

        self.board.print
        print "#{@remaining_misses} tries remaining"

    end


end
