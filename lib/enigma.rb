require 'date'
require './lib/offset'

class Enigma
  attr_reader :key, :date
  def initialize(date = Date.today)
    @key = key
    @date = date
  end


  def character_rotation(message)
    message_array = message.downcase.chars
    message_array.map do |char|
      index_position = @character_set.index(char)
      offset = Offset.new(date)
      new_index = offset.final_shift.map do |key, value|
        index_position + value
      end
      require 'pry'; binding.pry
      new_index.map do |new_i|
        @character_set.index(new_i)
      end
    end
  end


  # def encrypt(message, key = "12345", date = Date.today)
  #  message_array = message.downcase.chars
  #  @key = key
  #  @date = date
  # end



end
