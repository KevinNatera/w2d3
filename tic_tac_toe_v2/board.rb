class Board
    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n,"_") }
    end


    def valid?(position)
        if position[0] > @grid.length - 1 || position[1] > @grid.length - 1
            false
        else
            true
        end
    end 


    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end


    def place_mark(position,mark)
        if self.valid?(position)
            if self.empty?(position)
                @grid[position[0]][position[1]] = mark
            else
                raise "Position taken!"
            end
        else
            raise "Position invalid!"
        end
    end

    
    def print

        @grid.each do |row|
            
            row.each do |val|
                p val
            end
            puts
        end
    end

    def win_row?(mark)
        counter = 0

             @grid.each do |row|

                    row.each do |val|
                         counter += 1 if val == mark
                    end
                
                if counter == @grid.length
                    return true
                    break
                else
                    counter = 0
                end
              end
        false
    end


    def win_col?(mark)
        counter = 0

        (0...@grid.length).each do |i|
            @grid.each do |row|
                    counter += 1 if mark == row[i]
            end
            if counter == @grid.length
                return true
                break
            else
                counter = 0
            end
        end
        false
    end


    def win_diagonal?(mark)
        upLeftCounter = 0
        downRightCounter = 0
        lastIndex = @grid.length - 1

        (0...@grid.length).each do |i|
            downRightCounter += 1 if @grid[i][i] == mark
            upLeftCounter += 1 if @grid[lastIndex - i][0 + i] == mark
        end

        if upLeftCounter == @grid.length || downRightCounter == @grid.length
            true
        else
            false
        end
        
    end


    def win?(mark)
        if self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
            true
        else
            false
        end
    end



    def empty_positions?
        bool = false

        @grid.each do |row|
            row.each do |val|
                bool = true if val == "_"
            end
        end
        bool
    end
end

