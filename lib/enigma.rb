require 'date'

class Enigma
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

 def encrypt(message, key = "12345", date = Date.today)

 end



end
