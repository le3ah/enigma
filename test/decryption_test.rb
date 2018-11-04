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
end
