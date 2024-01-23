require_relative './game.rb'

class computer_player
  def initialize
    @known_cards = Hash.new{|h, v| h[v] = []}
    @matched_cards = []
    
  end

  def receive_revealed_card(position, value)
    @known_cards[value] << position
  end

  def receive_match(pos_1, pos_2)
    position = [pos_1, pos_2]
    #matches matched cards
    @known_cards.each |key, value|
      if value.sort == position.sort 
        @matched_cards << key
       return true
      end
    end
    false
  end

  #computer decides guess 
  def prompt
  end
    #determine 1st vs second guess
  #1st guess - look @ known cards. looks through values in hash
  # that match have  arr size of 2
  #select key not in matched cards
  # if pass, good guess, if not, random guess on empty spaces



  #hash value not in matched cards 
  #value that does not exist in matched
    #if 2nd guess, look through known match
  

  end
    



end