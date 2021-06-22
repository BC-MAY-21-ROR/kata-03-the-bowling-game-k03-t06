# frozen_string_literal: true

require_relative 'score'

# Clase para crear matriz y llenar
class Frames
  attr_accessor :score_table, :roll_one, :roll_two

  def initialize
    @score_table = []
    @score = 0
    @roll_one = 0
    @roll_two = 0
    @roll_three = 0
  end

  # metodo que crea los frames
  def matrix
    10.times do |round|
      @score_table.push([])
      rolls
      if round == 9 && @suma == 10
        if @suma == 10
          @roll_three = rand(0..10)
          @score += @roll_three
          llenado(4, round)
        end
      else
        llenado(3, round)
      end
    end
    bonus = Score.new(@score_table)
    bonus.bonus
  end

  # metodo que llena los frames
  def llenado(numero, round)
    numero.times do |columns|
      @score_table[round][columns] = tiros(columns)
    end
  end

  def rolls
    one
    two
    @roll_three = 0
    @suma = @roll_one + @roll_two
    @score += @suma
  end

  def one
    @roll_one = rand(0..10)
  end

  def two
    @roll_two = rand(0..(10 - @roll_one))
  end

  # Metodo que muestra los frames
  def show
    10.times do |round|
      @cadena = ''
      if round == 9
        show_auxiliar(4, round, @cadena)
      else
        show_auxiliar(3, round, @cadena)
      end
      puts "#{@cadena}\n"
    end
  end

  def show_auxiliar(numero, round, _cadena)
    numero.times do |columns|
      if columns == 2
        @cadena += "Total: #{@score_table[round][columns]} "
      else
        @cadena += "Tiro #{columns + 1}: #{@score_table[round][columns]} "
      end
    end
  end

  # Metodo switch para rellenar la matriz
  def tiros(columns)
    case columns
    when 0
      @roll_one
    when 1
      @roll_two
    when 2
      @score
    else
      @roll_three
    end
  end
end
