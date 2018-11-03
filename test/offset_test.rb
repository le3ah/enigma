require_relative './test_helper'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new('040895', '02715')
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_a_default_date_of_today
    offset_today = Offset.new
    today = Date.today
    assert_equal today, offset_today.date
  end

  def test_if_key_is_nil_random_key_generates
    offset_with_nil_key = Offset.new('040895', nil)
    assert_equal 4, offset_with_nil_key.key_start_values.length
  end

  def test_it_can_generate_offset_by_date_values
    assert_equal 1672401025, @offset.offset_by_date_values
  end

  def test_it_can_select_last_four_digits_of_offset
    @offset.offset_by_date_values
    assert_equal "1025", @offset.last_four_digits_of_date_value
  end

  def test_it_can_assign_a_offset
    @offset.offset_by_date_values
    @offset.last_four_digits_of_date_value
    assert_equal ({A: 1}), @offset.a_offset
  end

  def test_it_can_assign_b_offset
    @offset.offset_by_date_values
    @offset.last_four_digits_of_date_value
    assert_equal ({B: 0}), @offset.b_offset
  end

  def test_it_can_assign_c_offset
    @offset.offset_by_date_values
    @offset.last_four_digits_of_date_value
    assert_equal ({C: 2}), @offset.c_offset
  end

  def test_it_can_assign_d_offset
    @offset.offset_by_date_values
    @offset.last_four_digits_of_date_value
    assert_equal ({D: 5}), @offset.d_offset
  end

  def test_it_can_gather_offset_values
    @offset.offset_by_date_values
    @offset.last_four_digits_of_date_value
    @offset.a_offset
    @offset.b_offset
    @offset.c_offset
    @offset.d_offset
    assert_equal ({A: 1, B: 0, C: 2, D: 5}), @offset.encryption_alphabet
  end

  def test_it_can_generate_keys
    assert_equal 5, @offset.key_generation.length
  end

  def test_it_can_assign_key_start_values
    expected = ({A: 02, B: 27, C: 71, D: 15})
    assert_equal expected, @offset.key_start_values
    assert_equal 4, @offset.key_start_values.length
  end

  def test_it_can_find_final_shift_value
    @offset.last_four_digits_of_date_value
    @offset.key_start_values
    @offset.a_offset
    @offset.b_offset
    @offset.c_offset
    @offset.d_offset
    expected = ({A: 3, B: 27, C: 73, D: 20})
    assert_equal expected, @offset.final_shift
  end
end
