require "calculator"

describe Calculator do
  let(:c){Calculator.new}
  
  describe ".new" do
    it "should create a new instance of Calculator" do
      expect(c).to be_a Calculator
    end
  end

  describe "#add" do

    it "should add 2 negative numbers" do
      expect(c.add(-3,-5)).to eq(-8)
    end

    it "should add 2 float numbers" do
      expect(c.add(2.5,5.2)).to eq(7.7)
    end
  end

  describe "#subtract" do
    it "should subtract two negative numbers" do
      expect(c.subtract(-4,-10)).to eq(6)
    end

    it "should subtract 2 float numbers" do
      expect(c.subtract(5.2,1.4)).to be_within(0.01).of(3.8)
    end
  end

  describe "#multiply" do
    it "should multiply 2 numbers" do
      expect(c.multiply(2,-5)).to eq(-10)
    end

    it "should multiply 2 float numbers" do
      expect(c.multiply(2.5,3.1)).to eq(7.75)
    end
  end

  describe "#divide" do
    it "should divide 2 numbers" do
      expect(c.divide(96,3)).to eq(32)
    end

    it "should raise an error if divide by O" do
      expect{c.divide(15,0)}.to raise_error(ArgumentError)
    end

    it "should return and integer if no remainder" do
      expect(c.divide(10,5)).to be_a(Integer)
    end

    it "should return a float if there is a remainder" do
      expect(c.divide(10,3)).to be_a(Float)
    end
  end

  describe "#pow" do
    it "should calculate the power of 2 number" do
      expect(c.pow(2,3)).to eq(8)
    end

    it "should calculate the power of 2 float" do
      expect(c.pow(2.5,3.2)).to eq(2.5**3.2)
    end

    it "should calculate the power of negative number" do
      expect(c.pow(-5,-3)).to eq(-5**-3)
    end
  end

  describe "#sqrt" do
    it "should square root for positive numbers" do
      expect(c.sqrt(25)).to eq(5)
    end

    it "should return error for negative numbers" do
      expect{c.sqrt(-5)}.to raise_error(ArgumentError)
    end

    it "should return integer for round roots" do 
      expect(c.sqrt(9)).to be_a(Integer)
    end

    it "should return a 2 decimal rounded if non round roots" do 
      expect(c.sqrt(5)).to eq(Math.sqrt(5).round(2))
    end
  end

  describe "#memory=" do
    it "should overwrite the previous object in memory" do
      c.memory=(8)
      expect(c.memory).to eq(8)
    end
  end

  describe "#memory" do
    it "should read the memory" do
      c.memory = 10
      expect(c.memory).to eq(10)
    end

    it "should be nil at the start" do
      expect(c.memory).to eq(nil)
    end

    it "should be empty after read" do
      c.memory=(10)
      c.memory
      expect(c.memory).to eq(nil)
    end
  end

  describe "#stringify" do
    it "should be true if pass in arg" do
      c2 = Calculator.new(true)
      expect(c2.instance_variable_get(:@stringify)).to eq(true)
    end

    it "return should be a string" do
      c2 = Calculator.new(true)
      expect(c2.add(1,2)).to be_a(String)
    end
  end

end