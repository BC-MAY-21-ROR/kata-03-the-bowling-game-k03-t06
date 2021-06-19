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

class Main
  def initialize
  @score_table = []
  @score = 0
  end

  def matrix
    10.times do |i|
      @score_table.push([])
      @roll_one = rand(0..10)
      @roll_two = rand(0..(10-@roll_one))
      @suma = @roll_one + @roll_two
      @score += @suma
      3.times do |j|
          @score_table[i][j] = tiros(j)
      end
    end
  end

  def show
    10.times do |i|
      cadena = ''
      3.times do |j|
          cadena += @score_table[i][j].to_s + ' '
      end
      puts cadena
      puts ''
    end
  end

  def tiros(j)
    
    if  j == 0
      @roll_one
    elsif j == 1
      @roll_two
    else
      @score
    end 
  end

  def bonus
    9.times do |i|
      3.times do |j|
        
      end
    end
  end

  def bonus_temp(j)
    if  j == 0
      if  @score_table[i][j] == 10  #Strike
        puts 'bonus'
        v =  @score_table[i+1][j] + @score_table[i+1][j+1]
        puts v
        temp = @score_table[i][j+2]
        puts temp
        @score_table[i][j+2] = temp + v
    elsif j == 1
      #@roll_two
    else
      #@score
    end 
  end
    
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
end 

main = Main.new
main.matrix
main.show
main.bonus