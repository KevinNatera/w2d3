require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize(n,*marks)
        @board = Board.new(n)
        @players = []
        marks.each do |mark|
            @players << Human_player.new(mark)
        end
        @currentPlayer = @players[0]
    end


    def switch_turn
        @players = @players.rotate(1)
        @currentPlayer = @players[0]
    end


    def play 

     while @board.empty_positions?
        @board.print
        position = @currentPlayer.get_position
        mark = @currentPlayer.mark
        @board.place_mark(position,mark)
        if @board.win?(mark)
            puts "Congratulations player #{mark}, VICTORY!!!"
            return true
            break
        else
            self.switch_turn
        end
     end
        puts "DRAW!!"
    end
end
