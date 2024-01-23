require_relative './board.rb'
require 'byebug'

class Game


    def initialize(size)

        @size = size
        @board = Board.new(@size)
        @board.populate
        @previously_guessed = Card.new('1')

    end



    def play

        until @board.won?
            system("clear")
            @board.render
            puts "Please enter a position like 0 0 to reveal card"

            position = gets.chomp.split(" ")
            if position.all?{|ele| ele.to_i.to_s == ele}
                position.map!{|ele| ele.to_i}
                if @board.valid_position?(position)
                    card = @board.reveal(position)
                    system("clear")
                    @board.render
                    # debugger
                    if @previously_guessed == Card.new('1')
                        @previously_guessed = card
                    else
                        unless @previously_guessed == card
                            system("clear")
                            @board.render
                            puts 'wrong guess'
                            sleep(2)
                            @previously_guessed.hide
                            card.hide
                        end
                        @previously_guessed = Card.new('1')
                    end

                end
            end

        end
        puts 'You win!'
    end

end

if __FILE__ == $PROGRAM_NAME

    a = Game.new(4)
    a.play

end
