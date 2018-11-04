require 'date'
require './lib/offset'

class Enigma

  def encrypt(message, key = nil, date = Date.today)
    offset = Offset.new(date, key)
    encryption = Encryption.new
    new_key = key.nil? ? offset.key : key
    output_message = encryption.rotate(message, offset.final_shift)
    output_construction(output_message, new_key, date, :encryption)
  end

  def decrypt(message, key = nil, date = Date.today)
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
    output[:date] = formatted_date(date)
    output
  end

  def formatted_date(date)
    if date.class == Date
      date.strftime('%d%m%y')
    else
      date
    end
  end
end
