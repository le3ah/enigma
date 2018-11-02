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
    date = "040895"
    @offset.offset_by_date(date)
    assert_equal "1025", @offset.last_four_digits(date)
  end

  def test_it_can_assign_a_offset
    date = "040895"
    @offset.offset_by_date(date)
    @offset.last_four_digits(date)
    assert_equal ({A: "1"}), @offset.a_offset(date)
  end

  def test_it_can_assign_b_offset
    date = "040895"
    @offset.offset_by_date(date)
    @offset.last_four_digits(date)
    assert_equal ({B: "0"}), @offset.b_offset(date)
  end

  def test_it_can_assign_c_offset
    date = "040895"
    @offset.offset_by_date(date)
    @offset.last_four_digits(date)
    assert_equal ({C: "2"}), @offset.c_offset(date)
  end

  def test_it_can_assign_c_offset
    date = "040895"
    @offset.offset_by_date(date)
    @offset.last_four_digits(date)
    assert_equal ({D: "5"}), @offset.d_offset(date)
  end
end
