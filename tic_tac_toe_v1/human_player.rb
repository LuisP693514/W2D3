
# tic_tac_tow_v1/human_player.rb

class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end



end

h = HumanPlayer.new(:X)

p h.mark

