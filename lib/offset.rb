class Offset
  def initialize
    @starting_alphabet = Hash.new(0)
    @encryption_alphabet = {}
  end
  def offset_by_date(date)
    date.to_i ** 2
  end

  def last_four_digits(date)
    offset_by_date(date).to_s.slice(-4..-1)
  end

  def a_offset(date)
    @encryption_alphabet = { A: last_four_digits(date)[0]}
  end

  def b_offset(date)
    @encryption_alphabet = { B: last_four_digits(date)[1]}
  end

  def c_offset(date)
    @encryption_alphabet = { C: last_four_digits(date)[2]}
  end

  def d_offset(date)
    @encryption_alphabet = { D: last_four_digits(date)[3]}
  end

  def key_generation
      rand(99999).to_s.rjust(5)
  end

  def key_start_values(random = nil)
    if random == nil
      random = key_generation
    end
    key_array = random.chars
      @starting_alphabet[:A] = key_array[0,2].join
      @starting_alphabet[:B] = key_array[1,2].join
      @starting_alphabet[:C] = key_array[2,2].join
      @starting_alphabet[:D] = key_array[3,2].join
      @starting_alphabet
  end
end
