require 'minitest/autorun'
require 'minitest/pride'
require_relative './test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end
end
