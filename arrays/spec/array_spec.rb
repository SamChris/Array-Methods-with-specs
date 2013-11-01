require 'rspec'
require 'array'


describe "#my_uniq" do
  it "solves a empty case" do
    [].my_uniq.should == []
  end
  it "returns unique array" do
    [1, 3, 0, 1].my_uniq.should == [1,3,0]
  end
end

describe "#two_sum" do
  it "solves empty case" do
    [].two_sum.should == []
  end
  it "returns indexs of pair of elements whose sum is 0" do
    [1, -1, 2, -2].two_sum.should == [[0,1],[2,3]]
  end
end

describe "#my_transpose" do
  it "solves empty case" do
    [].my_transpose.should == []
  end
  it "return array of columns switched to rows" do
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]].my_transpose.should ==
     [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end
end

describe "#stock_picker" do
  it "returns the best profitable days" do
    [5, 17, 22, 3, 8, 7].stock_picker.should ==
    [0, 2]
  end
end











