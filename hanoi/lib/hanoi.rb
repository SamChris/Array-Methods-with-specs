class Towers
  attr_accessor :stacks, :in_hand

  def initialize
    @stacks =Array.new(3){Array.new()}
    3.times {|i| @stacks[0].unshift(i+1)}
    @in_hand = nil
    # [], [], [] ]
  end

  def move_from(tower)
    raise InvalidMoveError if self.stacks[tower].empty?
    self.in_hand = self.stacks[tower].pop
  end

  def move_to(tower)
    unless stacks[tower].empty?
      raise InvalidMoveError if self.stacks[tower].last < self.in_hand
    end
    self.stacks[tower].push(in_hand)
  end

  def move(t1,t2)
    move_from(t1)
    move_to(t2)
  end

  def render
    self.stacks.to_s
  end

  def loop
    puts render
    puts "move?ie(1,2)"
    input = gets.chomp
    move(input.split(',')[0],input.split(',')[1])
    loop unless won?
  end


  def won?
    return self.stacks[0].empty? && (self.stacks[1].length ==3 ||
     self.stacks[2].length == 3)
  end

end

class InvalidMoveError < ArgumentError
end


