# require 'minitest/autorun'
# require 'minitest/pride'
require_relative './test_helper'
# require './lib/enigma'

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

  end

  # def test_it_can_encrypt_my_message
  #   my_message = "this is so secret ..end.."
  #   output_1 = @e.encrypt(my_message, "12345", Date.today)
  #   assert_equal '12345ljk', output_1
  #   output_2 = @e.encrypt(my_message)
  #   assert_equal '1234lkjuoiu', output_2
  # end


end
