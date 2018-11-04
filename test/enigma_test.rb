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
    offset = Offset.new(Date.today, "02715")
    encryption = Encryption.new
    output_message = encryption.rotate("hello world", offset.final_shift)
    output = @e.encrypt("hello world", "02715")
    date = Date.today.strftime('%d%m%y')
    expected = ({encryption: output_message, key: "02715", date: date})
    assert_equal expected, output
  end

  def test_it_can_encrypt_with_todays_date_and_random_key
    enigma = Enigma.new
    offset = Offset.new(Date.today)
    encryption = Encryption.new
    output_message = encryption.rotate("hello world", offset.final_shift)
    output = enigma.encrypt("hello world")
    date = Date.today.strftime('%d%m%y')
    key = offset.key
    expected = ({encryption: output_message, key: key, date: date})
    assert_equal expected, output
  end

end
