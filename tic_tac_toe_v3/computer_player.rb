class Computer_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end


    def get_position(legal_positions)
        position = legal_positions.sample
        puts "Computer #{mark} has selected position #{position}."
        position
    end

end