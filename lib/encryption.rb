class Encryption
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def rotate(message, shift_value)
    message.tr(@character_set.to_s, @character_set.rotate(shift_value).to_s)
  end
end
