# frozen_string_literal: true

# require_relative 'frames'

# Clase encargada de llevar puntaje y bonus
class Score
  # frames = Frames.new

  def initialize(score_table)
    @score_table = score_table
  end

  def bonus
    bonus = 0
    9.times do |round|
      3.times do |columns|
        if columns.zero?
          temp_roll_one = @score_table[round][columns]
          if temp_roll_one == 10 # Saber si es un strike
            bonus = @score_table[round + 1][columns] + @score_table[round + 1][columns + 1]
          elsif (temp_roll_one != 10) && (temp_roll_one + @score_table[round][columns + 1]) == 10 # Saber si es un spare
            bonus = @score_table[round + 1][columns]
          end
          if bonus != 0
            score = @score_table[round][columns + 2]
            @score_table[round][columns + 2] = bonus + score
            suma_matriz(bonus, round + 1)
          end
        end
        bonus = 0
      end
    end
  end

  # Hacer la actualizacion de puntos en caso de haber bonus
  def suma_matriz(bonus, round)
    (round..10).each do |columns|
      @score_table[columns] ||= []
      3.times do |x|
        if x.zero?
          score = @score_table[columns][x + 2].to_i
          @score_table[columns][x + 2] = bonus + score
        end
      end
    end
  end
end
