class Offset
  def initialize
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
end
