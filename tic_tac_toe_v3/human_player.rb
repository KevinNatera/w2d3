class Human_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end


    def get_position(legal_positions)
        pos = nil
        until legal_positions.include?(pos)
            puts "Player #{mark}, enter two numbers representing a position in the format `row col`"
            pos = gets.chomp.split(' ').map(&:to_i)
            puts "#{pos} is not a legal position" if !legal_positions.include?(pos)
            raise 'sorry, that was invalid :(' if pos.length != 2
        end
        pos
    end


end

