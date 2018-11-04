require 'date'
require './lib/offset'

class Enigma
  attr_reader :key, :date
  def initialize(date = Date.today)
    @key = key
    @date = date
  end

  # def encrypt(message, key = "12345", date = Date.today)
  #
  #  @key = key
  #  @date = date
  # end



end
