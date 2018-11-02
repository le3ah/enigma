require_relative './test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_has_a_starting_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @e.character_set
  end

  # def test_it_can_rotate_alphabet_by_final_shift
  #   @offset = Offset.new
  #   date = "040895"
  #   @offset.offset_by_date(date)
  #   @offset.last_four_digits(date)
  #   @offset.a_offset(date)
  #   @offset.b_offset(date)
  #   @offset.c_offset(date)
  #   @offset.d_offset(date)
  #   @offset.key_start_values('02715')
  #   @offset.final_shift
  #   message = "hello world"
  #
  # end

  # def test_it_can_encrypt_my_message
  #   message = "hello world"
  #   output = @e.encrypt(message, "02715", "040895")
  #   expected = ({encryption: "keder ohulw", key: "02715", date: "040895"})
  #   assert_equal expected, output
  # end


end
