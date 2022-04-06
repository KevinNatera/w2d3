class Human_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end


    def get_position
        puts "It's player #{@mark}'s turn. Enter two numbers with a space in between to indicate position. eg.'2 1' "
    input = gets.chomp
    arr = input.split(" ")
    if arr.length != 2
        raise "Error! Invalid input!"
    end

    arr.each_with_index do |num,i|
        arr[i] = num.to_i
    end
    arr
    end

end
