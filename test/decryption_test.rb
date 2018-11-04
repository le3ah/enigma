require_relative './test_helper'

class DecryptionTest < Minitest::Test
  def setup
    @decryption = Decryption.new
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_it_has_a_starting_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @decryption.character_set
  end

  def test_it_can_rotate_based_on_different_shifts
    shift_value = ({A: 3, B: 27, C: 73, D: 20})
    message_1 = 'keder'
    message_2 = 'keder ohulw'
    assert_equal 'hello', @decryption.rotate(message_1, shift_value)
    assert_equal 'hello world', @decryption.rotate(message_2, shift_value)
  end
end
