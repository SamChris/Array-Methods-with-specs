require 'debugger'
class Array
  def my_uniq
    # return self if arr.length == 0

    uniq_arr = []
    self.each do |element|
      uniq_arr << element unless uniq_arr.include?(element)
    end

    uniq_arr

  end

  def two_sum
    return [] if self.length < 2
    arr = []
    (self.length-1).times do |i|
      (i+1...self.length).each do |couple|
        arr << [i,couple] if self[i] + self[couple] == 0
      end
    end

    arr
  end

  def stock_picker
    arr = []
    high = 0
    (self.length-1).times do |buy|
      (buy+1...self.length).each do |sell|
        if self[sell]-self[buy] >= high
          high = self[sell]-self[buy]
          arr = [buy,sell]
        end
      end
    end

    arr
  end

  def my_transpose
    arr = Array.new(self.length) {Array.new(self.length)}

    self.length.times do |x|
      self[x].length.times do |y|
        arr[y][x] = self[x][y]
      end
    end

    arr
  end

end