first, second, third, fourth = ARGV

encrypted = File.open(first, "r")
decrypted = File.open(second, "w")

encrypted.read
variable = Enigma.decrypt(encrypted.read)
decrypted.write(variable[:encrypted])
decrypted.close

p "Created #{second} with the key #{third} and date #{fourth}"
