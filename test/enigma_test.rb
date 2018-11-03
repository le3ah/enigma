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

  def test_it_can_rotate_alphabet_by_final_shift
    message = "hello world"
    assert_equal "keder ohulw", @e.character_rotation(message)
  end

  # def test_it_can_encrypt_my_message
  #   message = "hello world"
  #   output = @e.encrypt(message, "02715", "040895")
  #   expected = ({encryption: "keder ohulw", key: "02715", date: "040895"})
  #   assert_equal expected, output
  # end


end
