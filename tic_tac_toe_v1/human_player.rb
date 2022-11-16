
# tic_tac_tow_v1/human_player.rb

require_relative "board.rb"

class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position

        p 'Enter valid position to place your mark (2 numbers seperated by space)'

        pos = gets.chomp.split(" ")
        pos = pos.map {|ele| ele.to_i}

        return pos

    end


end

# h = HumanPlayer.new(:X)

# p h.mark

#----------------------

# p h.get_position

#----------------------



