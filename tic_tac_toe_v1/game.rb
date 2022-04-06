require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize(mark_1,mark_2)
        @currentPlayer = Human_player.new(mark_1)
        @playerOne = @currentPlayer
        @playerTwo = Human_player.new(mark_2)
        @board = Board.new
    end


    def switch_turn
        if @currentPlayer == @playerOne
            @currentPlayer = @playerTwo
        else
            @currentPlayer = @playerOne
        end
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