require_relative './card.rb'

class Board

    def initialize(size=4)

        if size < 8
            @size = size
        else
            raise 'board size too big'
        end

        @grid = Array.new(@size){Array.new(@size)}
    end

    def [](position)

        row, col = position
        @grid[row][col]

    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end


end
