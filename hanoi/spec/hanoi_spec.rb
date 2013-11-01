require 'rspec'
require 'hanoi'

describe Towers do
  subject(:towers) { Towers.new }

  context "checks inital setup " do
    it "checks has 3 towers" do
       expect(towers.stacks.length).to eq(3)
    end

    context "#test that first is full others empty" do
      it "first has 3 rings" do
        expect(towers.stacks[0].length).to eq(3)
      end
      it "second has 0 rings" do
        expect(towers.stacks[1].length).to eq(0)
      end
      it "third has 0 rings" do
        expect(towers.stacks[2].length).to eq(0)
      end
    end

    it "#tower 1 is correctly stacked" do
      expect(towers.stacks[0].sort.reverse).to eq(towers.stacks[0])
    end

  end


  subject(:towers) {Towers.new}

  describe "#move_from" do
    before do
      towers.move_from(0)
    end
    it "pulls one ring from tower" do
      expect(towers.stacks[0].length).to eq(2)
    end
    it "should not access empty tower" do
      expect do
        towers.move_from(1)
      end.to raise_error(InvalidMoveError)
    end
  end

  describe "#move_to" do
    before do
      towers.move_from(0)
      towers.move_to(1)
    end
    it "puts current ring into tower" do
      expect(towers.stacks[1].length).to eq(1)
    end
    before do
      towers.move_from(0)
    end
    it "cannot place big ring on small ring" do
      expect do
        towers.move_to(1)
      end.to raise_error(InvalidMoveError)
    end
  end

  describe "#won?" do
    before do
      towers.stacks[1]= [3,2,1]
      towers.stacks[0] = []
    end
    it "returns if all rings are transferred to another tower" do
       towers.won? {should be_true }
    end
  end

  describe "#render" do
    it "returns string representation" do
       expect(towers.render).to eq("[[3, 2, 1], [], []]")
    end
  end

end

