require_relative './card.rb'

class Board

    def initialize(size=4)

        if size < 8 && size.even?
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
            face_val = (alphabet[rand(0...26)])


            unless @grid.any?{|row| row.any?{|ele| ele.to_s == face_val}}
                positions = self.empty_grids.sample(2)
                positions.each{|position| self[position] = Card.new(face_val)}

            end
        end
    end

    def render
        @grid.each do |row|
            print_row = ''
            row.each do |card|
                if card.face_up == 'up'
                    print_row += card.face_val
                else
                    print_row += ' '
                end
            end
            puts print_row

        end

    end

    def reveal(position)
        return self[position].reveal unless self[position].face_up == 'up'
    end

    def won?
        @grid.all?{|row| row.all?{|ele| ele.face_up == 'up'}}
    end

    def valid_position?(position)

        position.all?{|val| val >= 0 && val < @size} && position.length == 2
    end

end


if __FILE__ == $PROGRAM_NAME

    a = Board.new(4)
    a.populate
    a.reveal([0,0])

end
