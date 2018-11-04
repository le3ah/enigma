require_relative './test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_can_encrypt_my_message
    message = "hello world"
    output = @e.encrypt(message, "02715", "040895")
    expected = ({encryption: "keder ohulw", key: "02715", date: "040895"})
    assert_equal expected, output
  end

  def test_it_can_decrypt_my_message
    message = "keder ohulw"
    output = @e.decrypt(message, "02715", "040895")
    expected = ({decryption: "hello world", key: "02715", date: "040895"})
    assert_equal expected, output
  end

  def test_it_can_encrypt_with_todays_date
    output = @e.encrypt("hello world", "02715")
    expected = ({encryption: "snddziogbuw", key: "02715", date: "041118"})
    assert_equal expected, output
  end

end
