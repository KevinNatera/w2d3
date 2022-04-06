class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { |e| Array.new(n,:N) }
        @size = n * n
    end


    def [](position)
        @grid[position[0]][position[1]]
    end


    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end


    def num_ships
        counter = 0

        @grid.each do |row|
            row.each do |val|
                counter += 1 if val == :S
            end
        end
        counter
    end

    def attack(position)
        if self.[](position) == :S
            self.[]=(position,:H)
            puts "you sunk my battleship!"
            true
        else 
            self.[]=(position,:X)
            false
        end
    end


    def place_random_ships
        i = 0
        counter = 0
         while counter < @size / 4
            @grid.each_with_index do |row,idx1|

                row.each_with_index do |val,idx2|
                       i = rand(0..9999)
                      if i % 2 == 0 && counter < @size / 4
                         @grid[idx1][idx2] = :S
                         counter += 1
                      else
                         @grid[idx1][idx2] = :N
                     end
                end
            end
        end


        def hidden_ships_grid
            grid = Marshal.load(Marshal.dump(@grid))

            grid.each_with_index do |row,idx1|
                row.each_with_index do |val,idx2|   
                    if val == :S
                        grid[idx1][idx2] = :N
                    end
                end
            end
            grid
        end
    end


    def self.print_grid(grid)

        grid.each do |row|
            row.each.each_with_index do |val,idx|
               if idx != row.length - 1
                   print "#{val} "
               else
                   print val
               end 
            end
            puts 
        end
    end


    def cheat
        Board.print_grid(@grid)
    end


    def print
        Board.print_grid(self.hidden_ships_grid)
    end
    
end
