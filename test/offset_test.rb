require_relative './test_helper'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new
    assert_instance_of Offset, offset 
  end
end
