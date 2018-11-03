require_relative './test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
    @today = Date.today
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_has_a_default_date_of_today
    assert_equal @today, @e.date
  end



  def test_it_can_rotate_alphabet_by_final_shift
    enigma = Enigma.new('040895')
    offset = Offset.new('040895', '02715')
    offset.final_shift
    message = "hello world"
    assert_equal "keder ohulw", enigma.character_rotation(message)
  end

  # def test_it_can_encrypt_my_message
  #   message = "hello world"
  #   output = @e.encrypt(message, "02715", "040895")
  #   expected = ({encryption: "keder ohulw", key: "02715", date: "040895"})
  #   assert_equal expected, output
  # end


end
