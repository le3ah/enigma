require 'date'

class Enigma

 def encrypt(message, key = "12345", date = Date.today)

 end

 def offset_by_date(date)
   date.strftime('%d%m%y').to_i ** 2
 end
end
