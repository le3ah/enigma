class Encryption
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def rotate(message, shift_value)
    message_array = message.downcase.chars
    message_array.map.with_index do |letter, index|
      next letter unless @character_set.include?(letter)
      if index == 0 || index % 4 == 0
        letter.tr(@character_set.to_s, @character_set.rotate(shift_value[:A]).to_s)
      elsif index % 4 == 1
        letter.tr(@character_set.to_s, @character_set.rotate(shift_value[:B]).to_s)
      elsif index % 4 == 2
        letter.tr(@character_set.to_s, @character_set.rotate(shift_value[:C]).to_s)
      else
        letter.tr(@character_set.to_s, @character_set.rotate(shift_value[:D]).to_s)
      end
    end.join
  end
end
