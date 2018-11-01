require 'minitest/autorun'
require 'minitest/pride'
require_relative './test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
  end
  def test_it_exists
    assert_instance_of Enigma, @e
  end

  # def test_it_can_encrypt_my_message
  #   my_message = "this is so secret ..end.."
  #   output_1 = @e.encrypt(my_message, "12345", Date.today)
  #   assert_equal '12345ljk', output_1
  #   output_2 = @e.encrypt(my_message)
  #   assert_equal '1234lkjuoiu', output_2
  # end

  def test_it_can_offset_by_date
    date = Date.parse("August 4, 1995")
    assert_equal 1672401025, @e.offset_by_date(date)
  end

  def test_it_can_select_last_four_digits_of_offset
    date = Date.parse("August 4, 1995")
    @e.offset_by_date(date)
    assert_equal 1025, @se.last_four_digits
  end
end
