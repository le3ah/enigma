require 'date'
require './lib/offset'

class Enigma
  attr_reader :key, :date
  def initialize(date = Date.today)
    @key = key
    @date = date
  end

  def encrypt(message, key, date)
    @date = date
    @key = key
    offset = Offset.new(date, key)
    encryption = Encryption.new
    output_message = encryption.rotate(message, offset.final_shift)
    output = {}
    output[:encryption] = output_message
    output[:key] = key
    output[:date] = date
    output
  end



end
