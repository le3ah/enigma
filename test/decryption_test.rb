require_relative './test_helper'

class DecryptionTest < Minitest::Test
  def setup
    @decryption = Decryption.new
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end
end
