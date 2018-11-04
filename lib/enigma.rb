require 'date'
require './lib/offset'

class Enigma

  def encrypt(message, key = nil, date = Date.today)
    @date = date
    @key = key
    offset = Offset.new(date, key)
    encryption = Encryption.new
    output_message = encryption.rotate(message, offset.final_shift)
    output_construction(output_message, key, date, :encryption)
  end

  def decrypt(message, key = nil, date = Date.today)
    @date = date
    @key = key
    offset = Offset.new(date, key)
    decryption = Decryption.new
    output_message = decryption.rotate(message, offset.final_shift)
    output_construction(output_message, key, date, :decryption)
  end

  private
  def output_construction(output_message, key, date, flag)
    output = {}
    if flag == :decryption
      output[:decryption] = output_message
    else
      output[:encryption] = output_message
    end
    output[:key] = key
    output[:date] = date
    output
  end

end
