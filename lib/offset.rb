require 'date'

class Offset
  attr_accessor :date, :key
  attr_reader :starting_alphabet,
              :encryption_alphabet,
              :final_shift
  def initialize(date = Date.today, key = nil)
    @starting_alphabet = Hash.new(0)
    @encryption_alphabet = {}
    @final_shift = {}
    @date = date
    @key = key
  end

  def offset_by_date_values
    if date.class == Date
      new_date = date.strftime('%d%m%y')
      new_date.to_i ** 2
    else
      date.to_i ** 2
    end
  end

  def last_four_digits_of_date_value
    offset_by_date_values.to_s.slice(-4..-1)
  end

  def create_offsets_from_date
    [:A, :B, :C, :D].each_with_index do |k, index|
      encryption_alphabet[k] = last_four_digits_of_date_value[index].to_i
    end
    encryption_alphabet
  end

  def key_generation
      rand(99999).to_s.rjust(5, '0')
  end

  def key_start_values
    if @key == nil
      @key = key_generation
    end
    key_array = @key.chars
      @starting_alphabet[:A] = key_array[0,2].join.to_i
      @starting_alphabet[:B] = key_array[1,2].join.to_i
      @starting_alphabet[:C] = key_array[2,2].join.to_i
      @starting_alphabet[:D] = key_array[3,2].join.to_i
      @starting_alphabet
  end

  def final_shift
    last_four_digits_of_date_value
    key_start_values
    create_offsets_from_date
    @starting_alphabet.map do |k, value|
      @final_shift[k] = value + encryption_alphabet[k]
    end
    @final_shift
  end
end
