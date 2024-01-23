class Card

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
