require_relative "../lib/frames.rb"

RSpec.describe Frames do

  let(:bowling) { Frames.new }

  it 'exists Frames class' do
    expect(Frames).to be_a Class
  end

  it 'matrix is not null' do
    bowling.matrix
    expect(bowling.score_table).to_not be nil
  end

  it 'roll one is equal or less than 10' do
    expect(bowling.one).to be <= 10
  end
  
  it "roll two is lower than roll one" do
    bowling.roll_one = 10
    expect(bowling.two).to be < bowling.roll_one
  end

  it "global score is equal or less than 200" do
    bowling.matrix
    expect(bowling.score_table[9][2]).to be <= 200
  end

end
