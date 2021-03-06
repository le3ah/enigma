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
    encrypted = @e.encrypt("hello world", "02715")
    date = Date.today.strftime('%d%m%y')
    expected = ({encryption: output_message, key: "02715", date: date})
    assert_equal expected, encrypted
  end

  def test_it_can_decrypt_with_todays_date
    offset = Offset.new(Date.today, "02715")
    encrypted = @e.encrypt("hello world", "02715")
    decryption = Decryption.new
    output_message = decryption.rotate(encrypted[:encryption], offset.final_shift)
    output = @e.decrypt(encrypted[:encryption], "02715")
    date = Date.today.strftime('%d%m%y')
    expected = ({decryption: output_message, key: "02715", date: date})
    assert_equal expected, output
  end

  def test_it_can_encrypt_with_todays_date_and_random_key
    enigma = Enigma.new
    offset = Offset.new(Date.today)
    encryption = Encryption.new
    message = "hello world"
    output_message = encryption.rotate(message, offset.final_shift)
    enigma.encrypt(message)
    date = Date.today.strftime('%d%m%y')
    key = offset.key
    expected = ({encryption: output_message, key: key, date: date})
    assert_equal true, expected[:encryption].length == message.length
    assert_equal false, expected[:key].nil?
  end

  def test_it_can_out_put_message_in_proper_format
    output = {encryption: 'go irish', key: '12345', date: '050287'}
    assert_equal output, @e.output_construction('go irish', '12345', '050287', :encryption)
  end

  def test_it_can_format_date_when_not_starting_as_string
    assert_equal String, @e.formatted_date(Date.today).class
    assert_equal 6, @e.formatted_date(Date.today).length
  end
end
