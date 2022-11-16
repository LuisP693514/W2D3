class Player

    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        pos = gets.chomp.split(" ").map {|ele| ele.to_i}
        return pos
    end

end
