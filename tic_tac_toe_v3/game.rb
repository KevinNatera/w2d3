require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

class Game

    def initialize(n, players)
        @board = Board.new(n)
        @players = players.map do |mark,is_computer|
            if is_computer
                Computer_player.new(mark)
            else
                Human_player.new(mark)
            end
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
        validPositions = @board.legal_positions
        position = @currentPlayer.get_position(validPositions)
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
