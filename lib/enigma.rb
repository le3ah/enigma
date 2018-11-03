require 'date'

class Enigma
  attr_reader :character_set, :key, :date
  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = key
    @date = date
  end


  

  # def encrypt(message, key = "12345", date = Date.today)
  #  message_array = message.downcase.chars
  #  @key = key
  #  @date = date
  # end



end
