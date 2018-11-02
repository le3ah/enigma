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
    assert_equal ({A: 1}), @offset.a_offset(date)
  end

  def test_it_can_assign_b_offset
    date = "040895"
    @offset.offset_by_date(date)
    @offset.last_four_digits(date)
    assert_equal ({B: 0}), @offset.b_offset(date)
  end

  def test_it_can_assign_c_offset
    date = "040895"
    @offset.offset_by_date(date)
    @offset.last_four_digits(date)
    assert_equal ({C: 2}), @offset.c_offset(date)
  end

  def test_it_can_assign_c_offset
    date = "040895"
    @offset.offset_by_date(date)
    @offset.last_four_digits(date)
    assert_equal ({D: 5}), @offset.d_offset(date)
  end

  # def test_it_can_gather_offset_values
  #   date = "040895"
  #   @offset.offset_by_date(date)
  #   @offset.last_four_digits(date)
  #   @offset.a_offset(date)
  #   @offset.b_offset(date)
  #   @offset.c_offset(date)
  #   @offset.d_offset(date)
  #   @offset.gather_offset_values
  #   assert_equal ({A: })
  # end

  def test_it_can_generate_keys
    assert_equal 5, @offset.key_generation.length
  end

  def test_it_can_assign_key_start_values
    expected = ({A: '02', B: '27', C: '71', D: '15'})
    assert_equal expected, @offset.key_start_values('02715')
    assert_equal 4, @offset.key_start_values.length
  end

  # def test_it_can_find_final_shift_value
  #   date = "040895"
  #   @offset.last_four_digits(date)
  #   @offset.key_start_values('02715')
  #   expected = ({A: 3, B: 27, C: 73, D: 20})
  #   assert_equal expected, @offset.final_shift
  # end
end
