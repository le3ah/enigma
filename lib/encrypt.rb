require './lib/enigma'
require './lib/encryption'
first, second = ARGV

message = File.open(first, "r")
encrypted = File.open(second, "w")

message.read
require 'pry'; binding.pry
variable = Enigma.new.encrypt(message.read)
encrypted.write(variable[:encryption])
encrypted.close


p "Created #{second} with the key  #{variable[:key]} and date #{variable[:date]}"
