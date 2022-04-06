class Player

    def get_move
        print "enter a position with coordinates separated with a space like '4 7'"
    input = gets.chomp
    arr = input.split(" ")
    arr.each_with_index do |char,i|
        arr[i] = char.to_i
    end
    arr
    end

end
