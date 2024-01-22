class Card

    attr_reader :face_val, :face_up

    def initialize(face_val)

        @face_val = face_val
        @face_up = false

    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
        @face_val
    end

    def ==(card)
        self.face_val == card.face_val
    end
  
    def to_s
      self.face_val 
    end


end

if __FILE__ == $PROGRAM_NAME
    a1 = Card.new('a')
    a2 = Card.new('a')
    b = Card.new('b')
    a1
    a2
    b
    a1 == a2
    a1 == b
    a1.reveal
    a1
    a1.hide
    a1
end
