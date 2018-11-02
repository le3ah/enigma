first, second = ARGV

message = File.open(first, "r")
encrypted = File.open(second, "w")

message.read
variable = Engima.encrypt(message.read)
encrypted.write(variable[:message])
encrypted.close


p "Created #{second} with the key  #{variable[:key]} and date #{variable[:date]}"
