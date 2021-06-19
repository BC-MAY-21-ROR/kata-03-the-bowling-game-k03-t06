require_relative "../lib/main.rb"

RSpec.describe Frames do

  let(:roll) { Frames.new(rand(0..10),0) }
  it 'exists Frames class' do
    expect(Frames).to be_a Class
  end

  it 'knock down less or equal than 10 pins in the first roll' do
    expect(roll.roll_one).to be <= 10
  end

  it 'need two rolls in one round' do
    expect(roll.second_roll).to be <= (10 - roll.roll_one)
  end

  it 'score less or equal than 10 with two rolls' do
    expect(roll.total_frame_score).to be <= 10
  end

  it 'do strike' do
    roll.roll_one = 10
    expect(roll.bonus(0)).to eql 'strike'
  end


end

# RSpec.describe Main do
#   it 'exists Main class' do
#     expect(Main).to be_a Class
#   end
# end