require_relative './test_helper'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new
  end
  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_offset_by_date
    date = "040895"
    assert_equal 1672401025, @offset.offset_by_date(date)
  end

  def test_it_can_select_last_four_digits_of_offset
    skip
    date = Date.parse("August 4, 1995")
    @offset.offset_by_date(date)
    assert_equal 1025, @offset.last_four_digits
  end
end
