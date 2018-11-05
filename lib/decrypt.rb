require './lib/enigma'
require './lib/encryption'
require './lib/decryption'
first, second, third, fourth = ARGV

encrypted = File.open(first, "r")
decrypted = File.open(second, "w")

variable = Enigma.new.decrypt(encrypted.read)
decrypted.write(variable[:decryption])
decrypted.close

p "Created #{second} with the key #{third} and date #{fourth}"
