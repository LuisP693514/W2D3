
# tic_tac_toe_v1/game.rb

require_relative "board.rb"
require_relative "human_player.rb"

class Game

    attr_reader :p1, :p2
    attr_accessor :current_player

    def initialize(p1, p2)
        @p1 = HumanPlayer.new(p1)
        @p2 = HumanPlayer.new(p2)
        @board = Board.new
        @current_player = @p1
    end

    def switch_turn

        if self.current_player == self.p1
            self.current_player = p2
        else
            self.current_player = p1
        end
    end

    def play

        while @board.empty_positions?

            @board.print

            p "-------"
            p "It is #{@current_player.mark}'s turn"

            pos = @current_player.get_position

            @board.place_mark(pos, @current_player.mark)

            if @board.win_row?(@current_player.mark) || @board.win_col?(@current_player.mark) || @board.win_diagonal?(@current_player.mark)

                p "#{@current_player.mark} has won!"

                return
            else
                self.switch_turn
            end

        end

        p "Draw! Nobody won"

    end

end

g = Game.new(:X, :O)

g.play

