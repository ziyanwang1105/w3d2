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

    def empty_grids

        result = []
        (0...@size).each do |row|
            (0...@size).each do |col|
                position = [row, col]
                result << position if self[position].nil?
            end
        end
        result
    end

    def populate

        num_of_pairs = @size * @size / 2
        alphabet = ('a'..'z').to_a

        until @grid.all?{|row| row.all?{|ele| ele.is_a?(Card)}}
            card = Card.new(alphabet[rand(0...26)])

            unless @grid.any?{|row| row.any?{|ele| ele == card}}
                positions = self.empty_grids.sample(2)
                positions.each{|position| self[position] = card}
            end
        end
    end

    def render
        @grid.each do |row|
            print_row = ''
            row.each do |card|
                if card.face_up
                    print_row += card.face_val
                else
                    print_row += ' '
                end
            end
            puts print_row

        end

    end

    def won?
        @grid.all?{|row| row.all?{|ele| ele.face_up}}
    end

end
