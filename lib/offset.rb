class Offset
  attr_reader :encryption_alphabet, :final_shift, :date
  def initialize(date = Date.today, key = nil)
    @starting_alphabet = Hash.new(0)
    @encryption_alphabet = {}
    @final_shift = {}
    @date = date
    @key = key
  end
  def offset_by_date_values
    date.to_i ** 2
  end

  def last_four_digits_of_date_value
    offset_by_date_values.to_s.slice(-4..-1)
  end

  def a_offset
    encryption_alphabet[:A] = last_four_digits_of_date_value[0].to_i
    encryption_alphabet
  end

  def b_offset
    encryption_alphabet[:B] = last_four_digits_of_date_value[1].to_i
    encryption_alphabet
  end

  def c_offset
    encryption_alphabet[:C] = last_four_digits_of_date_value[2].to_i
    encryption_alphabet
  end

  def d_offset
    encryption_alphabet[:D] = last_four_digits_of_date_value[3].to_i
    encryption_alphabet
  end

  def key_generation
      rand(99999).to_s.rjust(5)
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
    a_offset
    b_offset
    c_offset
    d_offset
    @starting_alphabet.map do |k, value|
      @final_shift[k] = value + encryption_alphabet[k]
    end
    @final_shift
  end
end
