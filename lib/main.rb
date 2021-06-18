class Frames
  attr_accessor :roll_one
  attr_reader :roll_two
  attr_reader :total_score

  def initialize(roll_one, total_score)
    @roll_one = roll_one
    @roll_two = 0
    @total_score = total_score
  end
  
  def bonus
    if @roll_one == 10
      'strike'
      
    elsif (@roll_one + @roll_two) == 10
      'spare'
    else
      'no bonus'
    end
  end

  def second_roll
    if @roll_one < 10
      @roll_two = rand(0..(10-@roll_one))
    else
      @roll_two = 0
    end
  end

  def total_frame_score
      @total_score = (@roll_one + second_roll())
  end
end

# matriz =[[1,4,5],
#         [4,5,14],
#         [6,4,24],
#         [5,5,34],[10,0,],[],[],[],[],[]]

# class Main
#   score_table = []
#   10.times do |i|
#     2.times do |j|
      



    # score = 0
    # 10.times do |i|
    #     puts "#{i+=1} frame"
    #     roll = Frames.new(rand(0..10), score)
    #     puts("tiro 1: #{roll.roll_one}")
    #     roll.total_frame_score()
    #     puts("tiro 2: #{roll.roll_two}")
    #     puts(roll.bonus)
    #     puts(roll.total_score)
    #     score += roll.total_score
    #     puts "Global score = #{score}"
    #     puts ''
        
    # end
    # puts "Final Score: #{score}"
# end 